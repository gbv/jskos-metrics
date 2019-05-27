#!/usr/bin/env perl
use v5.14;
use JSON::PP qw(decode_json);

my %narrower;
my @queue;

while (<>) {
    my $concept = decode_json($_);
    my $uri     = $concept->{uri};
    my $broader = $concept->{broader};

    my @uris = $broader ? map { $_->{uri} } @$broader : ();
    if (@uris) {
        push @{ $narrower{$_} //= [] }, $uri for @uris;
    }
    else {
        push @queue, $uri;
    }
}

say STDERR "# calculating levels...";

# mark roots as visited
my %level = map { $_ => 0 } @queue;
my @histogram = ($#queue);

# breadth-first search
while (@queue) {
    my $uri   = shift @queue;
    my $depth = $level{$uri} + 1;

    for ( @{ $narrower{$uri} // [] } ) {
        next if exists $level{$_};
        $level{$_} = $depth;
        $histogram[$depth]++;
        push @queue, $_;
    }
}

say JSON::PP->new->canonical->encode(
    { map { $_ => 1 * $histogram[$_] } 0 .. ( $#histogram - 1 ) } );

#!/usr/bin/env perl
use v5.14.1;
use JSON::PP;

sub lines {
    local ( @ARGV, $/ ) = $_[0];
    split "\n", <>;
}

my @schemes = lines("schemes.csv");

my $mappings = {};
for ( lines("concordances.csv") ) {
    my ( $from, $to, $count ) = split ",", $_;
    $mappings->{$from}{$to} = $count;
}

my $names = {};

for ( lines("concordances.ndjson") ) {
    my $c = decode_json($_);
    $names->{ $c->{fromScheme}{uri} } //= $c->{fromScheme}{notation}->[0];
    $names->{ $c->{toScheme}{uri} }   //= $c->{toScheme}{notation}->[0];
}

say join ',', '', map { $names->{$_} } @schemes;

for my $from (@schemes) {
    print $names->{$from} . ",";
    for my $to (@schemes) {
        print $mappings->{$from}{$to};
        print ",";
    }
    print "\n";
}

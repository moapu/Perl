#!/usr/bin/perl

use 5.18.0;
use warnings;
use strict;
$| = 1;

say "\n============ START ============\n";

while ( <> )
{
    # take one input line at a time
    chomp;
    if ( /match/ )
    {
        say "\n------- MATCH FOUND -----------\n";
        print "Matched: | $`<$&>$' |\n"; # the special match vars
        say "\n------- MATCH FOUND -----------\n";
    }
    else
    {
        say "\n--------- NOT FOUND -----------\n";
        print "No match: |$_|\n";
        say "\n--------- NOT FOUND -----------\n";
    }
}

say "\n============ E N D ============";
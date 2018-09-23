use strict;
use warnings FATAL => 'all';

open( FILE, "<H:\/Desktop\/regex_quizlet.txt" ) || die "File not found";
my @lines = <FILE>;
close( FILE );

my @newlines;
foreach ( @lines )
{
    if ( s/([a-e]\).*)([a-e]\).*)([a-e]\).*)([a-e]\).*)([a-e]\))/$1\n$2\n$3\n$4\n$5/sg )
    {
        &search_replace();

    } elsif ( s/([a-e]\).*)([a-e]\).*)([a-e]\).*)([a-e]\))/$1\n$2\n$3\n$4/sg )
    {
        &search_replace();

    } elsif ( s/([a-e]\).*)([a-e]\).*)([a-e]\))/$1\n$2\n$3/sg )
    {
        &search_replace();

    } elsif ( s/([a-e]\).*)([a-e]\))/$1\n$2/sg )
    {
        &search_replace();
    } else
    {
        &search_replace();
    }
}

sub search_replace
{
    # Format Example:
    # ===============

    #     ;02) The Earth’s axis is always tilted at an angle of _________ degrees to the plane of the ecliptic.
    #
    #     a) 15
    #     b) 23.5
    #     c) 33.3
    #     d) 66.5
    #     e) 90
    # ===============

    s/^(a\))/\n$1/g;
    s/^Answer: ([a-e])?//g;
    s/^(\d{1,2}\))/\;$1/g;
    s/^(;\d{1,2})/\n$1/g;
    push( @newlines, $_ )
}

# Rewrite to the FILE
# change the file path to write in a different file
open( FILE, ">H:\/Desktop\/regex_quizlet.txt" ) || die "File not found";
print FILE @newlines;
close( FILE );
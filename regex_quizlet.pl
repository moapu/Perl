use strict;
use warnings FATAL => 'all';

open( FILE, "<H:\/Desktop\/regex_quizlet.txt" ) || die "File not found";
my @lines = <FILE>;
close( FILE );

my @newlines;
foreach ( @lines )
{
    if ( $_ =~ s/([a-e]\).*)([a-e]\).*)([a-e]\).*)([a-e]\).*)([a-e]\))/$1\n$2\n$3\n$4\n$5/sg )
    {
        &search_replace();

    } elsif ( $_ =~ s/([a-e]\).*)([a-e]\).*)([a-e]\).*)([a-e]\))/$1\n$2\n$3\n$4/sg )
    {
        &search_replace();

    } elsif ( $_ =~ s/([a-e]\).*)([a-e]\).*)([a-e]\))/$1\n$2\n$3/sg )
    {
        &search_replace();

    } elsif ( $_ =~ s/([a-e]\).*)([a-e]\))/$1\n$2/sg )
    {
        &search_replace();
    } else
    {
        &search_replace();
    }
}

sub search_replace
{
    s/^(a\))/\n$1/g;
    s/^Answer: ([a-e])?//g;
    s/^(\d{1,2}\))/\;$1/g;
    s/^(;\d{1,2})/\n$1/g;
    push( @newlines, $_ )
}

# print @newlines;

open( FILE, ">H:\/Desktop\/regex_quizlet.txt" ) || die "File not found";
print FILE @newlines;
close( FILE );
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
        $_ =~ s/^(a\))/\n$1/sg;
        $_ =~ s/^Answer: [a-e]//sg;
        $_ =~ s/^(\d{1,2}\))/\;$1/sg;
        $_ =~ s/^(;\d{1,2})/\n$1/sg;
        push( @newlines, $_ )

    } elsif ( $_ =~ s/([a-e]\).*)([a-e]\).*)([a-e]\).*)([a-e]\))/$1\n$2\n$3\n$4/sg )
    {
        $_ =~ s/^(a\))/\n$1/sg;
        $_ =~ s/^Answer: [a-e]//sg;
        $_ =~ s/^(\d{1,2}\))/\;$1/sg;
        $_ =~ s/^(;\d{1,2})/\n$1/sg;
        push( @newlines, $_ )

    } elsif ( $_ =~ s/([a-e]\).*)([a-e]\).*)([a-e]\))/$1\n$2\n$3/sg )
    {
        $_ =~ s/^(a\))/\n$1/sg;
        $_ =~ s/^Answer: [a-e]//sg;
        $_ =~ s/^(\d{1,2}\))/\;$1/sg;
        $_ =~ s/^(;\d{1,2})/\n$1/sg;
        push( @newlines, $_ )

    } elsif ( $_ =~ s/([a-e]\).*)([a-e]\))/$1\n$2/sg )
    {
        $_ =~ s/^(a\))/\n$1/sg;
        $_ =~ s/^Answer: [a-e]//sg;
        $_ =~ s/^(\d{1,2}\))/\;$1/sg;
        $_ =~ s/^(;\d{1,2})/\n$1/sg;
        push( @newlines, $_ )

    } else
    {
        $_ =~ s/^(a\))/\n$1/sg;
        $_ =~ s/^Answer: ([a-e])?//sg;
        $_ =~ s/^(\d{1,2}\))/\;$1/sg;
        $_ =~ s/^(;\d{1,2})/\n$1/sg;
        push( @newlines, $_ )
    }
}

# print @newlines;

open( FILE, ">H:\/Desktop\/regex_quizlet.txt" ) || die "File not found";
print FILE @newlines;
close( FILE );
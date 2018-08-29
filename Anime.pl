#!/usr/bin/perl -w

# =============
# P R A G M A S
# =============
use 5.18.0;
use warnings;
use strict;
use LWP::UserAgent;

# ===============================
# G L O B A L _ V A R I A B L E S
# ===============================
my @anime_list =
    (
        "Black Clover",
        "Boku no Hero",
        "Boruto",
        "Overlord III",
        "Hanebado",
        "One Piece",
		"Shingeki no Kyojin",
        "Dragon Ball",
        "Killing Bites",
        "Highschool DxD",
        "Nanatsu no Taizai",
    );

my $ua = LWP::UserAgent->new;
$ua->timeout( 120 );
my $url = 'http://www.animerush.tv/';
my %already_displayed;
my $dash_format = sprintf( "+" . "-" x 20 . "+" . "-" x 11 . "+" . "-" x 12 . "+\n" );

# =============
# M E T H O D S
# =============
sub animerush_method
{
    my $request = new HTTP::Request( 'GET', $url );
    my $response = $ua->request( $request );
    my $content = $response->content();

    # exits the program if internet is not active
    die "Check YO Internet \n" if $content =~ /^Can't/;

    foreach ( @anime_list )
    {
        # if the item is shown already
        # it is skipped
        next if ( exists $already_displayed{$_} );

        # if matches this 'Regular Expression'
        # print it to the console

        # Ex -
        # +-------------------+-----------+--------------+
        # | One Piece         | Ep -> 838 |  2 days ago  |
        # +-------------------+-----------+--------------+

        if ( $content =~ /\d{1,3}\/">$_.*?Episode (\d{1,3})<\/a><\/h3>.*?(\d{1,2}) (days?|hours?|minutes?) (?:ago)/s )
        {
            # adds it to already seen hash
            # if it's a match
            $already_displayed{$_} = 1;
            printf "| %-18s | Ep -> %3s | %2d %-8s|\n", $_, $1, $2, $3;
            print $dash_format;
        }
    }
}

# =======
# M A I N
# =======
print $dash_format;

# Infinite loop
while ( 1 )
{
    &animerush_method;

    # re-runs in every N min
    # 600 == 10 min
    select( undef, undef, undef, 600 );
}



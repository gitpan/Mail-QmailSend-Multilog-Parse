use Test::More tests => 1;

use Mail::QmailSend::Multilog::Parse;
use Data::Dumper;

my @items;
my $parser = Mail::QmailSend::Multilog::Parse->new(callback => sub { push @items, @_; });

open DATA, "testin/data.log";
$parser->parse(\*DATA);
close DATA;

is($#items, 70, "works");

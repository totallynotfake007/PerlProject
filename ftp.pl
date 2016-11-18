use 5.24.0;
use strict;
use warnings; 
use Net::FTP;

say "Enter Host server name:";
my $host = <STDIN>; #"server38.000webhost.com";
say "Enter user name:";
my $username = "harshil";#<STDIN>;	#"a5619188";
say "Enter password:";
my $password = "xampp";#<STDIN>; #"WhySoSerious?";

my $ftp = Net::FTP->new($host) or die "Cannot connect to $host\n";
$ftp->login($username, $password) or die "Cannot log $username in\n";

my $default_dir = "/tempftp";
$ftp->cwd($default_dir) or die "Cannot change working directory to $default_dir\n";

$, = "\n";
my @files = $ftp->ls;
print @files, "\n";

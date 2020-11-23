# Strip paths from generated IDL headers that could be installed
use strict;
use warnings;

use File::Find qw/find/;
use Cwd qw/abs_path/;

my $srcdir = abs_path($ARGV[0]);
my $srcdir_re = quotemeta($srcdir);

sub path_func {
    my $path = $_;
    return if (!-T $path);
    open(my $file, "+<$path") or die("Could not open $path: $!");
    my $lines = "";
    while (my $line = <$file>) {
        $line =~ s/$srcdir_re\/?//g;
        $lines .= $line;
    }
    seek($file, 0, 0);
    print $file $lines;
    truncate($file, tell($file));
    close($file);
}

find({wanted => \&path_func, follow => 0, no_chdir => 1}, abs_path("."));

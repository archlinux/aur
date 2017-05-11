#!/usr/bin/perl

# This is a copy of the perl script in bamfdaemon.postinst from Ubuntu's bamf
# packaging

use File::Find;

my $dir_name;

sub strip_exec {
  my $f = $_;
  return unless $f =~ /\.desktop$/;
  return unless ("$File::Find::dir" eq "$dir_name");
  my @lines;
  open F, $f;
  @lines = <F>;
  close F;
  my $in_desktop_entry = 0;
  foreach (@lines) {
    if (/^\[\s*(.+)\s*\]/) {
      $in_desktop_entry = ($1 eq "Desktop Entry");
    }
    if (/^Exec=(.+)$/ && $in_desktop_entry) {
      print "$f\t$1\n";
    }
  }
}

$dir_name = $ARGV[-1];
$dir_name = $1 if ($dir_name =~ /(.*)\/$/);
find (\&strip_exec, $dir_name);

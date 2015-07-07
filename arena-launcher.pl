#!/usr/bin/perl
use warnings;
use strict;

#=================================================================================
#  Arena Launcher
#=================================================================================
#
#  This launcher should work, but I cannot guarantee that,
#  it was written on Arch Linux and not tried anywhere else
#  if you want to use it on other system, adjust configuration
#  below and keep your fingers crossed!
#
#  Run it with "--help" option to get help.
#
#  Remember that you use it at your own risk :-)

#=================================================================================
#  License
#=================================================================================
# Copyright (C) 2011 by Andrzej Giniewicz <gginiu@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#=================================================================================
#  Configuration variables
#=================================================================================
my $user_group = 'games';
my $arena_path = "/usr/share/games/arena";
my $license = "/usr/share/licenses/arena/license";
my $dosbox = "/usr/bin/dosbox";
my $dosbox_config = "arena.conf";
my $arena_dir = "ARENA";
my $license_lock = "terms-accepted";
my $passwords_file = "passwords.txt";

#=================================================================================
#  Declarations and description of available functions
#=================================================================================

# check if terms of use were accepted
#   no arguments
#   returns boolean
sub terms_accepted;

# get terms of use
#   no arguments
#   returns array of lines
sub get_terms;

# accept terms of use
#   no arguments
#   no return value
sub accept_terms;

# run Arena, requires that terms of use are already accepted
#   no arguments
#   no return value
sub run_arena;

# run sound setup utility
#   no arguments
#   no return value
sub run_setup;

#=================================================================================
#  Gory details :-)
#=================================================================================

use File::Copy qw(copy move);
use File::Find qw(find);
use File::Path qw(remove_tree);
use File::Spec::Functions qw(catfile);
use List::Util qw(min max);

my $gid = getgrnam($user_group);

sub terms_accepted
{
	return ( -e catfile($arena_path, $license_lock) );
}

sub accept_terms
{
	my $file = catfile($arena_path, $license_lock);
	open(FILE, ">$file") or die "Cannot create license lock";
	close(FILE);
	chmod 0664, $file;
	chown -1, $gid, $file;
}

sub get_terms
{
	open(FILE, "<$license") or die "Cannot open license";
	my @text = <FILE>;
	close(FILE);
	return @text;
}

sub get_passwords
{
	my $file = catfile($arena_path, $passwords_file);
	open(FILE, "<$file") or die "Cannot open passwords file";
	my @text = <FILE>;
	close(FILE);
	return @text;
}

sub fix_dirs;
sub fix_dirs
{
	my $path = shift;
	chmod 0775, $path;
	chown -1, $gid, $path;
	opendir(DIR, $path) or die "Cannot access target directory";
	my @files = readdir(DIR);
	closedir(DIR);
	@files = grep(!/\./, @files);
	foreach my $file (@files) {
		my $full = catfile($path, $file);
		if ( -d $full) {
			fix_dirs $full;
		} else {
			chmod 0664, $full;
			chown -1, $gid, $full;
		} 
	}
}

sub run_dosbox
{
	my ($app, $exit) = @_;
	terms_accepted or die "Terms of usage not accepted";
	my $run = catfile($arena_path, $arena_dir, $app);
	( -e $run) or die "Cannot find requested application";
	my $cfg = catfile($arena_path, $dosbox_config);
	( -e $cfg) or die "Cannot find dosbox config file";
	if ($exit) {
		system($dosbox." ".$run." -exit -conf ".$cfg);
	} else {
		system($dosbox." ".$run." -conf ".$cfg);
	}
	fix_dirs catfile($arena_path, $arena_dir);
}

sub run_arena
{
	run_dosbox "ARENA.BAT", 1;
}

sub run_setup
{
	run_dosbox "INSTALL.EXE", 1;
}

#=================================================================================
#  Command line interface, options parsing
#=================================================================================

use Getopt::Long;

my $opt_run_arena=1;
my $opt_force_run_arena=0;
my $opt_help=0;
my $opt_accept_terms=0;
my $opt_run_setup=0;
my $opt_show_passwords=0;

Getopt::Long::Configure('pass_through');
GetOptions (
	'help' => \$opt_help,
	'accept-terms' => \$opt_accept_terms,
	'run-arena' => \$opt_force_run_arena,
	'run-setup' => \$opt_run_setup,
	'show-passwords' => \$opt_show_passwords,
);

if ($#ARGV >= 0) {
	foreach my $arg (@ARGV) {
		print "Unknown option: $arg\n";
	}
	$opt_help = 1;
}

#=================================================================================
#  Command line interface, commands
#=================================================================================

if ($opt_help) {
	print
"
The Elder Scrolls: Arena launcher

usage:
  arena [options]

available conflicting options:

  --run-setup        run the sound setup utility
  --run-arena        when any option is specified Arena will not be started by
                     launcher. This options forces start of game when all other
                     tasks are finished
  --show-passwords   show the spell costs, answers to copy-protection questions

  --accept-terms     accept Arena terms of use

  --help             display this help message
";
	exit;
}

if ($opt_accept_terms) {
	$opt_run_arena=0;
	accept_terms;
}

if ($opt_run_setup) {
	$opt_run_arena=0;
	run_setup;
}

if ($opt_show_passwords) {
	$opt_run_arena=0;
	foreach (get_passwords) { print $_ }
}

$opt_run_arena or $opt_force_run_arena or exit;

if ( ! terms_accepted ) {
	foreach (get_terms) { print $_ }
	my $ans = 0;
	until ($ans =~ /yes|no/) {
		print "Do you accept the license? (yes/no) ";
		$ans = <>;
		($ans =~ /yes|no/) or print "Please answer with \"yes\" or \"no\"\n";
	}
	if ($ans =~ /yes/) {
		accept_terms
	} else {
		print "You should uninstall Arena at once!\n";
		exit
	}
}

run_arena;


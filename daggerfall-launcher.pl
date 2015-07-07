#!/usr/bin/perl
use warnings;
use strict;

#=================================================================================
#  Daggerfall Launcher
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
my $daggerfall_path = "/usr/share/games/daggerfall";
my $license = "/usr/share/licenses/daggerfall/license";
my $dosbox = "/usr/bin/dosbox";
my $dosbox_config = "dagger.conf";
my $daggerfall_dir = "DAGGER";
my $palettes_dir = "palettes";
my $license_lock = "terms-accepted";
my $save_backup_dir = "save-backups";
my $archive_type = ".tar.xz";
my $archiver_pack = "tar -cJf 'ARCHIVE' *";
my $archiver_unpack = "tar -xJf 'ARCHIVE'";
my $mods_dir = "mods";
my $mod_backup_dir = "modbackup";

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

# run Daggerfall, requires that terms of use are already accepted
#   no arguments
#   no return value
sub run_daggerfall;

# run sound setup utility
#   no arguments
#   no return value
sub run_setup;

# run save fixing utility
#   no arguments
#   no return value
sub run_fixsave;

# run map fixing utility
#   no arguments
#   no return value
sub run_fixmaps;

# get brightness increase in steps
# (0 steps = no change; 1 step = multiply gamma by 1.1, 2 steps = multiply gamma by 1.2, etc)
#   no arguments
#   returns number
sub get_brightness;

# set brightness increase in steps
# (0 steps = no change; 1 step = multiply gamma by 1.1, 2 steps = multiply gamma by 1.2, etc)
#   takes number of steps
#   no return value
sub set_brightness;

# get wagon capacity in lbs
#   no arguments
#   returns number
sub get_wagon_capacity;

# set wagon capacity in lbs
#   takes number representing wagon capacity
#   no return value
sub set_wagon_capacity;

# check if skill levels above 100 are unlocked
#   no arguments
#   returns boolean
sub get_high_skills;

# enable or disable skill levels above 100
#   takes boolean, 0 to disable, 1 to enable
#   no return value
sub set_high_skills;

# get view distance in save stored in given slot
#   takes save slot number (0 to 5)
#   returns view distance (0 to 255)
sub get_view_distance;

# set view distance in save stored in given slot
# (in-game this cannot be set higher than 127)
#   takes save slot number (0 to 5) and view distance (0 to 255)
#   no return value
sub set_view_distance;

# check if cheat mode is enabled
#   no arguments
#   returns boolean
sub get_cheat_mode;

# enable or disable cheat mode
#   takes boolean, 0 to disable, 1 to enable
#   no return value
sub set_cheat_mode;

# check if magic item repairs are enabled
#   no arguments
#   returns boolean
sub get_magic_repair;

# enable or disable magic item repairs
#   takes boolean, 0 to disable, 1 to enable
#   no return value
sub set_magic_repair;

# get current save names
#   no arguments
#   returns hash from slot numbers (0-5) to save names (strings)
sub get_current_saves;

# get archived save names
#   no arguments
#   returns hash from slot numbers (0-5) to hashes from names (strings) to array
#           of dates (YYYY_MM_DD_HH_MM_SS) when saves were archived
sub get_archived_saves;

# archive current save from given slot
#   takes slot number (0-5)
#   no return value
sub archive_save;

# check if there is save in given slot
#   takes slot number (0-5)
#   returns boolean, 1 for occupied slot, 0 otherwise
sub is_slot_occupied;

# restore selected save into given slot
# (possible specifications:
#    (slot numer) -> same as (slot number)-(game name), where (game name) is
#      name of game currently in given slot
#    (slot number)-(game name) -> same as (slot number)-(game name)-(date),
#      where (date) is date of last archived save from given slot with given name
#    (slot number)-(game name)-(date) -> full specification, unpacks save named
#     (game name) archived from slot (slot number) on (date)
#   takes archived save specification (string) and target slot (0-5)
#   no return value
sub restore_save;

# get list of installed mods
#   no arguments
#   returns array of installed mod names
sub get_mods;

# get list of enabled mods
#   no arguments
#   returns array of enabled mod names
sub get_enabled_mods;

# get list of available mod groups
#   no arguments
#   returns array of available mod group names
sub get_mod_groups;

# get list of mod or group dependencies
#   no arguments
#   returns array of mod and group names 
sub get_direct_mod_dependencies;

# get list of mod or group dependencies (recursively)
#   no arguments
#   returns array of mod names
sub get_all_mod_dependencies;

# get list of enabled mods requiring given mod
#   takes string (mod name)
#   returns array of mod names
sub get_mods_requiring;

# enable mod
#   takes string (name of mod or group to enable)
#   no return value
sub enable_mod;

# disable mod
#   takes string (name of mod to disable)
#   no return value
sub disable_mod;

# refresh all installed mods to currently installed versions
#   no arguments
#   no return value
sub refresh_mods;

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
	return ( -e catfile($daggerfall_path, $license_lock) );
}

sub accept_terms
{
	my $file = catfile($daggerfall_path, $license_lock);
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
	my ($app, $exit, $no_terms) = @_;
	$no_terms or terms_accepted or die "Terms of usage not accepted";
	my $run = catfile($daggerfall_path, $daggerfall_dir, $app);
	( -e $run) or die "Cannot find requested application";
	my $cfg = catfile($daggerfall_path, $dosbox_config);
	( -e $cfg) or die "Cannot find dosbox config file";
	if ($exit) {
		system($dosbox." ".$run." -exit -conf ".$cfg);
	} else {
		system($dosbox." ".$run." -conf ".$cfg);
	}
	fix_dirs catfile($daggerfall_path, $daggerfall_dir);
}

sub run_daggerfall
{
	run_dosbox "RUN.BAT", 1, 0;
}

sub run_setup
{
	run_dosbox "SETUP.EXE", 1, 1;
}

sub run_fixsave
{
	run_dosbox "FIXSAVE.EXE", 0, 1;
}

sub run_fixmaps
{
	run_dosbox "FIXMAPS.EXE", 0, 1;
}

sub get_brightness
{

	my $pal = catfile($daggerfall_path, $palettes_dir);
	( -d $pal ) or return 0;

	my $file = catfile($pal, "now");
	( -e $file) or return 0;

	open(FILE, "<$file") or die "Cannot open brighness record";
	binmode(FILE);
	my $buffer="";
	read(FILE, $buffer, 8);
	close(FILE);
	return unpack("d", $buffer);
}

sub set_brightness
{
	my $steps = shift;
	my $gamma = 1+$steps/10;

	my %palettes = (
		'ARENA2' => [
			"MAP.PAL", "ART_PAL.COL", "DANKBMAP.COL", "FMAP_PAL.COL",
			"NIGHTSKY.COL", "OLDMAP.PAL", "OLDPAL.PAL", "PAL.PAL", "PAL.RAW"
		],
		'DATA' => [
			"DAGGER.COL"
		]
	);

	sub edit_palette
	{
		my ($source_file, $gamma) = @_;
		my $palette_size = -s $source_file;
		my $source;
		my $target = "";
		open(FILE, "<$source_file") or die "cannot open $source_file";
		binmode(FILE);
		if ($palette_size == 768) {
			read(FILE, $source, 768);
		} elsif ($palette_size == 776) {
			read(FILE, $target, 8);
			read(FILE, $source, 768);
		} else {
			close(FILE);
			die "$source_file is unknown palette format\n";
		}
		close(FILE);
		$target eq "\x08\x03\x00\x00\x23\xb1\x00\x00"
			|| $target eq ""
			|| die "$source_file is unknown palette format\n";
		sub transform {
			my ($c, $g) = @_;
			return max(0,min(int(255*(0.385/($g-0.5)+0.23)*($c/255)**(1/$g)+0.5),255));
		}
		my @source_data = unpack("C*", $source);
		my @target_data;
		foreach my $byte (@source_data) {
			push(@target_data, (transform $byte, $gamma));
		}
		$target = $target . pack("C*", @target_data);
		open(FILE, ">$source_file") or die "cannot write $source_file";
		binmode(FILE);
		print FILE $target;
		close(FILE);
	}

	(-d catfile($daggerfall_path, $daggerfall_dir)) or die "Cannot find Daggerfall directory";

	my $source_dir = catfile($daggerfall_path, $palettes_dir);
	if ( ! -d $source_dir ) {
		mkdir $source_dir or die "Cannot create palettes directory";
		chmod 0775, $source_dir;
		chown -1, $gid, $source_dir;
	}

	foreach my $dir (keys %palettes) {
		my $target_dir = catfile($daggerfall_path, $daggerfall_dir, $dir);

		foreach my $palette (@{$palettes{$dir}}) {
			if ( ! -e catfile($source_dir, $palette) ) {
				copy(
					catfile($target_dir, $palette),
					catfile($source_dir, $palette)
				) or die "Cannot copy palette file";
				chmod 0664, catfile($source_dir, $palette);
				chown -1, $gid, catfile($source_dir, $palette);
			}
			copy(
				catfile($source_dir, $palette),
				catfile($target_dir, $palette)
			) or die "Cannot copy palette file";
			chmod 0664, catfile($target_dir, $palette);
			chown -1, $gid, catfile($target_dir, $palette);
			edit_palette(catfile($target_dir, $palette), $gamma);
		}
	}

	my $file = catfile($source_dir, "now");
	open(FILE, ">$file") or die "Cannot save brighness record";
	binmode(FILE);
	print FILE pack("d", $steps);
	close(FILE);
}

sub get_wagon_capacity
{
	my $fall = catfile($daggerfall_path, $daggerfall_dir, "FALL.EXE");
	( -e $fall ) or die "Cannot find FALL.EXE";
	( -s $fall == 1864183 ) or die "Wrong FALL.EXE length";
	open(FILE, "<$fall") or die "cannot open FALL.EXE";
	binmode(FILE);
	seek(FILE, 917011, 0);
	my $buffer="";
	read(FILE, $buffer, 2);
	close(FILE);
	my @bytes = unpack("C*", $buffer);
	return $bytes[0]/4+$bytes[1]*64;
}

sub set_wagon_capacity
{
	my $val = shift;
	my $len = length $val;
	my $rep = int((5-$len)/2);
	my $out = " "x$rep . "/" . " "x$rep . $val;
	if (length $out == 5) { $out = $out." " };
	my $high = int($val/64);
	my $low = 4*$val-256*$high;
	(length $out == 6) and
		($low >= 0) and
		($low <= 255) and
		($high >= 0) and
		($high <= 255)
		or die "Bad value $val.";
	my $bytes = pack("C*", ($low, $high));
	my $fall = catfile($daggerfall_path, $daggerfall_dir, "FALL.EXE");
	( -e $fall ) or die "Cannot find FALL.EXE";
	( -s $fall == 1864183 ) or die "Wrong FALL.EXE length";
	open(FILE, "<$fall") or die "cannot open FALL.EXE";
	binmode(FILE);
	my $buffer;
	read(FILE, $buffer, 917011);
	$buffer = $buffer.$bytes;
	seek(FILE, 2, 1);
	read(FILE, $buffer,854164,917013);
	$buffer = $buffer.$out;
	seek(FILE, 6, 1);
	read(FILE, $buffer,93000,1771183);
	close(FILE);
	open(FILE, ">$fall") or die "cannot write FALL.EXE";
	binmode(FILE);
	print FILE $buffer;
	close(FILE);
}

sub get_high_skills
{
	my $fall = catfile($daggerfall_path, $daggerfall_dir, "FALL.EXE");
	( -e $fall ) or die "Cannot find FALL.EXE";
	( -s $fall == 1864183 ) or die "Wrong FALL.EXE length";
	open(FILE, "<$fall") or die "cannot open FALL.EXE";
	binmode(FILE);
	seek(FILE, 556836, 0);
	my $buffer="";
	read(FILE, $buffer, 1);
	close(FILE);
	return ($buffer eq "\xc8");
}

sub set_high_skills
{
	my $enable = shift;
	my $fall = catfile($daggerfall_path, $daggerfall_dir, "FALL.EXE");
	( -e $fall ) or die "Cannot find FALL.EXE";
	( -s $fall == 1864183 ) or die "Wrong FALL.EXE length";
	open(FILE, "<$fall") or die "cannot open FALL.EXE";
	binmode(FILE);
	my $buffer;
	read(FILE, $buffer, 1864183);
	close(FILE);
	if ($enable) {
		substr($buffer, 556836, 2, "\xc8\x72");
		substr($buffer, 558213, 2, "\xc8\x77");
		substr($buffer, 558234, 2, "\xc8\x76");
		substr($buffer, 558253, 1, "\xc8");
		substr($buffer, 558320, 2, "\xc8\x76");
		substr($buffer, 558342, 1, "\xc8");
		substr($buffer, 558833, 1, "\xc8");
		substr($buffer, 557953, 1, "\x7f");
	} else {
		substr($buffer, 556836, 2, "\x64\x7c");
		substr($buffer, 558213, 2, "\x64\x7f");
		substr($buffer, 558234, 2, "\x64\x7e");
		substr($buffer, 558253, 1, "\x64");
		substr($buffer, 558320, 2, "\x64\x7e");
		substr($buffer, 558342, 1, "\x64");
		substr($buffer, 558833, 1, "\x64");
		substr($buffer, 557953, 1, "\x64");
	}
	open(FILE, ">$fall") or die "cannot write FALL.EXE";
	binmode(FILE);
	print FILE $buffer;
	close(FILE);
}

sub find_distance
{
	my $slot = shift;
	my $file = catfile($daggerfall_path,$daggerfall_dir,"SAVE".$slot,"SAVETREE.DAT");
	open(FILE, "<$file") or die "cannot open save from slot $slot";
	my $buffer;
	my $step;
	my $ans;
	binmode(FILE);
	seek(FILE, 19, 1);
	read(FILE, $buffer, 4);
	$step = unpack("L", $buffer);
	seek(FILE, $step, 1);
	read(FILE, $buffer, 4);
	$step = unpack("L", $buffer);
	while ($step > 0) {
		read(FILE, $buffer, 1);
		if (unpack("C", $buffer) == 23) {
			seek(FILE, 71, 1);
			$ans = tell FILE;
			close(FILE);
			return $ans;
		} else {
			seek(FILE, $step-1, 1);
		}
		read(FILE, $buffer, 4);
		$step = unpack("L", $buffer);
	}
	close(FILE);
	die "No settings record found";
}

sub get_view_distance
{
	my $slot = shift;
	my $place = find_distance $slot;
	my $file = catfile($daggerfall_path,$daggerfall_dir,"SAVE".$slot,"SAVETREE.DAT");
	open(FILE, "<$file") or die "cannot open save from slot $slot";
	binmode(FILE);
	seek(FILE, $place, 1);
	my $buffer;
	read(FILE, $buffer, 1);
	close(FILE);
	return unpack("C", $buffer);
}

sub set_view_distance
{
	my ($slot, $value) = @_;
	my $place = find_distance $slot;
	($value>0) && ($value < 266) || die "Wrong distance value";
	my $file = catfile($daggerfall_path,$daggerfall_dir,"SAVE".$slot,"SAVETREE.DAT");
	my $buffer;
	open(FILE, "<$file") or die "cannot open save from slot $slot";
	binmode(FILE);
	read(FILE, $buffer, -s $file);
	close(FILE);
	substr($buffer, $place, 1, pack("C", $value));
	open(FILE, ">$file") or die "cannot write save from slot $slot";
	binmode(FILE);
	print FILE $buffer;
	close(FILE);
}

sub get_label
{
	my $label = shift;
	$label =~ tr/[A-Z]/[a-z]/;
	my $file = catfile($daggerfall_path,$daggerfall_dir,"Z.CFG");
	open(FILE, "<$file") or die "cannot open config file";
	while (<FILE>) {
		my $line = $_;
		$line =~ tr/[A-Z]/[a-z]/;
		$line =~ s/\s+//g;
		if ($line =~ /^$label/) {
			close(FILE);
			return ($line =~ /1$/);
		}
	}
	close(FILE);
	return 0;
}

sub set_label
{
	my ($label, $value) = @_;
	$label =~ tr/[A-Z]/[a-z]/;
	my $file = catfile($daggerfall_path,$daggerfall_dir,"Z.CFG");
	open(FILE, "<$file") or die "cannot open config file";
	my @lines = <FILE>;
	close(FILE);
	open(FILE, ">$file") or die "cannot write to config file";
	my $found = 0;
	foreach my $line (@lines) {
		my $copy = $line;
		$copy =~ tr/[A-Z]/[a-z]/;
		$copy =~ s/\s+//g;
		if ($copy =~ /^$label/) {
			$found = 1;
			print FILE $label." ".$value."\r\n";
		} else {
			print FILE $line;
		}
	}
	if (! $found) {
		print FILE $label." ".$value."\r\n";
	}
	close(FILE);
}

sub get_cheat_mode
{
	return get_label "cheatmode";
}

sub set_cheat_mode
{
	my $val = shift;
	if ($val) {
		set_label "cheatmode", 1;
	} else {
		set_label "cheatmode", 0;
	}
}

sub get_magic_repair
{
	return get_label "magicrepair";
}

sub set_magic_repair
{
	my $val = shift;
	if ($val) {
		set_label "magicrepair", 1;
	} else {
		set_label "magicrepair", 0;
	}
}

sub is_slot_occupied
{
	my $slot = shift;
	return ( -e catfile($daggerfall_path,$daggerfall_dir,"SAVE".$slot,"SAVENAME.TXT"))
}

sub get_save_name
{
	my $slot = shift;
	( is_slot_occupied $slot ) or die "Slot empty";
	my $file = catfile($daggerfall_path,$daggerfall_dir,"SAVE".$slot,"SAVENAME.TXT");
	my $name = "";
	open(FILE, "<$file") or die "Cannot open save file";
	binmode(FILE);
	read(FILE,$name,32);
	$name =~ s/\x00.*//;
	return $name
}

sub get_current_saves
{
	my %saves = ();
	foreach my $slot (0..5) {
		if (is_slot_occupied $slot) {
			$saves{$slot} = get_save_name $slot
		}
	}
	return %saves;
}

sub get_archived_saves
{
	my %saves = ();
	my $dir = catfile($daggerfall_path, $save_backup_dir);
	( -d $dir) or return %saves;
	opendir(DIR, $dir) or die "Cannot access save backup directory";
	my @files = readdir(DIR);
	closedir(DIR);
	foreach my $file (@files) {
		if ( $file !~ /^\./) {
			$file =~ s/$archive_type$//;
			my @struct = split /-/, $file;
			my $slot = $struct[0];
			my $date = $struct[-1];
			my $name = join('-',@struct[1..($#struct-1)]);
			if ( ! exists $saves{$slot} ) {
				$saves{$slot} = {};
			}
			if ( ! exists $saves{$slot}{$name} ) {
				$saves{$slot}{$name} = [];
			}
			push($saves{$slot}{$name}, $date);
		}
	}
	return %saves;
}

sub archive_save
{
	my $slot = shift;

	my $dir = catfile($daggerfall_path, $save_backup_dir);
	if ( ! -d $dir) {
		mkdir $dir or die "Cannot create save backup directory";
		chmod 0775, $dir;
		chown -1, $gid, $dir;
	}

	my $save_path = catfile($daggerfall_path,$daggerfall_dir,"SAVE".$slot);

	my $file = catfile($save_path,"SAVENAME.TXT");
	( -e $file ) or die "No save in slot $slot";
	my $name;
	open(FILE, "<$file") or die "Cannot open save file";
	binmode(FILE);
	read(FILE,$name,32);
	$name =~ s/\x00.*//g;

	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
	my $date = sprintf("%4d_%02d_%02d_%02d_%02d_%02d", ($year+1900), ($mon+1), $mday, $hour, $min, $sec);

	my $archive = catfile($daggerfall_path, $save_backup_dir, $slot."-".$name."-".$date.$archive_type);

	my $call = $archiver_pack;
	$call =~ s/ARCHIVE/$archive/;

	chdir($save_path);
	system($call);
	chmod 0664, $archive;
	chown -1, $gid, $archive;
}

sub expand_save_name
{
	my $which = shift;
	if ($which =~ /^[0-5]$/) {
		my $file = catfile($daggerfall_path,$daggerfall_dir,"SAVE".$which, "SAVENAME.TXT");
		( -e $file) or return "";
		my $name;
		open(FILE, "<$file") or return "";
		binmode(FILE);
		read(FILE,$name,32);
		$name =~ s/\x00.*//g;
		$which = $which."-".$name;
	}
	if ($which !~ /[0-9][0-9][0-9][0-9]_[0-9][0-9]_[0-9][0-9]_[0-9][0-9]_[0-9][0-9]_[0-9][0-9]$/) {
		my $dir = catfile($daggerfall_path, $save_backup_dir);
		opendir(DIR, $dir) or return "";
		my @files = readdir(DIR);
		closedir(DIR);
		@files = sort grep(/^$which/, @files);
		($#files > 0) or return "";
		my $last = $files[-1];
		$last =~ s/$archive_type$//;
		$last =~ s/^$which//;
		$which = $which.$last;
	}
	( -e catfile($daggerfall_path, $save_backup_dir, $which.$archive_type) ) or return "";
	return $which
}

sub restore_save
{
	my ($which, $where) = @_;

	my $target = catfile($daggerfall_path,$daggerfall_dir,"SAVE".$where);
	( -d $target) or die "No save directory for slot $where";

	$which = expand_save_name $which;
	$which or die "No stored save meets requirements";
	$which = $which.$archive_type;
	my $source = catfile($daggerfall_path, $save_backup_dir, $which);

	my $call = $archiver_unpack;
	$call =~ s/ARCHIVE/$source/;

	opendir(DIR, $target) or die "Cannot access target directory";
	my @files = readdir(DIR);
	closedir(DIR);
	( $#files == 1) or remove_tree($target, {keep_root => 1} ) or die "Cannot cleanup target directory";
	chdir($target) or die "Cannot access target directory";
	system($call);

	fix_dirs $target;
}

sub is_mod
{
	my $mod = shift;
	return ( -d catfile($daggerfall_path, $mods_dir, $mod) );
}

sub has_patch
{
	my $mod = shift;
	( is_mod $mod) or return 0;
	return ( -e catfile($daggerfall_path, $mods_dir, $mod.".patch") );
}

sub was_mod
{
	my $mod = shift;
	( ! is_mod $mod) or return 0;
	return ( -e catfile($daggerfall_path, $mods_dir, $mod.".enabled") );
}

sub is_group
{
	my $mod = shift;
	return (( -e catfile($daggerfall_path, $mods_dir, $mod.".extends")) and ( ! -d catfile($daggerfall_path, $mods_dir, $mod)))
}

sub is_mod_enabled;
sub is_mod_enabled
{
	my $mod = shift;
	if (is_mod $mod) {
		return ( -e catfile($daggerfall_path, $mods_dir, $mod.".enabled"))
	} elsif (was_mod $mod) {
		return 1
	} elsif (is_group $mod)  {
		my $file = catfile($daggerfall_path, $mods_dir, $mod.".extends");
		open(FILE, "<$file") or die "Cannot access mods group";
		my @mods = <FILE>;
		close(FILE);
		foreach my $file (@mods) {
			$file =~ s/\r|\n//g;
			(is_mod_enabled $file) or return 0;
		}
		return 1;
	} else {
		die "Value $mod does not point to mod or group"
	}
}

sub get_mods
{
	my @mods = ();
	my $dir = catfile($daggerfall_path, $mods_dir);
	( -d $dir ) or return @mods;
	opendir(DIR, $dir) or die "Cannot access mods directory";
	my @files = readdir(DIR);
	closedir(DIR);
	@files = grep(!/^\./,@files);
	@files = grep(!/\.enabled$/,@files);
	@files = grep(!/\.patch$/,@files);
	@mods = grep(!/\.extends$/,@files);
	return sort @mods;
}

sub get_enabled_mods
{
	my @mods = ();
	my $dir = catfile($daggerfall_path, $mods_dir);
	( -d $dir ) or return @mods;
	opendir(DIR, $dir) or die "Cannot access mods directory";
	my @files = readdir(DIR);
	closedir(DIR);
	@files = grep(/enabled$/,@files);
	foreach my $mod (@files) {
		$mod =~ s/.enabled$//;
		if (( is_mod $mod ) or (was_mod $mod)) {
			push(@mods, $mod)
		}
	}
	return sort @mods;
}

sub get_mod_groups
{
	my @mods = get_mods;
	my @groups = ();
	my $dir = catfile($daggerfall_path, $mods_dir);
	( -d $dir ) or return @mods;
	opendir(DIR, $dir) or die "Cannot access mods directory";
	my @files = readdir(DIR);
	closedir(DIR);
	foreach my $modex (grep(/\.extends$/,@files)) {
		my $mod = $modex;
		$mod =~ s/.extends$//;
		my @temp = grep(/^$mod$/,@mods);
		if ($#temp) { push(@groups, $mod) }
	}
	return sort @groups;
}

sub get_mod_dependencies;
sub get_mod_dependencies
{
	my ($mod, $rec) = @_;
	my @deps = ();
	if (was_mod $mod) {
		my $dir = catfile($daggerfall_path, $mod_backup_dir);
		find sub {
			my $file = $File::Find::name;
			( ! -d $file) or return;
			($file =~ /$mod$/) or return;
			$file =~ s/^$dir.//;
			($file !~ /^FALL\.EXE/) or return;
			my $temp = $file;
			$file =~ s/-[0-9]*-$mod$//;
			$temp =~ s/.*-([0-9]*)-$mod$/$1/;
			$temp or return;
			$temp = $temp - 1;
			find sub {
				my $test = $File::Find::name;
				( ! -d $test) or return;
				$test =~ s/^$dir.//;
				($test =~ /^$file-$temp/) or return;
				($test !~ /orig$/) or return;
				$test =~ s/^$file-$temp-//;

				my @temp = grep(/^$test$/, @deps);
				if ($#temp==-1) {
					push(@deps, $test);
				}

				( $rec ) or return;

				my @recdeps = get_mod_dependencies $test, $rec;
				foreach my $file (@recdeps) {
					my @temp = grep(/^$file$/, @deps);
					if ($#temp==-1) {
						push(@deps, $file);
					}
				}
			}, $dir;
		}, $dir;
		return sort @deps;
	}
	(is_mod $mod) or (is_group $mod) or die "Value $mod does not point to mod or group";
	my $file = catfile($daggerfall_path, $mods_dir, $mod.".extends");
	( -e $file ) or return @deps;
	open(FILE, "<$file") or die "Cannot access mods group";
	my @mods = <FILE>;
	close(FILE);
	foreach my $file (@mods) {
		$file =~ s/\r|\n//g;
		my @temp = grep(/^$file$/, @deps);
		if ($#temp==-1) {
			push(@deps, $file);
		}
		if ( ($rec) and (-e catfile($daggerfall_path, $mods_dir, $file.".extends") )) {
			my @recdeps = get_mod_dependencies $file, $rec;
			foreach my $file (@recdeps) {
				my @temp = grep(/^$file$/, @deps);
				if ($#temp==-1) {
					push(@deps, $file);
				}
			}
		}
	}
	return sort @deps;
}

sub get_direct_mod_dependencies
{
	my $mod = shift;
	return get_mod_dependencies $mod, 0;
}

sub get_all_mod_dependencies
{
	my $mod = shift;
	return get_mod_dependencies $mod, 1;
}

sub get_mods_requiring
{
	my $mod = shift;
	(is_mod $mod) or (was_mod $mod) or die "Value $mod does not represent mod";
	my @mods = get_enabled_mods;
	my @result = ();
	foreach my $name (@mods) {
		my @deps = get_all_mod_dependencies $name;
		my @temp = grep(/^$mod$/, @deps);
		if ($#temp != -1) {
			my @temp = grep(/^$name$/, @result);
			if ($#temp == -1) {
				push(@result, $name);
			}
		}
	}
	return @result;
}

sub is_mod_conflicting
{
	my $mod = shift;
	( is_mod $mod ) or die "$mod is not a mod";
	( ! is_mod_enabled $mod ) or return 0;
	my @possible_conflicts = ();
	my $dir = catfile($daggerfall_path, $mod_backup_dir);
	( -d $dir ) or return @possible_conflicts;
	my $moddir = catfile($daggerfall_path, $mods_dir, $mod);
	find sub {
		my $file = $File::Find::name;
		( ! -d $file ) or return;
		$file =~ s/^$moddir.//;
		my @file_conflicts = ();
		find sub {
			my $backup = $File::Find::name;
			( ! -d $backup) or return;
			$backup =~ s/^$dir.//;
			if ($backup =~ /^$file/) {
				$backup =~ s/^$_-//;
				($backup !~ /0-orig/) or return;
				my @parts = split(/-/, $backup);
				$backup = join('-',@parts);
				my $slot = $parts[0];
				while (! (is_mod($backup) or was_mod($backup))) {
					$slot = $parts[0];
					shift @parts;
					$backup = join('-',@parts);
				}
				($backup ne $mod) or return;
				my @temp = grep(/^$slot-backup$/,@file_conflicts);
				if ($#temp==-1) {
					push(@file_conflicts,"$slot-$backup");
				}
			}
		}, $dir;
		(@file_conflicts) or return;
		my $conflict = (sort @file_conflicts)[-1];
		my @temp = split(/-/,$conflict);
		shift @temp;
		$conflict = join('-',@temp);
		@temp = grep(/^$conflict$/,@possible_conflicts);
		if ($#temp == -1) {
			push(@possible_conflicts, $conflict);
		}
	}, $moddir;
	my @conflicts = ();
	my @deps = get_direct_mod_dependencies $mod;
	foreach my $conflict (@possible_conflicts) {
		my @temp = grep(/^$conflict$/, @deps);
		if ($#temp == -1) {
			push(@conflicts, $conflict);
		}
	}
	return sort @conflicts;
}

sub get_file_in_mods_count
{
	my $file = shift;
	my $dir = catfile($daggerfall_path, $mod_backup_dir);
	( -d $dir ) or return 0;
	my @backups = ();
	find sub {
		my $backup = $File::Find::name;
		$backup =~ s/^$dir.//;
		( $backup eq $dir ) or push(@backups, $backup);
	}, $dir;
	@backups = grep(/^$file/, @backups);
	return (1+$#backups);
}

sub rm
{
	my $file = shift;
	( -e $file ) or return;
	( ! -d $file ) or return;
	unlink @{[$file]} or die "Cannot delete file";
}

sub dir_empty
{
	my $dir = shift;
	( -d $dir ) or return 0;
	opendir(DIR, $dir);
	my @files = readdir(DIR);
	closedir(DIR);
	return ($#files == 1);
}

sub enable_patch
{
	my $mod = shift;
	my $file = catfile($daggerfall_path, $mods_dir, $mod.".patch");
	open(FILE, "<$file") or die "Cannot open patch file";
	my @lines = <FILE>;
	close(FILE);
	$file = catfile($daggerfall_path, $mod_backup_dir, "FALL.EXE-$mod");
	open(FILE, ">$file") or die "Cannot create FALL.EXE backup";
	my $fall = catfile($daggerfall_path, $daggerfall_dir, "FALL.EXE");
	open(FALL, "<$fall") or die "Cannot open FALL.EXE file";
	binmode(FALL);
	my $buffer;
	read(FALL, $buffer, 1864183);
	foreach my $part (@lines) {
		$part =~ s/\r|\n//g;
		my @data = split(/\ /, $part);
		my $offset = $data[0];
		shift @data;
		my $length = $data[0];
		shift @data;
		my $out = pack("C*", @data);
		seek FALL, $offset, 0;
		my $buf;
		read FALL, $buf, $length;
		my @orig = unpack("C*", $buf);
		my $origval = join(" ", @orig);
		print FILE "$offset $length $origval\n";
		substr($buffer, $offset, $length, $out);
	}
	close(FILE);
	close(FALL);
	open(FALL, ">$fall") or die "Cannot open FALL.EXE file";
	binmode(FALL);
	print FALL $buffer;
	close(FALL);
}

sub disable_patch
{
	my $mod = shift;
	my $file = catfile($daggerfall_path, $mod_backup_dir, "FALL.EXE-$mod");
	open(FILE, "<$file") or die "Cannot read FALL.EXE backup";
	my @lines = <FILE>;
	close(FILE);
	my $fall = catfile($daggerfall_path, $daggerfall_dir, "FALL.EXE");
	open(FALL, "<$fall") or die "Cannot open FALL.EXE file";
	binmode(FALL);
	my $buffer;
	read(FALL, $buffer, 1864183);
	close(FALL);
	foreach my $part (@lines) {
		$part =~ s/\r|\n//g;
		my @data = split(/\ /, $part);
		my $offset = $data[0];
		shift @data;
		my $length = $data[0];
		shift @data;
		my $out = pack("C*", @data);
		substr($buffer, $offset, $length, $out);
	}
	open(FALL, ">$fall") or die "Cannot open FALL.EXE file";
	binmode(FALL);
	print FALL $buffer;
	close(FALL);
	rm $file;
}

sub enable_mod
{
	my $mod = shift;
	(is_mod $mod) or (is_group $mod) or die "Value $mod does not point to mod or group";
	(! is_mod_enabled $mod) or return;
	my @deps = get_direct_mod_dependencies $mod;
	foreach my $dep (@deps) {
		(is_mod_enabled $dep) or enable_mod $dep;
	}
	( is_mod $mod ) or return;
	my $dir = catfile($daggerfall_path, $mod_backup_dir);
	if ( ! -d $dir ) {
		mkdir $dir or die "Cannot create mod backup directory";
		chmod 0775, $dir;
		chown -1, $gid, $dir;
	}
	my @conflicts = is_mod_conflicting $mod;
	( ! @conflicts ) or die "Mod is conflicting with: ".join(' ', @conflicts);
	my $moddir = catfile($daggerfall_path, $mods_dir, $mod);
	find sub {
		my $source = $File::Find::name;
		my $file = $source;
		($file ne $moddir) or return;
		$file =~ s/^$moddir.//;
		( $file !~ /^FALL.EXE$/ ) or die "Bad mod, FALL.EXE can be modded only trough patches";
		my $target = catfile($daggerfall_path, $daggerfall_dir, $file);
		my $backup = catfile($dir, $file);
		if ( -d $source ) {
			if ( ! -d $target ) {
				mkdir $target or die "Cannot create directory";
				chmod 0775, $target;
				chown -1, $gid, $target;
			}
			if ( ! -d $backup ) {
				mkdir $backup or die "Cannot create directory";
				chmod 0775, $backup;
				chown -1, $gid, $backup;
			}
		} else {
			if ( ! -e $target ) {
				copy($source, $target) or die "Cannot copy file";
				chmod 0664, $target;
				chown -1, $gid, $target;
				open(FILE, ">$backup-0-$mod") or die "Cannot create file";
				close(FILE);
				chmod 0664, "$backup-0-$mod";
				chown -1, $gid, "$backup-0-$mod";
			} else {
				my $id = get_file_in_mods_count $file;
				if ($id == 0) {
					open(FILE, ">$backup-0-orig") or die "Cannot create file";
					close(FILE);
					chmod 0664, "$backup-0-orig";
					chown -1, $gid, "$backup-0-orig";
					$id = 1;
				}
				copy($target, "$backup-$id-$mod") or die "Cannot copy file";
				chmod 0664, "$backup-$id-$mod";
				chown -1, $gid, "$backup-$id-$mod";
				copy($source, $target) or die "Cannot copy file";
				chmod 0664, $target;
				chown -1, $gid, $target;
			}
		}
	}, $moddir;
	if ( has_patch $mod ) {
		enable_patch $mod;
	}
	open(FILE, ">$moddir.enabled") or die "Cannot create file";
	close(FILE);
	chmod 0664, "$moddir.enabled";
	chown -1, $gid, "$moddir.enabled";
}

sub disable_mod
{
	my $mod = shift;
	( is_mod $mod ) or ( was_mod $mod) or die "Value $mod does not represent mod";
	( was_mod $mod ) or ( is_mod_enabled $mod ) or return;
	my @temp = get_mods_requiring $mod;
	my $count = $#temp+1;
	( ! $count ) or die "There are $count mods requiring $mod, cannot disable";
	my $dir = catfile($daggerfall_path, $mod_backup_dir);
	find sub {
		my $file = $File::Find::name;
		$file =~ s/^$dir.//;
		($file ne $dir) or return;
		($file =~ /$mod$/) or return;
		my $id = $file;
		$file =~ s/-[0-9]*-$mod$//;
		if ($file =~ /FALL.EXE/) {
			disable_patch $mod;
		} else {
			$id =~ s/^$file-//;
			$id =~ s/-$mod$//;
			my $source = catfile($dir, "$file-$id-$mod");
			my $target = catfile($daggerfall_path, $daggerfall_dir, $file);
			if ($id == 0) {
				rm($source);
				rm($target);
			} else {
				move($source, $target) or die "Cannot restore backup";
				chmod 0664, $target;
				chown -1, $gid, $target;
				if ($id == 1) {
					rm(catfile($dir, "$file-0-orig"));
				}
			}
		}
	}, $dir;
	my @to_remove = ();
	find { no_chdir => 1, wanted => sub {
		my $file = $File::Find::name;
		($file ne $dir) or return;
		(-d $file) or return;
		(dir_empty $file) or return;
		push(@to_remove, $file);
		$file =~ s/^$dir.//;
		$file = catfile($daggerfall_path, $daggerfall_dir, $file);
		(dir_empty $file) or return;
		push(@to_remove, $file);
	}}, $dir;
	foreach my $file (@to_remove) {
		remove_tree($file) or die "Cannot remove leftover directory";
	}
	rm(catfile($daggerfall_path, $mods_dir, "$mod.enabled"));
}

sub refresh_mods
{
	my @mods = get_enabled_mods;
	my @enabled_mods = @mods;
	while ($#enabled_mods >= 0) {
		foreach my $mod (@enabled_mods) {
			my @temp = get_mods_requiring $mod;
			my $count = $#temp+1;
			if ( ! $count ) {
				disable_mod $mod;
			}
		}
		@enabled_mods = get_enabled_mods;
	}
	foreach my $mod (@mods) {
		if (is_mod $mod) {
			enable_mod $mod
		}
	}
}

#=================================================================================
#  Command line interface, options parsing
#=================================================================================

use Getopt::Long;

my $opt_run_daggerfall=1;
my $opt_force_run_daggerfall=0;
my $opt_help=0;
my $opt_accept_terms=0;
my $opt_run_setup=0;
my $opt_run_fixsave=0;
my $opt_run_fixmaps=0;
my $opt_get_brightness=0;
my $opt_set_brightness="";
my $opt_get_wagon_capacity=0;
my $opt_set_wagon_capacity="";
my $opt_get_high_skills=0;
my $opt_set_high_skills="";
my $opt_get_view_distance="";
my %opt_set_view_distance=();
my $opt_get_cheat_mode=0;
my $opt_set_cheat_mode="";
my $opt_get_magic_repair=0;
my $opt_set_magic_repair="";
my $opt_list_saves=0;
my $opt_list_archived_saves=0;
my $opt_archive_save="";
my $opt_archive_all_saves=0;
my %opt_restore_save=();
my $opt_list_mods=0;
my $opt_enable_mod="";
my $opt_disable_mod="";
my $opt_refresh_mods=0;
my $die_early=0;

Getopt::Long::Configure('pass_through');
GetOptions (
	'help' => \$opt_help,
	'accept-terms' => \$opt_accept_terms,
	'run-daggerfall' => \$opt_force_run_daggerfall,
	'run-setup' => \$opt_run_setup,
	'run-fixsave' => \$opt_run_fixsave,
	'run-fixmaps' => \$opt_run_fixmaps,
	'get-brightness' => \$opt_get_brightness,
	'set-brightness=f' => \$opt_set_brightness,
	'get-wagon-capacity' => \$opt_get_wagon_capacity,
	'set-wagon-capacity=i' => \$opt_set_wagon_capacity,
	'get-high-skills' => \$opt_get_high_skills,
	'set-high-skills=s' => \$opt_set_high_skills,
	'get-view-distance=i' => \$opt_get_view_distance,
	'set-view-distance=i' => \%opt_set_view_distance,
	'get-cheat-mode' => \$opt_get_cheat_mode,
	'set-cheat-mode=s' => \$opt_set_cheat_mode,
	'get-magic-repair' => \$opt_get_magic_repair,
	'set-magic-repair=s' => \$opt_set_magic_repair,
	'list-saves' => \$opt_list_saves,
	'list-archived-saves' => \$opt_list_archived_saves,
	'archive-save=i' => \$opt_archive_save,
	'archive-all-saves' => \$opt_archive_all_saves,
	'restore-save=i' => \%opt_restore_save,
	'list-mods' => \$opt_list_mods,
	'enable-mod=s' => \$opt_enable_mod,
	'disable-mod=s' => \$opt_disable_mod,
	'refresh-mods' => \$opt_refresh_mods
);

if ($opt_set_brightness ne "") {
	if ($opt_set_brightness < 0) {
		print "Bad value for --set-brightness ($opt_set_brightness)\n";
		$opt_help = 1;
	}
}

if ($opt_set_wagon_capacity ne "") {
	if (($opt_set_wagon_capacity <= 0) or ($opt_set_wagon_capacity >= 16384)) {
		print "Bad value for --set-wagon-capacity ($opt_set_wagon_capacity)\n";
		$opt_help = 1;
	}
}

if ($opt_set_high_skills ne "") {
	if ($opt_set_high_skills !~ /on|off/) {
		print "Bad value for --set-high-skills ($opt_set_high_skills)\n";
		$opt_help = 1;
	}
}

if ($opt_get_view_distance ne "") {
	if (($opt_get_view_distance < 0) or ($opt_get_view_distance > 5)) {
		print "Bad value for --get-view-distance ($opt_get_view_distance)\n";
		$opt_help = 1;
	}
	if ( ! is_slot_occupied $opt_get_view_distance ) {
		print "No save in slot $opt_get_view_distance\n";
		$die_early = 1;
	}
}

foreach my $key (keys %opt_set_view_distance) {
	my $val = $opt_set_view_distance{$key};
	if ($key !~ /[0-5]/) {
		print "Bad slot value for --set-view-distance ($key)\n";
		$opt_help = 1;
	}
	if (($val < 0) or ($val > 255)) {
		print "Bad view distance value for --set-view-distance $key ($val)\n";
		$opt_help = 1;
	}
	if ( ! is_slot_occupied $key ) {
		print "No save in slot $key\n";
		$die_early = 1;
	}
}

if ($opt_set_cheat_mode ne "") {
	if ($opt_set_cheat_mode !~ /on|off/) {
		print "Bad value for --set-cheat-mode ($opt_set_cheat_mode)\n";
		$opt_help = 1;
	}
}

if ($opt_set_magic_repair ne "") {
	if ($opt_set_magic_repair !~ /on|off/) {
		print "Bad value for --set-magic-repair ($opt_set_magic_repair)\n";
		$opt_help = 1;
	}
}

if ($opt_archive_save ne "") {
	if (($opt_archive_save < 0) or ($opt_archive_save > 5)) {
		print "Bad value for --archive-save ($opt_archive_save)\n";
		$opt_help = 1;
	}
	if ( ! is_slot_occupied $opt_archive_save ) {
		print "No save in slot $opt_archive_save\n";
		$die_early = 1;
	}
}

my %conflict_vals = ();
foreach my $key (keys %opt_restore_save) {
	my $val = $opt_restore_save{$key};
	if ( (expand_save_name $key) eq "" ) {
		print "No save matching $key\n"
	}
	if (($val < 0) or ($val > 5)) {
		print "Bad slot targets for --restore-save $key ($val)\n";
		$opt_help = 1;
	}
	if (exists $conflict_vals{$val}) {
		print "Conflicting slot targets\n";
		$die_early = 1;
	} else {
		$conflict_vals{$val} = 1;
	}
}

if ($opt_enable_mod ne "") {
	if ((! is_mod $opt_enable_mod) and (! is_group $opt_enable_mod)) {
		print "Bad mod name for --enable-mod ($opt_enable_mod)\n";
		$opt_help = 1;
	} elsif ((is_mod $opt_enable_mod) and (is_mod_enabled $opt_enable_mod)) {
		print "Mod \"$opt_enable_mod\" already enabled\n";
		$die_early = 1;
	} elsif (is_mod $opt_enable_mod) {
		my @conflicts = is_mod_conflicting $opt_enable_mod;
		if (@conflicts) {
			print "Mod \"$opt_enable_mod\" is conflicting with: ".join(' ', @conflicts)."\n";
			$die_early = 1;
		}
	}
}

if ($opt_disable_mod ne "") {
	if (! is_mod $opt_disable_mod) {
		print "Bad mod name for --disable-mod ($opt_disable_mod)\n";
		$opt_help = 1;
	} elsif  ( ! is_mod_enabled $opt_disable_mod) {
		print "Mod \"$opt_disable_mod\" not enabled\n";
		$die_early = 1;
	}
}

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
The Elder Scrolls II: Daggerfall launcher

usage:
  daggerfall [options]

available conflicting options:

  --run-setup                       run the sound setup utility
  --run-fixsave                     run fixsave, the save game fixing utility
  --run-fixmaps                     run fixmaps, the map fixing utility
  --run-daggerfall                  when any option is specified Daggerfall will
                                    not be started by launcher. This options
                                    forces start of game when all other tasks
                                    are finished

  --get-brightness                  returns current palette brightness
                                     0 means original, 1 means multiply gamma by 1.1,
                                     2 means multiply gamma by 1.2, etc.
  --set-brightness=<val>            sets brightness,
                                    accept any non-negative number
                                    (reasonable values are between 0 and 10)

  --get-wagon-capacity              returns current wagon capacity (in lbs)
  --set-wagon-capacity=<val>        sets current wagon capacity,
                                    accepts values between 1 to 16384

  --get-high-skills                 checks if skill levels above 100 are unlocked
  --set-high-skills=<val>           unlocks/locks skill levels above 100,
                                    accepts two values - on and off

  --get-cheat-mode                  checks if cheat mode is enabled
  --set-cheat-mode=<val>            enables/disables cheat mode
                                    accepts two values - on and off

  --get-magic-repair                checks if repairing of magical items is enabled
  --set-magic-repair=<val>          enables/disabled reparis of magical items

  --get-view-distance=<slot>        returns view distance set in given slot,
                                    accepts slot number, from 0 to 5
  --set-view-distance <slot>=<val>  sets view distance in given slot,
                                    accepts slot number, from 0 to 5 and
                                    value, from 0 to 255

  --list-saves                      list current saves
  --list-archived-saves             list archived saves
  --archive-save=<slot>             archive game from given slot,
                                    accepts slot number, from 0 to 5
  --archive-all-saves               archives all saves
  --restore-save <val>=<slot>       restores given archived save into requested slot,
                                    accepts save description and target slot,
                                    the save description is in form
                                      <slot>-<name>-<time stamp>,
                                    where if only slot given, current name for
                                    that slot is assumed, and if time stamp is
                                    not given, latest available is assumed,
                                    e.g. \"4\" is valid shortcut to any
                                    archived game from slot 4, and \"4-name\"
                                    is valid for any game from slot 4 with
                                    given name.

  --list-mods                       lists all mods and groups. Marks which
                                    mods/groups are enabled, lists any enabled
                                    but no longer installed mods
  --enable-mod=<val>                enabled given mod or group, taking care of
                                    dependencies
  --disable-mod=<val>               disables given mod, checks for dependencies
  --refresh-mods                    updates all enabled mods to latest installed
                                    versions

  --accept-terms                    accept Daggerfall terms of use

  --help                            display this help message
";
	exit;
}

if ($die_early) {
	exit
}

if ($opt_accept_terms) {
	$opt_run_daggerfall=0;
	accept_terms;
}

if ($opt_run_setup) {
	$opt_run_daggerfall=0;
	run_setup;
}

if ($opt_run_fixsave) {
	$opt_run_daggerfall=0;
	run_fixsave;
}

if ($opt_run_fixmaps) {
	$opt_run_daggerfall=0;
	run_fixmaps;
}

if ($opt_get_brightness) {
	$opt_run_daggerfall=0;
	my $value = get_brightness;
	print "Current palette brightness: $value\n";
}

if ($opt_set_brightness ne "") {
	$opt_run_daggerfall=0;
	set_brightness $opt_set_brightness;
}

if ($opt_get_wagon_capacity) {
	$opt_run_daggerfall=0;
	my $value = get_wagon_capacity;
	print "Current wagon capacity: $value lbs\n";
}

if ($opt_set_wagon_capacity ne "") {
	$opt_run_daggerfall=0;
	set_wagon_capacity $opt_set_wagon_capacity;
}

if ($opt_get_high_skills) {
	$opt_run_daggerfall=0;
	if (get_high_skills) {
		print "High skills are enabled\n";
	} else {
		print "High skills are disabled\n";
	}
}
	
if ($opt_set_high_skills ne "") {
	$opt_run_daggerfall=0;
	set_high_skills ($opt_set_high_skills =~ /on/);
}

if ($opt_get_view_distance ne "") {
	$opt_run_daggerfall=0;
	my $value = get_view_distance $opt_get_view_distance;
	print "View distance for save $opt_get_view_distance is $value.\n"
}

foreach my $key (keys %opt_set_view_distance) {
	$opt_run_daggerfall=0;
	my $val = $opt_set_view_distance{$key};
	set_view_distance $key, $val;
}

if ($opt_get_cheat_mode) {
	$opt_run_daggerfall=0;
	if (get_cheat_mode) {
		print "Cheat mode codes are enabled\n";
	} else {
		print "Cheat mode codes are disabled\n";
	}
}
	
if ($opt_set_cheat_mode ne "") {
	$opt_run_daggerfall=0;
	set_cheat_mode ($opt_set_cheat_mode =~ /on/);
}

if ($opt_get_magic_repair) {
	$opt_run_daggerfall=0;
	if (get_magic_repair) {
		print "Magic repairs are enabled\n";
	} else {
		print "Magic repairs are disabled\n";
	}
}
	
if ($opt_set_magic_repair ne "") {
	$opt_run_daggerfall=0;
	set_magic_repair ($opt_set_magic_repair =~ /on/);
}

if ($opt_list_saves) {
	$opt_run_daggerfall=0;
	my %saves = get_current_saves;
	my @slots = sort keys %saves;
	if ($#slots == -1) {
		print "No saves found\n";
	} else {
		foreach my $slot (@slots) {
			print "Save in slot $slot: $saves{$slot}\n"
		}
	}
}

if ($opt_list_archived_saves) {
	$opt_run_daggerfall=0;
	my %saves = get_archived_saves;
	my @slots = sort keys %saves;
	if ($#slots == -1) {
		print "No saves found\n";
	} else {
		foreach my $slot (sort keys %saves) {
			print "Archived saves from slot $slot\n\n";
			foreach my $name (sort keys $saves{$slot}) {
			print " saves named $name\n\n";
				foreach my $date (sort @{$saves{$slot}{$name}}) {
					$date =~ s/_/./;
					$date =~ s/_/./;
					$date =~ s/_/, /;
					$date =~ s/_/:/;
					$date =~ s/_/:/;
					print "  from ", $date, "\n";
				}
				print "\n";
			}
		}
	}
}

if ($opt_archive_save ne "") {
	$opt_run_daggerfall=0;
	archive_save $opt_archive_save;
	print "Archived save from slot $opt_archive_save\n";
}

if ($opt_archive_all_saves) {
	$opt_run_daggerfall=0;
	my $found = 0;
	foreach my $slot (0..5) {
		if ( is_slot_occupied $slot ) {
			$found = 1;
			archive_save $slot;
			print "Archived save from slot $slot\n";
		}
	}
	$found or print "All save slots are empty\n"
}

foreach my $key (keys %opt_restore_save) {
	$opt_run_daggerfall=0;
	my $val = $opt_restore_save{$key};
	my $proceed = 1;
	if ( is_slot_occupied $val ) {
		my $ans = "";
		until ($ans =~ /yes|no/) {
			print "You will overwrite existing save in slot $val, overwrite? (yes/no) ";
			$ans = <>;
			if ($ans !~ /yes|no/) {
				print "Please answer with \"yes\" or \"no\"\n";
			}
		}
		if ($ans =~ /no/) {
			$proceed = 0;
		}
	}
	if ($proceed) {
		my $full = expand_save_name $key;
		restore_save $key, $val;
		print "Restored save $full into slot $val\n";
	}
}

if ($opt_list_mods) {
	$opt_run_daggerfall=0;
	my $any = 0;
	my @mods = get_mods;
	if ( $#mods >= 0 ) {
		$any = 1;
		print "Installed mods:\n\n";
		foreach my $mod (@mods) {
			print " $mod";
			if (is_mod_enabled $mod) {
				print " (enabled)"
			}
			print "\n";
		}
		print "\n";
	}
	my @groups = get_mod_groups;
	if ( $#groups  >= 0 ) {
		$any = 1;
		print "Installed groups:\n\n";
		foreach my $group (@groups) {
			print " $group";
			if (is_mod_enabled $group) {
				print " (enabled)"
			}
			print "\n";
		}
		print "\n";
	}
	my @missing = ();
	my @enabled = get_enabled_mods;
	foreach my $mod (@enabled) {
		my @temp = grep(/^$mod$/, @mods);
		if ($#temp == -1) {
			push(@missing, $mod)
		}
	}
	if ( $#missing >= 0) {
		$any = 1;
		print "Enabled mods, no longer installed:\n\n";
		foreach my $mod (@missing) {
			print " $mod\n";
		}
		print "\n";
	}
	if (! $any) {
		print "No mods found\n";
	}
}

if ($opt_enable_mod ne "") {
	$opt_run_daggerfall=0;
	enable_mod $opt_enable_mod;
	if (is_mod $opt_enable_mod) {
		print "Enabled mod \"$opt_enable_mod\"\n"
	} else {
		print "Enabled group \"$opt_enable_mod\"\n"
	}
}

if ($opt_disable_mod ne "") {
	$opt_run_daggerfall=0;
	disable_mod $opt_disable_mod;
	if (is_mod $opt_disable_mod) {
		print "Disabled mod \"$opt_disable_mod\"\n"
	} else {
		print "Disabled group \"$opt_disable_mod\"\n"
	}
}

if ($opt_refresh_mods) {
	$opt_run_daggerfall=0;
	refresh_mods;
	print "Refreshed enabled mods to latest installed version\n"
}

$opt_run_daggerfall or $opt_force_run_daggerfall or exit;

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
		print "You should uninstall Daggerfall at once!\n";
		exit
	}
}

run_daggerfall;


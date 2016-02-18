#!/usr/bin/perl

use strict;



use vars qw {
	$Cp
	@Message_dirs
	$VOCP_conf_dir
	$Spool_dir
	%Spool_subdirs
	%LocalProgram_files
	%Other_Local_exes
	%Config_files
	@Doc_files
	@Com_shell_examples
	$Version
	$VOCP_group
	$Groupadd
	$LocalDir
	%PerlModule_dirs
	$Pwd
	%RequiredModules
	@LogFiles
	$pvftormdopt
	$LogDir
	};

if (defined $ARGV[0] ) {
$pvftormdopt = $ARGV[0];
} else {
$pvftormdopt = 'Lucent 5';
}
$LogDir='/var/log/';

$Cp='/usr/bin/cp';

$LocalDir = "/usr/local/vocp";

$VOCP_conf_dir = "/etc/vocp";

$Spool_dir = "/var/spool/voice";

@Message_dirs = ( 
		'messages/num',
		'messages/day',
		'messages/system',
		'messages/menu',
		'messages',
	);


sub convert_sound {

	#Do conversion of sound files
	my $pvftormd = '/usr/bin/pvftormd';
	
	print "\nConverting sound files, this can take a while...\n";

	chdir $LocalDir;
	
	foreach my $dir (@Message_dirs) {
		
		system("ls $dir/*.pvf | sed 's/\.pvf//' | xargs -i $pvftormd $pvftormdopt {}.pvf $Spool_dir/{}.rmd");
		
	}
	print "Done: sound files converted to rmd format.  "
		     ."Test them with:\n"
		     ."vm play -s -v ./sounds/path/to/file.rmd\n\n";
		     
	return 1;
}
&convert_sound;

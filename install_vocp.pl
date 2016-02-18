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
	$basedir
	$LogDir
	};

$basedir=$ARGV[0];

$LogDir='/var/log/';

$Cp='/usr/bin/cp';

$LocalDir = "$basedir/usr/local/vocp";

$VOCP_conf_dir = "$basedir/etc/vocp";

$Spool_dir = "$basedir/var/spool/voice";

@Message_dirs = ( 
		'messages/num',
		'messages/day',
		'messages/system',
		'messages/menu',
		'messages',
	);

%Spool_subdirs = (
		'incoming'	=> 'incoming',
		'cache'		=> 'incoming/cache',
		'messages'	=> 'messages',
		'commands'	=> 'commands',
		'num'		=> 'messages/num',
		'day'		=> 'messages/day',
		'system'	=> 'messages/system',
		'menu'		=> 'messages/menu',
		);


%PerlModule_dirs = (
	'VOCP'		=> 'prog/VOCP',
);

%LocalProgram_files = (
	'installer'	=> 'install_vocp.pl',
	'sampleconv'	=> 'modify_sample_rate.pl',
	'vocpweb'	=> 'vocpweb',
	'progbin'	=> 'prog/bin',
	'progrun'	=> 'prog/run',
	'proglib'	=> 'prog/lib',
	'images'	=> 'images',
	'sounds'	=> 'sounds',
	'testfax'	=> 'images/faxtest.g3',
);


%Other_Local_exes = (
	
	'vocp'	=> 'prog/vocp.pl',
);

	
%Config_files = (
	'genconf'	=> 'prog/vocp.conf',
	'boxconf'	=> 'prog/boxes.conf',
	'boxshadow'	=> 'prog/boxes.conf.shadow',
	'cidconf'	=> 'prog/cid-filter.conf',
	'boxsample'	=> 'prog/boxes.conf.sample',
);

@LogFiles = ("$basedir/var/log/vocp.log", "$basedir/var/log/vocp-calls.log");


@Doc_files = (
		'doc/*',
	);

@Com_shell_examples = ('commands/seleclisting.pl', 'commands/ip.pl',  'commands/date.pl',  'commands/echo.pl', 'commands/motd.pl');

$VOCP_group = 'vocp';



# Installs are the relevant files, sets permissions and 
# converts the sound files.
#
# Uses a bunch of system() calls - not pretty, but not
# too important, used only once...
#
# To be done: Check return values of all system() calls...

#main 
{

        $Pwd = `pwd`;
        chomp($Pwd);


	system("touch " . join(" ", @LogFiles));

	########################### Directories ################################
	
	print "\nCreating directories...\n";
	print "\t$VOCP_conf_dir\n";
	system("mkdir -p $VOCP_conf_dir");
	system("mkdir -p $LogDir");
	

	# Documentation dir
	my $docdir = "$LocalDir/doc";

	print "\t$docdir\n";
	# We call system to use the -p option
	system("mkdir -p $docdir");
	
	print "\t$Spool_dir\n";
	system("mkdir -p $Spool_dir");
	
	foreach my $dir (values %Spool_subdirs) {
		print "\t$Spool_dir/$dir\n";
		system("mkdir -p $Spool_dir/$dir");
	}
	
	print "\nDone.\n";

	########################### VOCP modules ################################
	#Copy program files
	chdir($Pwd);
	print "Installing VOCP Perl modules...\n";
	chdir($PerlModule_dirs{'VOCP'});
	system("perl Makefile.PL; make; make install");
	print "\nDone\n\n\n";
	chdir($Pwd);


	
	########################### Utility programs and files ################################

	print "Copying files...\n";
	
	print "\nConfiguration files\n";
	foreach my $file (values %Config_files) {
		print "\t$file to $VOCP_conf_dir\n";
		my $filename;
		if ($file =~ m|([^/]+$)|) { #usually will
			$filename = $1;
		}
		if ($filename && (-e "$VOCP_conf_dir/$filename") ) {
			print "$filename exists.  Saving new file as $filename.new - do a diff to see what has changed\n";
			system("$Cp $file $VOCP_conf_dir/$filename.new");
		} else {
			system("$Cp $file $VOCP_conf_dir");
		}
	}
	
	print "\nDocs\n";
	foreach my $file (@Doc_files) {
		print "\t$file to $docdir\n";
		system("$Cp $file $docdir");
	}
	
	
	
	chdir($LocalProgram_files{'progbin'});
	
	my $compiler = $ENV{'CC'} || 'gcc';
	print "Creating pwcheck setgid wrapper\n";
	system("$compiler -o pwcheck pwcheck.c");
	print "Creating xfer_to_vocp setuid wrapper\n";
	system("$compiler -o xfer_to_vocp xfer_to_vocp.c");
		my $festDir='/usr';
		$festDir =~ s|/$||;
		system("perl -pi -e \"s|txt2wavProg = '/path/to/bin/text2wave'|txt2wavProg = '$festDir/bin/text2wave'|g\" txttopvf")
				if ($festDir);



	chdir ($Pwd);
	
	foreach my $file (values %LocalProgram_files) {
		print "Installing $file to $LocalDir\n";
		system("$Cp -R $file $LocalDir");
	}
	
	foreach my $file (values %Other_Local_exes) {
		print "Installing $file to $LocalDir/bin\n";
		system("$Cp -R $file $LocalDir/bin");
	}
	
	
	
	print "\nPVF files to $LocalDir\n";
	foreach my $dir (@Message_dirs) {
		#print "\t$dir/*.pvf to $Spool_dir/$dir\n";
		system("mkdir -p $LocalDir/$dir");
		system("$Cp $dir/*.pvf $LocalDir/$dir");
	}
		
	print "\nCommand shell examples and stock programs\n";
	my $cmdspooldir = "$Spool_dir/$Spool_subdirs{'commands'}";
	foreach my $command (@Com_shell_examples)
	{
		my $filename;
		if ($command =~ m|.+/([^/]+)$|)
		{
			$filename = $1;
		} else {
			$filename = $command;
		}
		next if (-e "$cmdspooldir/$filename");
		
		
		print "\t$filename to $cmdspooldir\n";
		system("$Cp $command $cmdspooldir");
		chmod oct('0755'), "$cmdspooldir/$filename";
	}	

	
		
	
		print "\nWhat should the name of the new group be?\n[$VOCP_group]: ";
		# The incoming dir - so the the messages script can delete messages belonging to the owner
		chmod oct('1777'), "$Spool_dir/$Spool_subdirs{'incoming'}";
		

	my $uid=0;
	my $gid=498;
	system("groupadd -g $gid vocp");
		

	chown $uid, $gid, $LocalDir . '/bin/messages.pl', $VOCP_conf_dir . '/boxes.conf', $VOCP_conf_dir . '/boxes.conf.shadow',
			"$Spool_dir/$Spool_subdirs{'cache'}", "$LocalDir/bin/pwcheck.pl", "$LocalDir/bin/pwcheck";
	
	chmod oct('0644'), $VOCP_conf_dir . '/boxes.conf';
	chmod oct('0640'), $VOCP_conf_dir . '/boxes.conf.shadow';
	chmod oct('2755'), $LocalDir . '/bin/messages.pl';
	
	if (-e $LocalDir . '/bin/pwcheck')
	{
		chmod oct('2755'), $LocalDir . '/bin/pwcheck';
	} else {
		chmod oct('2755'), $LocalDir . '/bin/pwcheck.pl';
	}
	chmod oct('0755'), $LocalDir . '/bin/xvocp.pl';
	chmod oct('0755'), $LocalDir . '/bin/boxconf.pl';
	
	chmod oct('0775'), "$Spool_dir/$Spool_subdirs{'cache'}";
	
	
}

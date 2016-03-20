#!/usr/bin/perl

use Getopt::Long;

# ----------------------------------------------------------------
# $Header: /home/misaka/code/umodunpack/RCS/umodunpack.pl,v 1.11 2000/01/02 22:01:24 misaka Exp $
# ----------------------------------------------------------------

=pod

=head1 NAME

umodunpack.pl - Unpack an Unreal [Tournament] Umod file.

=head1 SYNOPSIS

  umodunpack.pl -h|--help|-v|--version
  umodunpack.pl -l|--list|-i|--info <umod_file>
  umodunpack.pl -u|--unpack <umod_file>
  umodunpack.pl -e|--extract <filename> <umod_file>
  umodunpack.pl -r|--readme <umod_file>

=head1 DESCRIPTION

Extract the packed Unreal [Tournament] mod files from a given umod.
Please read the BUGS section.

This script actually contains a 'umod' Perl package in it.  Currently,
it can only read and extract files from a umod, but concievably I
could add code to pack a umod file.

=head1 BUGS

The code to modify the Manifest.ini is currently disabled.  It appears
that there is no Manifest.ini file under Linux, and not having the
actual specs, I'm not certain if there are any other files that need
to be updated.  As it stands, mods seem to work fine without any
further changes.

The umod's requirements are not checked.  Maybe sometime soon.

Some of the code that parses the umod file could be more intelligent,
and may react in annoying ways if run on a file that isn't a umod, or
is a corrupt umod, or is just a umod that doesn't follow the rules I
made up from the umods I looked at.

=head1 AUTHOR

Initial code written by Mishka Gorodnitzky <misaka@pobox.com>.

umodINIGroup parseing patch added by Avatar <avatar@deva.net>.


=cut

# ----------------------------------------------------------------

my( $umodFileName, $UTBase, $umodFile );
my( $defaultUTBase ) = '.';
my( $rcfile ) = '.umodunpackrc';
my( $versionText ) = <<EOT;
umodunpack.pl v0.4 beta-quality by Mishka <misaka\@pobox.com>
  with enhancement by Avatar <avatar\@deva.net>.
  No warranty, use at your own risk.
EOT

my( $helpText ) = <<EOT;
Usage: $0 [--base <base_dir>] --list|--info|--unpack <umod_file>

  Unpack a Umod file for Unreal our Unreal Tournament.

    -h|--help             : this help
    -v|--version          : display version info
    -i|--info             : info on umod file
    -l|--list             : list files in Umod
    -b|--base <base_dir>  : base directory for Unreal install, default
                       	    is $defaultUTBase
    -u|--unpack           : extract the files to the UT basedir (default)
    -e|--extract <file>   : extract specific file
    -r|--readme           : view ReadMe file, if any, in umod

  Use 'perldoc $0' for more info.

EOT

# --------------------------------
# Process cmdline args and options.

my( $flagInfo, $flagList, $flagHelp, $flagVersion, $flagUnpack, $argExtract, 
    $flagReadme );

GetOptions( 'info'      => \$flagInfo,
	    'list!'     => \$flagList,
	    'help!'     => \$flagHelp,
	    'base=s'    => \$UTBase,
	    'unpack!'   => \$flagUnpack,
	    'extract=s' => \$argExtract,
	    'version!'  => \$flagVersion,
	    'readme!'   => \$flagReadme );

# Check if help was requested.
if( $flagHelp ) {

    print( $helpText );
    exit( 0 );
}

# Check if version info was requested.
if( $flagVersion ) {
    print( $versionText );
    exit( 0 );
}

# See if the UT basedir was given on the cmdline.
if( defined( $UTBase ) ) {

    # UT basedir given.
    #
    # Assuming the given dir exists, we'll be saveing it into
    # ~/.umodunpackrc
    if( !-d $UTBase ) {
	die( "Unreal base directory '$UTBase' not found\n" );
    }

    if( open( RCFILE, ">$ENV{ HOME }/$rcfile" ) ) {
	print( RCFILE "$UTBase\n" );
	close( RCFILE );
    }

} else {

    # UT basedir not given.
    #
    # Read it from our rcfile, if it exists.
    if( -e "$ENV{ HOME }/$rcfile" ) {
	if( open( RCFILE, "<$ENV{ HOME }/$rcfile" ) ) {
	    $UTBase = <RCFILE>;
	    chomp( $UTBase );
	    close( RCFILE );
	}
    } else {

	# rcfile doesn't exist, set basedir to the default dir.
	$UTBase = $defaultUTBase;
    }
}


# Grab the cmdline arg.
$umodFileName = shift( @ARGV );
if( !defined( $umodFileName ) ) {
    warn( "no umod file specified\n" );
    print( $helpText );
    exit( 1 );
}


# And make sure at least we're flagged for extraction, if nothing else.
$flagUnpack = 1
  if( !$flagInfo 
      and !$flagList 
      and !$flagHelp 
      and !$flagUnpack 
      and !$argExtract );

# --------------------------------
# Rev 'em up and get started.

# Initialize the umod file object.
#
# Most of the behind-the-scenes work is done here.
$umodFile = new umodFile ( -file => "$umodFileName" );

die( "$0: could not open or parse '$umodFileName': $!\n" )
  if( !defined( $umodFile ) );

# Set the base directory for extracted files.
$umodFile->utbase( $UTBase );

# Main branches.  Check what operation we are doing.

if( $flagInfo ) {

    # Print out umod info.
    #
    # You know, the one really annoying thing about object refs is that
    # they can't be used inside of a quoted region of text.  Makes for
    # ugly code, IMO.
    #
    # What really makes this code ugly is the need for optional data on
    # each line ... in each case the URL is optional.  Icki.

    print( "\n",
	   ' Mod Name: ', $umodFile->productname );
    print( ' (', $umodFile->producturl, ')' )
      if( defined( $umodFile->producturl ) );
    print( "\n",
	   '  Version: ', $umodFile->version );
    print( ' (', $umodFile->versionurl, ')' )
      if( defined( $umodFile->versionurl ) );
    print( "\n",
	   'Developer: ', $umodFile->developer );
    print( ' (', $umodFile->developerurl, ')' )
      if( defined( $umodFile->developerurl ) );
    print( "\n",
	   "\n" );

} elsif( $flagReadme ) {

    # Display the umod's readme file.
    #
    # The umod's readme file is listed in Setup group.  The umod object
    # grabs that and return that, if it's found.
    my( $readme ) = $umodFile->readme;

    if( defined( $readme ) ) {
	print( $umodFile->readme, "\n\n" );
    } else {
	print( "No umod readme found.\n" );
    }

} elsif( $flagList ) {

    # List out the packing list.

    my( @packingList ) = $umodFile->packingList;
    my( @iniChanges ) = $umodFile->iniChanges;

    print( "Requires:\n",
	   map( "  $_\n", keys( %{ $umodFile->requires } ) ), "\n" )
      if( $umodFile->requires );
    print( "Groups:\n",
	   map( "  $_\n", keys( %{ $umodFile->groups } ) ), "\n" )
      if( $umodFile->groups );
    print( "Packing List:\n",
	   map( "  $_->{ 'src' } ($_->{ 'size' }b)\n",
		@packingList ), "\n" );
    print( "INI File Changes:\n",
	   map( "  $_->{ 'file' }\n    [$_->{ 'section' }]\n    $_->{ 'key' }=$_->{ 'value' }\n",
		@iniChanges ), "\n" );


} elsif( $argExtract ) {

    # Extract a single file from the umod package.

    my( @packingList ) = $umodFile->packingList;
    my( $packedFile ) = grep( $_->{ 'src' } =~ $argExtract, @packingList );

    die( "$0: file '$argExtract' not found for extraction: $!\n" )
      if( !defined( $packedFile ) );

    print( "extracting file: $packedFile->{ src }\n" );
    $umodFile->extract( $packedFile )
      or die( "$0: error extracting file '$argExtract': $!\n" );

} elsif( $flagUnpack ) {

    # Simple extraction of packed files.
    # Added updates ini file functionality by Avatar.

    my( @packingList ) = $umodFile->packingList;
    my( @iniChanges ) = $umodFile->iniChanges;
    my( $packedFile, $file );

    foreach $packedFile ( @packingList ) {

	print( "extracting file: $packedFile->{ src }\n" );
	$umodFile->extract( $packedFile )
	  or die( "$0: error extracting files: $!\n" );

    }

    foreach my $change ( @iniChanges ) {
	my ( $iniName ) = "${UTBase}/$change->{ 'file' }";
	# Silly DOS backslashes ... 
	$iniName =~s-\\-/-g;

	print( "modifying ini file: $change->{ 'file' }\n" );

	open( INI, "<$iniName" )
	  or die( "$0: could not open $iniName for reading: $!" );

	my( $iniContents ) = <INI>;

	close( INI );

	# make a back up just in case
	open( INI, ">$iniName.bak" )
	  or die( "$0: could not open $iniName.bak for writing: $!" );

	print( INI $iniContents );

	close( INI );

	if( grep( /\[$change->{ 'section' }\]/, $iniContents ) ) {
	    $iniContents =~ s#(\[$change->{ 'section' }\])#$1\r\n$change->{ 'key' }=$change->{ 'value' }#;
        } else {
	    $iniContents .= "\r\n[$change->{ 'section' }]\r\n$change->{ 'key' }=$change->{ 'value' }\r\n\r\n";
	}

	open( INI, ">$iniName" )
	  or die( "$0: could not open $iniName for writing: $!" );

	print( INI $iniContents );

	close( INI );
    }

}

##################################################################
##################################################################

# This is the umodFile object package.
#
# This code is an implementation of a umod object in Perl.  It's not
# complete, it can't piece together a umod yet, etc, but it works fine
# for the extraction/unpacking.  Have any suggestions, or do you think
# you would use this more if it could pack together a umod file?  Let
# me know, I'll consider completeing it.

package umodFile;

# ----------------------------------------------------------------

# If you don't know what this sub is for you're going to have a rough
# time following. :)

sub new {

    my( $type ) = shift;
    my( %params ) = @_;
    my( $file ) = shift;
    my( $self ) = {};

    bless( $self );

    if( exists( $params{ -file } ) ) {
	$self->{ 'file' } = $params{ -file };
    } elsif( $file !~ m/^-/ ) {
	$self->{ 'file' } = $file;
    }

    if( exists( $self->{ 'file' } ) ) {
	$self->open or return( undef );
    }

    return( $self );

}

# ----------------------------------------------------------------

# Set/return file variable.

sub file {

    my( $self ) = shift;
    my( $file ) = shift;

    $self->{ 'file' } = $file
      if( $file );

    return( $self->{ 'file' } );

}

# ----------------------------------------------------------------

# Set/return UT base dir variable.

sub utbase {

    my( $self ) = shift;
    my( $utbase ) = shift;

    $self->{ 'utbase' } = $utbase
      if( $utbase );

    return( $self->{ 'utbase' } );

}

# ----------------------------------------------------------------

# Set/return product variable.

sub product {

    my( $self ) = shift;
    my( $product ) = shift;

    $self->{ 'product' } = $product
      if( $product );

    return( $self->{ 'product' } );

}

# ----------------------------------------------------------------

# Set/return version variable.

sub version {

    my( $self ) = shift;
    my( $version ) = shift;

    $self->{ 'version' } = $version
      if( $version );

    return( $self->{ 'version' } );

}

# ----------------------------------------------------------------

# Set/return archive name variable.

sub archive {

    my( $self ) = shift;
    my( $archive ) = shift;

    $self->{ 'archive' } = $archive
      if( $archive );

    return( $self->{ 'archive' } );

}

# ----------------------------------------------------------------

# Set/return requires data.

sub requires {

    my( $self ) = shift;
    my( %requires ) = @_;

    $self->{ 'requires' } = { %requires }
      if( %requires );

    return( $self->{ 'requires' } );

}

# ----------------------------------------------------------------

# Set/return groups data.

sub groups {

    my( $self ) = shift;
    my( %groups ) = @_;

    $self->{ 'groups' } = { %groups }
      if( %groups );

    return( $self->{ 'groups' } );

}

# ----------------------------------------------------------------

# Set/return product name variable.

sub productname {

    my( $self ) = shift;
    my( $productname ) = shift;

    $self->{ 'productname' } = $productname
      if( defined( $productname ) );

    return( $self->{ 'productname' } );

}

# ----------------------------------------------------------------

# Set/return product url variable.

sub producturl {

    my( $self ) = shift;
    my( $producturl ) = shift;

    $self->{ 'producturl' } = $producturl
      if( defined( $producturl ) );

    return( $self->{ 'producturl' } );

}

# ----------------------------------------------------------------

# Set/return version url variable.

sub versionurl {

    my( $self ) = shift;
    my( $versionurl ) = shift;

    $self->{ 'versionurl' } = $versionurl
      if( defined( $versionurl ) );

    return( $self->{ 'versionurl' } );

}

# ----------------------------------------------------------------

# Set/return developer variable.

sub developer {

    my( $self ) = shift;
    my( $developer ) = shift;

    $self->{ 'developer' } = $developer
      if( defined( $developer ) );

    return( $self->{ 'developer' } );

}

# ----------------------------------------------------------------

# Set/return developer url variable.

sub developerurl {

    my( $self ) = shift;
    my( $developerurl ) = shift;

    $self->{ 'developerurl' } = $developerurl
      if( defined( $developerurl ) );

    return( $self->{ 'developerurl' } );

}

# ----------------------------------------------------------------

# Set/return the filename of the ReadMe file.

sub readmefile {

    my( $self ) = shift;
    my( $readme ) = shift;

    $self->{ 'readmefile' } = $readme
      if( defined( $readme ) );

    return( $self->{ 'readmefile' } );

}

# ----------------------------------------------------------------

# Return the packing list.  
#
# At this point, this read-only.  This could change if I add the
# ability to pack a umod file.
#
# Each element in the returned list is a ref to a hash derived from
# the Src lines in the packed ini files.

sub packingList {

    my( $self ) = shift;

    return( @{ $self->{ 'packingList' } } );

}
# ----------------------------------------------------------------

# Return the ini change list.  
#
# Each element in the returned list is a ref to a hash derived from
# the Ini lines in the packed ini files.

sub iniChanges {

    my( $self ) = shift;

    return( @{ $self->{ 'iniChanges' } } );

}

# ----------------------------------------------------------------

# Open the umod file and parse it.
#
# Yup, here's the big one, forx.

sub open {

    my( $self ) = shift;
    my( $file ) = shift;
    my( $fileContents, $line, %sections, $section );
    my( @requires, @groups, @packingList, @iniChanges, $setupLen );
    my( $offset ) = 0;

    # Juggle $file passed to us, if any, with what we've already got.
    if( $file ) {
	$self->file( $file );
    } else {
	$file = $self->file;
    }

    # Open the file or be unhappy.
    if( !open( UMOD, "<$file" ) ) {
	warn( "$0: could not open file '$file' for reading: $!\n" );
	return( 0 );
    }

    undef( $/ );

    # Read in the whole file.
    $fileContents = <UMOD>;

    # Skip any non-section header lines at the beginning of the file.
    #
    # This is a paranoia check, it should, in theory, never be an
    # issue.
    while ( $fileContents !~ m/^\[.+\]\r\n/ ) {
	$line = nextLine( \$fileContents );
    }
    
    # Grab the first 'section' from the file to parse it.
    #
    # Note the 'do ... while', we do this because $line is
    # already populated from above, and it should be a section
    # header.
    do {
	$line = nextLine( \$fileContents );
	$line =~ s/\r\n$//;
	push( @sectionLines, $line );
    } while ( $fileContents !~ m/^\[.+\]\r\n/ );
    
    # The actual parsing is done here.
    #
    # The results are returned as a two-item list, perfect to go straight
    # into our %sections hash.
    %sections = parseSection( @sectionLines );
    
    # Make sure we got a setup section.
    if( !exists( $sections{ 'setup' } ) ) {
	warn( "$0: did not find setup section in file '$file'\n" );
	return( 0 );
    }

    # Set values in $self.
    $self->product( @{ $sections{ 'setup' }->{ 'product' } } );
    $self->version( @{ $sections{ 'setup' }->{ 'version' } } );
    $self->archive( @{ $sections{ 'setup' }->{ 'archive' } } );

    # Populate @requires and @groups.
    @requires = @{ $sections{ 'setup' }->{ 'requires' } };
    @groups = @{ $sections{ 'setup' }->{ 'group' } };

    my( @sectionsToGet ) = ( @requires, @groups );

    # Parse all the sections specified in the 'setup'.
    while( @sectionsToGet ) {
	
	my( @sectionLines, $sectionName, $section, $line );

	# Grab the next section, put into @sectionLines.
	#
	# You know what's also a pisser?  Now that I wrote the
	# Manifest.ini part, I can't help but wonder if that's a
	# better way to parse the .ini-type stuff here.  Of course,
	# I'm just sick of it and want to get this out the door ...
	# maybe I'll sort that out later.
	do {
	    $line = nextLine( \$fileContents );
	    $line =~ s/\r\n$//;
	    push( @sectionLines, $line );
	} while ( $fileContents !~ m/^\[.+\]\r\n/ );

	# Parse the gathered section.
	( $sectionName, $section ) = parseSection( @sectionLines );
	$sections{ $sectionName } = $section;

	# Remove this section from our @sectionsToGet list.
	@sectionsToGet = grep( lc( $_ ) ne $sectionName, @sectionsToGet );

	# Special processing needed if this is the 'setupgroup'.
	#
	# Note the lc() here ... we've assuming these silly .ini files
	# are case insensitive, but I think that's a bad assumption.
	# Will fix later.
	if( lc( $sectionName ) eq 'setupgroup' ) {

	    # Basically the setupgroup holds information on how long 
	    # the first couple of sections in the umod file are.  We
	    # use this info to extract the second part of the setup
	    # info, and to keep track of where the real files start
	    # in the umod file.

	    my( $line );
	    foreach $line ( @{ $section->{ 'copy' } } ) {
		my( $copy ) = parseSourceLine( $line );
		if( $copy->{ 'src' } eq 'System\Manifest.int' ) {
		    $setupLen = $copy->{ 'size' };
		}
	    }

	} elsif( exists( $section->{ 'file' } ) ) {

	    # If this section has some files listed in it, add them
	    # to the packing list, keeping track of it's offset in
	    # the file and length, etc.

	    my( $line );
	    foreach $line ( @{ $section->{ 'file' } } ) {
		my( $hash ) = parseSourceLine( $line );
		$hash->{ 'start' } = $offset;
		$offset += $hash->{ 'size' };
		push( @packingList, $hash );
	    }
	} elsif( lc( $sectionName ) eq 'umodinigroup' ) {

	    # If this section has some ini lines listed in it, add them
	    # to the ini changes list.

	    my( $line );
	    foreach $line ( @{ $section->{ 'ini' } } ) {
		my( $hash ) = parseIniLine( $line );
		push( @iniChanges, $hash );
	    }
	}
    }

    # Set variables in $self.
    $self->requires( map { $_ => $sections{ $_ } } @requires );
    $self->groups( map { $_ => $sections{ $_ } } @groups );
    $self->{ 'packingList' } = \@packingList;
    $self->{ 'iniChanges' } = \@iniChanges;

    # Store away the contents of the umod that has files in them.
    $self->{ 'contents' } = substr( $fileContents, $setupLen );

    # Snip off the second section of the setup part and parse it up.
    my( %setupini )
      = parseSection( split( /\r\n/, substr( $fileContents, 0, $setupLen-1 ) ) );

    # Set variables based on the setup section we just snarfed.
    $self->productname(  @{ $setupini{ 'setup' }->{ 'localproduct' } } );
    $self->producturl(   @{ $setupini{ 'setup' }->{ 'producturl'   } } );
    $self->versionurl(   @{ $setupini{ 'setup' }->{ 'versionurl'   } } );
    $self->developer(    @{ $setupini{ 'setup' }->{ 'developer'    } } );
    $self->developerurl( @{ $setupini{ 'setup' }->{ 'developerurl' } } );
    $self->readmefile  ( @{ $setupini{ 'setup' }->{ 'readme'       } } );

    return( 1 );

}
  
# ----------------------------------------------------------------

# Parse the next line off of the big scalar that are our contents.

sub nextLine {

    my( $contents ) = shift;
    my( $line );

    if( $ { $contents } =~ m/^.*\r\n/ ) {
	$ { $contents } = $';
	return( $& );
    } else {
	return( undef );
    }

}

# ----------------------------------------------------------------

# Parse a section of ini-like cra^H^H^Hstuff.
#
# I knew being familiar with Windows ini files would be good for 
# something one day.  Not.

sub parseSection {

    my( @lines ) = @_;
    my( $line, $sectionName, %settings );
    my( @sectionData );

    # Don't be confused by what's going on here.  The steps are:

    # while we have lines left
    while( $line = shift( @lines ) ) {

	# skip lines that aren't a section header (paranoia check)
	next if( $line !~ m/^\[(.+)\]/ );

	# @sectionData gets returned, $1 is the key to the hash we build
	push( @sectionData, lc( $1 ) );

	my( %hash );

	# while we have lines left, inner loop
	while( $line = shift( @lines ) ) {

	    # finish inner loop if we reached next section header
	    last if( $line =~ m/^\[.+\]/ );

	    # split the line up on /=/ and stick it into the hash
	    my( $key, $value ) = split( /=/, $line, 2 );
	    $key = lc( $key );

	    # add value to hash, creating a new anon list as necessary
	    if( exists( $hash{ $key } ) ) {
		push( @{ $hash{ $key } }, $value );
	    } else {
		$hash{ $key } = [ $value ];
	    }

	}

	# put line back if it's a section header
	unshift( @lines, $line )
	  if( $line =~ m/^\[.+\]/ );

	# add the hash to the list we'll return
	push( @sectionData, \%hash );

    }

    return( @sectionData );

}

# ----------------------------------------------------------------

# Parse a given 'Src' line.
#
# These lines exist in the ini sections of the umod and contain 
# information on files packed into the umod.  We do some simple
# processing to return a hash ref atomically.

sub parseSourceLine {

    my( $line ) = shift;
    my( %hash );

    $line =~ s/^\((.+)\)$/$1/;
    %hash = map {
	my( $key, $value ) = split( /=/, $_, 2 );
	( lc( $key ), $value )
    } split( /,/, $line );
#    $hash{ 'src' } =~ s/\\/\//g;

    return( \%hash );

}

# ----------------------------------------------------------------

# Parse a given 'Ini' line.
#
# These lines exist in the umodINIGroup sections of the umod and
# contain information on changes to the ini files.  We do some
# simple processing to return a hash ref atomically.

sub parseIniLine {

    my( $line ) = shift;
    my( %hash );

    # section can contain "."
    $line =~ s/(.*),(.*)\.(.*)=(.*)/
	$hash{ 'file' } = $1;
	$hash{ 'section' } = $2;
	$hash{ 'key' } = $3;
	$hash{ 'value' } = $4/e;

    return( \%hash );

}

# ----------------------------------------------------------------

# Extract the listed files.
#
# Files are expected to come in hash refs as returned from
# parseSourceLine above.  These hashes contain filenames, sizes, etc.

sub extract {

    my( $self     ) = shift;
    my( @srcFiles ) = @_;
    my( $srcFile );

    foreach $srcFile ( @srcFiles ) {

	my( $file ) = $srcFile->{ 'src' };
	my( $depth ) = 0;

	# Silly DOS backslashes ... 
	$file =~s-\\-/-g;

	# Set our working dir to UT base.
	my( $workDir ) = $self->utbase . '/';

	# First take apart $file makeing any directories
	while( $file =~ m-^(.+)/- ) {
	    my( $dir ) = $1;
	    $file = $';
	    if( ! -d "${workDir}$dir"
		and ! mkdir( "${workDir}$dir", 0755 ) ) {
		warn( "$0: error making dir $workDir$dir: $!\n" );
		return( undef );
	    }
	    # Add this to our 'working dir', as used above and below.
	    $workDir .= "$dir/";
	}

	# Don't clobber file if it exists, skip to next.
	#
	# Should add a 'force' option to get around this.
	if( -e "$workDir$file" ) {
	    warn( "$0: file exists, skipping: $file\n" );
	    next;
	}

	if( !open( OUTFILE, ">${workDir}$file" ) ) {
	    warn( "$0: error opening file for write '$workDir$file': $!\n" );
	    return( undef );
	}
	print( OUTFILE substr( $self->{ 'contents' },
			       $srcFile->{ 'start' },
			       $srcFile->{ 'size' } ) );
	if( !close( OUTFILE ) ) {
	    warn( "$0: error closeing or writing file '$workDir$file': $!\n" );
	    return( undef );
	}

    }

    return( 1 );

}

# ----------------------------------------------------------------

# Return the contents of the readme file, if it exists and if found.

sub readme {

    my( $self ) = shift;
    my( $readmeSrc );

    # Make sure there is a readme file as listed in Setup group.
    return( undef )
      if( !defined( $self->readmefile ) );

    ( $readmeSrc ) = grep( $_->{ 'src' } eq $self->readmefile, 
			   $self->packingList );

    return( $readmeSrc 
	    ? substr( $self->{ 'contents' }, $readmeSrc->{ 'start' }, $readmeSrc->{ 'size' } )
	    : undef );
		    

}

# ----------------------------------------------------------------

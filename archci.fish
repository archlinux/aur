#!/usr/bin/env fish

# Include the sx if we installed from aur
set PATH '/usr/lib/archci/node_modules/.bin' $PATH
set VERBOSE false
set JUSTHELPED false

function printUsage
	set JUSTHELPED true

	echo
	echo 'Usage:'
	echo
	echo '  archci.fish SRCDIR TRGDIR'
	echo
	echo 'Takes a source directory and according to the files living within it creates an app container image. For full information on the format of the source directory, read the README.md'
	echo
	echo 'Flags:'
	echo '  -h|--help'
	echo '      Show this help'
	echo
	echo '  -v|--verbose'
	echo '      Print more output'
	echo

	exit $argv[1]
end

# Abort after printing all messages
function abort
	echo $argv[1]

	exit 1
end

# Run a command silently if required and print progress
function run
	set action $argv[1]
	set cmd $argv[2..-1]
	set padding (math (tput cols) - 7)
	set error (mktemp)

	printf "\r\033[K%-"$padding"s %s" $action "[....]"

	if test $VERBOSE = true
		eval $cmd
	else
		eval $cmd > /dev/null ^ $error
	end

	if test $status = 0
		printf "\r\033[K%-"$padding"s %s\n" $action "["(set_color green)" OK "(set_color normal)"]"
	else
		printf "\r\033[K%-"$padding"s %s\n" $action "["(set_color red)"FAIL"(set_color normal)"]"

		echo
		cat $error

		exit 1
	end
end

# Cleanup once the script exits
function cleanup --on-process %self
	if test $JUSTHELPED != true
		echo
		echo "Cleaning Up"

		# Clean up pre script if neccessary
		if test $PRERUN = true -a $POSTRUN = false
			runPostScript
		end

		# Clean up remaining folders
		sudo rm -rf $BUILDDIR
		sudo rm -rf $AURDIR
		sudo rm -rf $AURBUILDDIR

		echo 'Done'
	end
end

# Exit immediately if a command is not found
function notfound --on-event fish_command_not_found
	abort 'Command Not Found'
end

function validateManifest
	test -f $MANIFEST
	and actool validate $MANIFEST
end

function extractLabels
	# Extract labels from manifest
	set -g MOS (sx -jxi $MANIFEST x.labels | sx -jxlf "x.name==='os'" | sx -jx x.value)
	and set -g MARCH (sx -jxi $MANIFEST x.labels | sx -jxlf "x.name==='arch'" | sx -jx x.value)
	and set -g MNAME (sx -jxi $MANIFEST 'x.name.split("/")[1]')
	and set -g MVERSION (sx -jxi $MANIFEST x.labels | sx -jxlf "x.name==='version'" | sx -jx x.value)
	and set -g MUSER (sx -jxi $MANIFEST x.app.user)
	and set -g MGROUP (sx -jxi $MANIFEST x.app.group)

	# If we have no version in the manifest and no installed packages, abort
	and if test -z "$MVERSION" -a ! -f $ARCH -a ! -f $AUR
		abort 'No version in manifest and no aur/arch packages!'
	end
end

function bootstrapRootFS
	mkdir -pm 755 $BUILDDIR/rootfs
	and sudo pacstrap -cdGM $BUILDDIR/rootfs filesystem
end

function runPreScript
	if test -f $PRESCRIPT
		. $PRESCRIPT $BUILDDIR/rootfs
		and set -g PRERUN true
	end
end

function installDepsArch
	if test -f $ARCHBUILD
		sudo pacman --asdeps --noconfirm -r $BUILDDIR/rootfs -S (cat $ARCHBUILD)
	end
end

function installDepsAur
	if test -f $AURBUILD
		# Only make the packages with pacaur, then install them with pacman
		env PKGDEST=$AURBUILDDIR pacaur --noconfirm --noedit --foreign -m (cat $AURBUILD)
		and sudo pacman -r $BUILDDIR/rootfs --asdeps --noconfirm -U $AURBUILDDIR/*
	end
end

function installArch
	if test -f $ARCH
		sudo pacman --noconfirm --asexplicit -r $BUILDDIR/rootfs -S (cat $ARCH)
	end
end

function installAur
	if test -f $AUR
		# Only make the packages with pacaur, then install them with pacman
		env "PKGDEST=$AURDIR" pacaur --noconfirm --noedit --foreign -m (cat $AUR)
		and sudo pacman -r $BUILDDIR/rootfs --asexplicit --noconfirm -U $AURDIR/*
	end
end

function copyRootFS
	if test -d $ROOTFS
		sudo cp -rpf $ROOTFS $BUILDDIR
	end
end

function runBuildScript
	if test -f $BUILDSCRIPT
		cp $BUILDSCRIPT $BUILDDIR/rootfs/build
		and sudo chroot $BUILDDIR/rootfs /build
		and sudo rm -rf $BUILDDIR/rootfs/build
	end
end

function runPostScript
	if test -f $POSTSCRIPT
		. $POSTSCRIPT $BUILDDIR/rootfs
		and set -g POSTRUN true
	end
end

function removeDeps
	if not test -z (pacman -Qtdqr $BUILDDIR/rootfs)
		sudo pacman --noconfirm -r $BUILDDIR/rootfs -Rns (pacman -Qtdqr $BUILDDIR/rootfs)
	end
end

function copyManifest
	# Extract user and group ids from rootfs
	set NMUSER (cat $BUILDDIR/rootfs/etc/passwd | grep "^$MUSER:" | cut -d: -f3)
	set NMGROUP (cat $BUILDDIR/rootfs/etc/group | grep "^$MGROUP:" | cut -d: -f3)

	# If we have no version, load it from the first installed package
	if test -z $MVERSION
		if test -f $AUR
			set -g MVERSION (sudo pacman -r $BUILDDIR/rootfs -Q (head -1 $AUR) | sed 's/[^ ]* //')
		else
			set -g MVERSION (sudo pacman -r $BUILDDIR/rootfs -Q (head -1 $ARCH) | sed 's/[^ ]* //')
		end
	end

	# Copy and patch the manifest
	cp "$MANIFEST" "$BUILDDIR/manifest"

	if not test -z $MVERSION
		# Patch in the new version
		sx -jxpF $BUILDDIR/manifest "x.labels.push({'name':'version', 'value':'$MVERSION'}); x"
	end

	# Patch in the resolved or group if available
	sx -jxpF $BUILDDIR/manifest "x.app.user = '$NMUSER' || '$MUSER'; x"
	sx -jxpF $BUILDDIR/manifest "x.app.group = '$NMGROUP' || '$MGROUP'; x"
end

function buildACI
	# Combine infos into ACI name
	set ACI "$TRGDIR/images/$MOS/$MARCH/$MNAME-$MVERSION.aci"
	mkdir -p (dirname "$ACI")

	# Build the aci
	and sudo actool build $BUILDDIR $ACI

	# Generate Signature
	and gpg --armor --output $ACI.asc --detach-sig $ACI
end

# Parse arguments
for arg in $argv
	switch $arg
		case -h --help
			printUsage
		case -v --verbose
			set -g VERBOSE true
	end
end

set SRCDIR (realpath $argv[-2])
set TRGDIR (realpath $argv[-1])

# Validate Input
if not test -d $SRCDIR -a -d $TRGDIR
	echo "Source or Target Directory not found!"
	echo

	printUsage 1
end


# Prepare everything
set NAME (basename "$SRCDIR")

set PRERUN false
set POSTRUN false

set AURDIR (mktemp -d)
set AURBUILDDIR (mktemp -d)
set BUILDDIR (mktemp -d)

set AUR "$SRCDIR/aur.deps"
set ARCH "$SRCDIR/arch.deps"
set AURBUILD "$SRCDIR/aur.build.deps"
set ARCHBUILD "$SRCDIR/arch.build.deps"

set ROOTFS "$SRCDIR/rootfs"
set PRESCRIPT "$SRCDIR/pre"
set POSTSCRIPT "$SRCDIR/post"
set BUILDSCRIPT "$SRCDIR/build"
set MANIFEST "$SRCDIR/manifest"

# Run all steps
run "Validating Manifest" validateManifest
run "Extracting Labels" extractLabels
run "Setting Up rootfs" bootstrapRootFS
run "Running pre Script" runPreScript
run "Installing Arch Dependencies" installDepsArch
run "Installing Aur Dependencies" installDepsAur
run "Installing Arch Packages" installArch
run "Installing Aur Packages" installAur
run "Copying over rootfs" copyRootFS
run "Running build Script" runBuildScript
run "Running post Script" runPostScript
run "Removing Dependencies" removeDeps
run "Copying Manifest" copyManifest
run "Building ACI" buildACI

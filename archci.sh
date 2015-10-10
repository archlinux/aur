#!/bin/bash
set -e

# Include the sx if we installed from aur
PATH="/usr/lib/archci/node_modules/.bin:$PATH"

function printUsage() {
	echo
	echo 'Usage:'
	echo
	echo '  acis.sh SRCDIR TRGDIR'
	echo
	echo 'Takes a source directory and according to the files living within it creates an app container image. For full information on the format of the source directory, read the README.md'
	echo
	echo 'Flags:'
	echo '  -h|--help'
	echo '      Show this help'
	echo
}

function validateManifest() {
	echo "### Validating Package $NAME"
	if [ ! -f "$MANIFEST" ]; then
		echo "No Manifest found!"
		exit 1
	fi

	actool validate "$MANIFEST"
}

function extractLabels() {
	# Extract labels from manifest
	MOS=$(sx -jxi $MANIFEST x.labels | sx -jxlf "x.name==='os'" | sx -jx x.value)
	MARCH=$(sx -jxi $MANIFEST x.labels | sx -jxlf "x.name==='arch'" | sx -jx x.value)
	MNAME=$(sx -jxi $MANIFEST 'x.name.split("/")[1]')
	MVERSION=$(sx -jxi $MANIFEST x.labels | sx -jxlf "x.name==='version'" | sx -jx x.value)
	MUSER=$(sx -jxi $MANIFEST x.app.user)
	MGROUP=$(sx -jxi $MANIFEST x.app.group)

	# If we have no version in the manifest and no installed packages, abort
	if [ -z $MVERSION ]; then
		if [ ! -f $ARCH ] && [ ! -f $AUR ]; then
			echo "No version in manifest and no aur/arch packages!"
			exit 1
		fi
	fi
}

function bootstrapRootFS() {
	echo "### Building Package $NAME"
	mkdir -pm 755 "$BUILDDIR/rootfs"
	sudo pacstrap -cdGM "$BUILDDIR/rootfs" filesystem
}

function runPreScript() {
	if [ -f "$PRESCRIPT" ]; then
		. "$PRESCRIPT" "$BUILDDIR/rootfs"
	fi
}

function installDepsArch() {
	if [ -f "$ARCHBUILD" ]; then
		sudo pacman --asdeps --noconfirm -r "$BUILDDIR/rootfs" -S $(cat "$ARCHBUILD")
	fi
}

function installDepsAur() {
	if [ -f "$AURBUILD" ]; then
		PKGDEST="$AURBUILDDIR" pacaur --noconfirm --noedit -m $(cat "$AURBUILD")
		sudo pacman -r "$BUILDDIR/rootfs" --asdeps --noconfirm -U $AURBUILDDIR/*
	fi
}

function installArch() {
	if [ -f "$ARCH" ]; then
		sudo pacman --noconfirm --asexplicit -r "$BUILDDIR/rootfs" -S $(cat "$ARCH")
	fi
}

function installAur() {
	if [ -f "$AUR" ]; then
		PKGDEST="$AURDIR" pacaur --noconfirm --foreign --noedit -m $(cat "$AUR")
		sudo pacman -r "$BUILDDIR/rootfs" --noconfirm -U $AURDIR/*
	fi
}

function copyRootFS() {
	if [ -d "$ROOTFS" ]; then
		sudo cp -rpf "$ROOTFS" "$BUILDDIR"
	fi
}

function runBuildScript() {
	if [ -f "$BUILDSCRIPT" ]; then
		cp "$BUILDSCRIPT" "$BUILDDIR/rootfs/build"
		sudo chroot "$BUILDDIR/rootfs" /build
		sudo rm -rf "$BUILDDIR/rootfs/build"
	fi
}

function runPostScript() {
	if [ -f "$POSTSCRIPT" ]; then
		. "$POSTSCRIPT" "$BUILDDIR/rootfs"
	fi
}

function removeDeps() {
	if [ ! -z "$(pacman -Qtdqr "$BUILDDIR/rootfs")" ]; then
		sudo pacman --noconfirm -r "$BUILDDIR/rootfs" -Rns $(pacman -Qtdqr "$BUILDDIR/rootfs")
	fi
}

function copyManifest() {
	# Extract user and group ids from rootfs
	NMUSER=$(cat "$BUILDDIR/rootfs/etc/passwd" | grep "^$MUSER:" | cut -d: -f3)
	NMGROUP=$(cat "$BUILDDIR/rootfs/etc/group" | grep "^$MGROUP:" | cut -d: -f3)

	# If we have no version, load it from the first installed package
	if [ -z $MVERSION ]; then
		if [ -f $AUR ] ; then
			MVERSION=$(sudo pacman -r "$BUILDDIR/rootfs" -Q $(head -1 "$AUR") | sed 's/[^ ]* //')
		else
			MVERSION=$(sudo pacman -r "$BUILDDIR/rootfs" -Q $(head -1 "$ARCH") | sed 's/[^ ]* //')
		fi
	fi

	# Copy and patch the manifest with the version
	if [ -z $MVERSION ]; then
		sx -jxpi "$MANIFEST" -o "$BUILDDIR/manifest" "x.labels.push({'name':'version', 'value':'$MVERSION'}); x"
	else
		cp "$MANIFEST" "$BUILDDIR/manifest"
	fi

	sx -jxpF "$BUILDDIR/manifest" "x.app.user = '$NMUSER' || '$MUSER'; x"
	sx -jxpF "$BUILDDIR/manifest" "x.app.group = '$NMGROUP' || '$MGROUP'; x"
}

function buildACI() {
	# Combine infos into ACI name
	ACI="$TRGDIR/images/$MOS/$MARCH/$MNAME-$MVERSION.aci"
	mkdir -p $(dirname "$ACI")

	# Build the aci
	sudo actool build "$BUILDDIR" "$ACI"

	# Generate Signature
	gpg --armor --output "$ACI.asc" --detach-sig "$ACI"
}

function cleanup() {
	echo
	echo "Cleaning Up"

	# Clean up
	sudo rm -rf "$BUILDDIR"
	sudo rm -rf "$AURDIR"
	sudo rm -rf "$AURBUILDDIR"

	echo "Done"
}

# Parse arguments
while [[ $# > 0 ]]; do
	arg="$1"

	case $arg in
		-h|--help)
			printUsage
			exit 0
			;;
		*)
			SRCDIR=$(realpath "$1")
			TRGDIR=$(realpath "$2")
			break
		;;
	esac

	shift
done

# Validate Input
if [ ! -d "$SRCDIR" ] || [ ! -d "$TRGDIR" ]; then
	echo "Source or Target Directory not found!"
	echo
	printUsage
	exit 1
fi

# Run cleanup on error
trap cleanup EXIT

# Prepare everything
NAME=$(basename "$SRCDIR")

AURDIR=$(mktemp -d)
AURBUILDDIR=$(mktemp -d)
BUILDDIR=$(mktemp -d)

AUR="$SRCDIR/aur.deps"
ARCH="$SRCDIR/arch.deps"
AURBUILD="$SRCDIR/aur.build.deps"
ARCHBUILD="$SRCDIR/arch.build.deps"

ROOTFS="$SRCDIR/rootfs"
PRESCRIPT="$SRCDIR/pre"
POSTSCRIPT="$SRCDIR/post"
BUILDSCRIPT="$SRCDIR/build"
MANIFEST="$SRCDIR/manifest"

# Run all steps
validateManifest
extractLabels
bootstrapRootFS
runPreScript
installDepsArch
installDepsAur
installArch
installAur
copyRootFS
runBuildScript
runPostScript
removeDeps
copyManifest
buildACI

#!/bin/bash
set -e
set -o pipefail

PATH="/usr/lib/archci/node_modules/.bin:$PATH"
SRCDIR=$(realpath "$1")
TRGDIR=$(realpath "$2")
NAME=$(basename "$1")

AURDIR=$(mktemp -d)
BUILDDIR=$(mktemp -d)

AUR="$SRCDIR/aur.deps"
ARCH="$SRCDIR/arch.deps"
AURBUILD="$SRCDIR/aur.build.deps"
ARCHBUILD="$SRCDIR/arch.build.deps"

ROOTFS="$SRCDIR/rootfs"
SCRIPT="$SRCDIR/build"
MANIFEST="$SRCDIR/manifest"

# Validate manifest
echo "### Validating Package $NAME"
if [ ! -f "$MANIFEST" ]; then
	echo "No Manifest found!"
	exit 1
fi

actool validate "$MANIFEST"

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

# Start building
echo "### Building Package $NAME"
mkdir -pm 755 "$BUILDDIR/rootfs"
sudo pacstrap -cdGM "$BUILDDIR/rootfs" filesystem

# Install Arch build dependencies
if [ -f "$ARCHBUILD" ]; then
	sudo pacman --asdeps --noconfirm -r "$BUILDDIR/rootfs" -S $(cat "$ARCHBUILD")
fi

# Install Aur build dependencies
if [ -f "$AURBUILD" ]; then
	PKGDEST="$AURDIR" pacaur --noconfirm --noedit -m $(cat "$AURBUILD")
	sudo pacman -r "$BUILDDIR/rootfs" --asdeps --noconfirm -U $AURDIR/*
	rm -rf "$AURDIR"
fi

# Install Repo Dependencies
if [ -f "$ARCH" ]; then
	sudo pacman --noconfirm --asexplicit -r "$BUILDDIR/rootfs" -S $(cat "$ARCH")
fi

# Install Aur dependencies
if [ -f "$AUR" ]; then
	PKGDEST="$AURDIR" pacaur --noconfirm --foreign --noedit -m $(cat "$AUR")
	sudo pacman -r "$BUILDDIR/rootfs" --noconfirm -U $AURDIR/*
	rm -rf "$AURDIR"
fi

# Copy any files from the rootfs over
if [ -d "$ROOTFS" ]; then
	sudo cp -rpf "$ROOTFS" "$BUILDDIR"
fi

# Run the install script
if [ -f "$SCRIPT" ]; then
	cp "$SCRIPT" "$BUILDDIR/rootfs"
	sudo chroot "$BUILDDIR/rootfs" /build
	rm "$BUILDDIR/rootfs/build"
fi

# Resolve possible user-/groupname
NMUSER=$(cat "$BUILDDIR/rootfs/etc/passwd" | grep "^$MUSER:" | cut -d: -f3)
NMGROUP=$(cat "$BUILDDIR/rootfs/etc/group" | grep "^$MGROUP:" | cut -d: -f3)

# Remove build dependencies
if [ ! -z "$(pacman -Qtdqr "$BUILDDIR/rootfs")" ]; then
	sudo pacman --noconfirm -r "$BUILDDIR/rootfs" -Rns $(pacman -Qtdqr "$BUILDDIR/rootfs")
fi

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

# Combine infos into ACI name
ACI="$TRGDIR/images/$MOS/$MARCH/$MNAME-$MVERSION.aci"
mkdir -p $(dirname "$ACI")

# Build the aci and clean up
sudo actool build "$BUILDDIR" "$ACI"
sudo rm -rf "$BUILDDIR"
sudo rm -rf "$AURDIR"

# Generate Signature
gpg --armor --output "$ACI.asc" --detach-sig "$ACI"


pkgname=wenger-local-fs-mount-bind
pkgdesc="Local Filesystem Mount Bind Service"

pkgver=0.2
pkgrel=1

arch=('any')

url="https://github.com/wengerbinning/wenger-local-fs-mount-bind.git"
license=('GPL')

# ============================================================================ #

# desc: patch files
prepare() {
	echo "prepare package ..."
}

build () {
	echo "build source ..."
}

check () {
	echo "check package ..."
}

package() {
	install -d $pkgdir/usr/bin
	install -d $pkgdir/etc/mount
	install -d $pkgdir/usr/lib/systemd/system

	install -m 755 $startdir/mount-bind.sh $pkgdir/usr/bin/mount-bind
	install -m 644 $startdir/local-fs-mount-bind.service $pkgdir//usr/lib/systemd/system
	install -m 664 $startdir/bind.conf $pkgdir/etc/mount
}

# ---------------------------------------------------------------------------- #

pre_install () {
	echo "pre install package ..."
}

post_install () {
	echo "post install package ..."
}

# ---------------------------------------------------------------------------- #

pre_upgrade () {
	echo "pre upgrade package ..."
}

post_upgrade () {
	echo "post upgrade package ..."
}

# ---------------------------------------------------------------------------- #

pre_remove () {
	echo "pre remove package ..."
}

post_remove () {
	echo "post remove package ..."
}

# ============================================================================ #
# Maintainer: F Carpano < gmail-com: daert781 >
# Contributor: Anthony Samartsev <kycok@archlinux.info>

pkgname=xcursor-osx-elcap
pkgver=1.00
pkgrel=3
pkgdesc="Cursor theme from OSX"
arch=('any')
url="https://www.gnome-look.org/p/1084939/"
license=('GPL')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1461053384/s/${_hash_time[0]}/t/${_hash_time[1]}/u/175749-OSX-ElCap.tar.bz2")
sha512sums=('ae880f22446a531137250aec8bf282f1b68cfafe86cf742d13b950c7a3cf8ae923efecffde3915dd9d320dd549c0bcbea51b8be1a6f97ae7548b203ea09c4d39')

build() {
	true
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r OSX-ElCap/OSX-ElCap $pkgdir/usr/share/icons
}

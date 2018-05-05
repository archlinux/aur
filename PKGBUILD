# Maintainer: E5ten

pkgname=libvlc
pkgver=5.6.0
pkgrel=1
pkgdesc="The VLC library not bundled with VLC so one can use things depending on the lib without installing VLC"
arch=('x86_64')
url='https://www.videolan.org/LibVLC/'
license=('LGPL')
depends=('libvlccore')
source=("https://mex.mirror.pkgbuild.com/extra/os/x86_64/vlc-3.0.1-2-x86_64.pkg.tar.xz")
md5sums=('a906947ae388875fdd08a68ac6ee4c1c')

package() {
	cd $srcdir/usr/lib
	mkdir -p $pkgdir/usr/lib
	cp libvlc.so.$pkgver $pkgdir/usr/lib/
	ln -s /usr/lib/libvlc.so.$pkgver $pkgdir/usr/lib/libvlc.so.5
	ln -s /usr/lib/libvlc.so.$pkgver $pkgdir/usr/lib/libvlc.so
}
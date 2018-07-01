# Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=theeram
pkgver=0.9.0
pkgrel=2
pkgdesc="Malayalam Dictionary based on Olam."
url="https://nandakumar.co.in/apps/theeram/"
license=('GPL3')
depends=('glibc' 'gtk3' 'libnotify' 'libxml2')
arch=(x86_64)
source=("https://launchpadlibrarian.net/328067651/theeram_0.9.0_amd64.deb")
install='theeram.install'
md5sums=('6217c800260667bb671a290ad0f0f957')

package() {
	tar xf "$srcdir/data.tar.xz"
	mkdir "$pkgdir/usr"
	cp -r "$srcdir/usr/share" "$pkgdir/usr/"
	cp -r "$srcdir/usr/bin" "$pkgdir/usr/bin"
}


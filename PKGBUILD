# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=umview
pkgver=0.8.2
pkgrel=2
pkgdesc="User-mode implementation of View-OS."
arch=('x86_64')
url="sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.15'
         'libumlib0=0.8.2')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://ftp.us.debian.org/debian/pool/main/u/umview/umview_0.8.2-1.1_amd64.deb")
md5sums=("7eafe4e65c339a2527f43a5b4af26bb4")

prepare() {
   cd "$srcdir"
   tar -xf data.tar.xz
}

package() {
   cp -r "${srcdir}/usr" "$pkgdir"
}

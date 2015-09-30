# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=umview-mod-umlwip
pkgver=0.8.2
pkgrel=2
pkgdesc="LWIPv6 gateway module."
arch=('x86_64')
url="https://www.sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.4'
         'libumlib0=0.8.2'
         'liblwipv6')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://ftp.us.debian.org/debian/pool/main/u/umview/umview-mod-umlwip_0.8.2-1.1_amd64.deb")
md5sums=("b5fbf254aadcffeff79100d9d6129f4b")

prepare() {
   cd "$srcdir"
   tar -xf data.tar.xz
}

package() {
   cp -r "${srcdir}/usr" "$pkgdir"
}

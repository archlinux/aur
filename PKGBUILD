# Maintainer: David Grisham <dmgrisham@gmail.com>
pkgname=bbmp-bin
pkgver=v0.1.2
pkgrel=1
pkgdesc="Based Black Music Player"
arch=(x86_64)
url="https://github.com/dgrisham/bbmp"
license=('GPL')
source=("https://github.com/dgrisham/bbmp/releases/download/${pkgver}/bbmp")
depends=('mpd')
sha256sums=('a39ce75be168c8b5c77c6f32706410438c9f008ff202360690074b3cd0faf39a')

package() {
	install -Dm0755 $pkgname "$pkgdir/usr/bin/bbmp"
}

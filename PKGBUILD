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
sha256sums=('db6122574d1e2df940f27d01d222313f0ddecfb25f93c79c65910896aae130dc')

package() {
	install -Dm0755 $pkgname "$pkgdir/usr/bin/bbmp"
}

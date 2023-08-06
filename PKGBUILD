# Maintainer: David Grisham <dmgrisham@gmail.com>
pkgname=bbmp-bin
pkgver=v0.1.1
pkgrel=1
pkgdesc="Based Black Music Player"
arch=(x86_64)
url="https://github.com/dgrisham/bbmp"
license=('GPL')
source=("https://github.com/dgrisham/bbmp/releases/download/${pkgver}/bbmp")
depends=('mpd')
sha256sums=('1a4d8daced58d373ffa68011763871b3fb703a31107979c1a404a5f33f71fe6e')

package() {
	install -Dm0755 $pkgname "$pkgdir/usr/bin/bbmp"
}

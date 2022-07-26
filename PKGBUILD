# Maintainer: David Grisham <dmgrisham@gmail.com>
pkgname=bbmp
pkgver=v0.1.0
pkgrel=1
pkgdesc="Based Black Music Player"
arch=(x86_64)
url="https://github.com/dgrisham/bbmp"
license=('GPL')
source=("https://github.com/dgrisham/bbmp/releases/download/${pkgver}/bbmp")
depends=('mpd')
md5sums=(4cfbf49907748458211aa23cf3855678)

package() {
	install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

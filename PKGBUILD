# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

pkgname=nnss
pkgver=0.3.0
pkgrel=1
pkgdesc='Network Namespace setup using SSH SOCKS proxy'
arch=('any')
license=('MPL')
depends=('tun2socks')
url="https://gitea.balki.me/balki/$pkgname"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('db3c866274224204259c4e48522fee5ac7678d34b02a0285f1073661027402ac')

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" install
}

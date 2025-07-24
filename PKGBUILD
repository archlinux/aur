# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

pkgname=nnss
pkgver=0.4.0
pkgrel=2
pkgdesc='Network Namespace setup using SSH SOCKS proxy'
arch=('any')
license=('MPL-2.0')
depends=('tun2socks')
url="https://gitea.balki.me/balki/$pkgname"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('77762256ac669c7fd484424520fc4d6eac453e5a0068b633923e8fa9d5c16279')

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" install
}

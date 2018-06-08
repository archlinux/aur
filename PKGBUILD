# Maintainer: Caleb Woodbine <github.com/BobyMCbobs>
pkgname=getnewip
pkgver=2.1.2
pkgrel=1
pkgdesc="Sync dynamic public IP addresses of GNU/Linux servers with the hostname in a user's SSH config file, via Dropbox."
arch=('any')
url="https://gitlab.com/BobyMCbobs/${pkgname}"
license=('GPL')
depends=('gnu-netcat' 'curl' 'bash' 'openssh')
source=("https://gitlab.com/BobyMCbobs/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('5606ba79968df05ad640c89350595553')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

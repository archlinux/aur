# Maintainer: Caleb Woodbine <gitlab.com/BobyMCbobs>
pkgname=uploadnewip
pkgver=2.1.2
pkgrel=1
pkgdesc="Upload new dynamic public IP address of a GNU/Linux server to Dropbox every time it changes."
arch=('any')
url="https://gitlab.com/BobyMCbobs/${pkgname}"
license=('GPL')
depends=('curl' 'bash')
source=("https://gitlab.com/BobyMCbobs/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('7ee3170b22508167c63642bb83650b51')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

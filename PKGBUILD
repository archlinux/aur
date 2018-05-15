# Maintainer: Christian Bundy <christianbundy@fraction.io>
# Contributor: Raphael Simon <simon.raphael@gmail.com>

pkgname=samus-scripts
pkgver=3.0.0
pkgrel=1
pkgdesc="A collection of scripts for the Chromebook Pixel (2015), codename Samus."
arch=('any')
url="https://gitlab.com/christianbundy/samus-scripts"
license=('GPL2')
depends=('bash')
optdepends=('mxt-app')
source=("https://gitlab.com/christianbundy/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('f97314e5d07915f724be96f64cf2d75a')

package() {
	install -d "${pkgdir}/usr/bin"
	cd "$pkgname-v$pkgver"
	install -Dm755 scripts/{audio/{input,output,meta},brightness,touch}/* "${pkgdir}/usr/bin/"
}

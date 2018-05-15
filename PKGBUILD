# Maintainer: Christian Bundy <christianbundy@fraction.io>
# Contributor: Raphael Simon <simon.raphael@gmail.com>

pkgname=samus-scripts
pkgver=2.0.0
pkgrel=3
pkgdesc="A collection of scripts for the Chromebook Pixel (2015), codename Samus."
arch=('any')
url="https://gitlab.com/christianbundy/samus-scripts"
license=('GPL2')
depends=('bash')
optdepends=('mxt-app')
source=("https://gitlab.com/christianbundy/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('3464d61a605d52230a72460f8f682374')

package() {
	install -d "${pkgdir}/usr/bin"
	cd "$pkgname-v$pkgver"
	install -Dm755 scripts/**/*.sh "${pkgdir}/usr/bin/"
}

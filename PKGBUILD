# Maintainer: a_weeb_programmer <theawesomegamerortega at gmail dot com>
pkgname="mod-builder"
pkgver="1.1.1"
pkgdesc="A cli tool that automatically sets up a minecraft modding environment"
license=('GPL3')
depends=('unzip' 'grep' 'sed' 'wget')
url="https://github.com/a-weeb-programmer/mod-builder"
pkgrel=1
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/a-weeb-programmer/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('54cb6d993cf4d24caa70102f1c888a93f145ae6ef366557fb539335a28be2bf5')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./mod-builder "$pkgdir/usr/bin/mod-builder"
	cp -r ./buildgradle_templates ~/

}

# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=apigility
pkgver=1.3.1
pkgrel=1
pkgdesc="The world's easiest way to create high-quality APIs."
arch=('any')
url="http://www.apigility.org/"
license=('BSD')
depends=('php>=5.4.8')
options=(!strip)
optdepends=()
conflicts=()
source=("https://github.com/zfcampus/zf-apigility-skeleton/releases/download/$pkgver/zf-apigility-skeleton-${pkgver}.tgz")
sha256sums=('e04ba711dd1fc4373f39e3f9c4291bee95e589df8fe8628f248b1aa9e8eaafcb')

build() {
    true
}

package() {
	cd "$srcdir/zf-apigility-skeleton-${pkgver}"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -d "$pkgdir/usr/share/webapps/$pkgname"
	cp -R . "$pkgdir/usr/share/webapps/$pkgname"
}


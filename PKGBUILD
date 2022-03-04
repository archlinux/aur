# Maintainer: a_weeb_programmer <theawesomegamerortega at gmail dot com>
pkgname="mod-builder"
pkgver="1.0"
pkgdesc="A cli tool that automatically sets up a minecraft modding environment"
license=('GPL3')
depends=('unzip' 'grep' 'sed' 'wget')
url="https://github.com/a-weeb-programmer/mod-builder"
pkgrel=1
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/a-weeb-programmer/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2c51bfe5e1dddb73c49bd345cba4bd6eecdb3bb7f3db60cfab8ccd8449ee7b6')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./mod-builder "$pkgdir/usr/bin/mod-builder"
}

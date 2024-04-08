# Maintainer: Neurognostic <neurognostic@astranetics.com>
# Contributor: BadBoy <luckmelove2@gmail.com>

pkgname=('rainfall')
pkgver=1.0.1
pkgrel=2
pkgdesc='A rain animation for your terminal.'
url='https://github.com/alpin111/rainfall'
arch=('any')
license=('MIT')
depends=('python3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0600af91545a24a347c1c3924db6a9ee762c6d5365f84d8cd5443d55ad68133')

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/source/rainfall.py" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/license" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

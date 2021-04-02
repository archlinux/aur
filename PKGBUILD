# Maintainer: Marcel Walk (Nyasaki) <mwalk at nyasaki dot cloud>
pkgname=paclog
pkgver=2.0
pkgrel=3
pkgdesc="A pacman log analyzer"
arch=('any')
url="https://github.com/xfgusta/paclog"
license=('MIT')
depends=(python)
conflicts=('pacolog' 'pacutils')
source=("https://github.com/xfgusta/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('SKIP')

package() {
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 0755 "${srcdir}/${pkgname}-${pkgver}/paclog" "${pkgdir}/usr/bin/paclog"
}
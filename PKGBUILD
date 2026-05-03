# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

_npmname=intelephense
pkgname=nodejs-$_npmname
pkgver=1.18.2
pkgrel=1
pkgdesc="Intelephense is a PHP language server adhering to the Language Server Protocol."
arch=('any')
url="https://github.com/bmewburn/vscode-intelephense"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('f617b83f01d8fe88522954e50f5d4c3a572b07795d029e845a2218251323d9bd')
noextract=($_npmname-$pkgver.tgz)

package() {
  npm install --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_npmname}-${pkgver}.tgz"
}

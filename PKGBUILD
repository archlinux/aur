# Maintainer: Shae VanCleave <shae.m.vc@proton.me>

pkgname='caustic-grammar'
pkgdesc="Caustic's canonical grammar (Python package)"
url='https://codeberg.org/Caustic/CausticGrammar'
license=('Apache-2.0')

groups=('caustic')

pkgver=2.0.1
pkgrel=1

arch=('any')
depends=('python' 'caustic-cst' 'caustic-parser')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname//-/.}/${pkgname//-/.}-$pkgver-py3-none-any.whl")
noextract=("${pkgname//-/.}-$pkgver-py3-none-any.whl")
sha256sums=('de9e06dc685043af3f112e19639fc674337bf8cd0676649b0c1904c162eb6edc')


package() {
    python -m installer --destdir="$pkgdir" "${pkgname//-/.}-$pkgver-py3-none-any.whl"
}

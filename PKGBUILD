# Maintainer: Shae VanCleave <shae.m.vc@proton.me>

pkgname='caustic-grammar'
pkgdesc="Caustic's canonical grammar (Python package)"
url='https://codeberg.org/Caustic/CausticGrammar'
license=('Apache-2.0')

groups=('caustic')

pkgver=2.0.2
pkgrel=1

arch=('any')
depends=('python' 'python-parglare' 'caustic-cst' 'caustic-parser')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname//-/.}/${pkgname//-/.}-$pkgver-py3-none-any.whl")
noextract=("${pkgname//-/.}-$pkgver-py3-none-any.whl")
sha256sums=('d6e5c650357250f6cc95cdc64ee22b5b0d0483d3598d537dab62ac2e3714af35')


package() {
    python -m installer --destdir="$pkgdir" "${pkgname//-/.}-$pkgver-py3-none-any.whl"
}

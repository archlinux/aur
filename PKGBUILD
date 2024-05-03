# Maintainer: Shae VanCleave <shae.m.vc@proton.me>

pkgname='caustic-grammar'
pkgdesc="Caustic's canonical grammar (Python package)"
url='https://codeberg.org/Caustic/CausticGrammar'
license=('Apache-2.0')

groups=('caustic')

pkgver=2.2.0
pkgrel=1

arch=('any')
depends=('python' 'python-parglare' 'caustic-cst' 'caustic-parser')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname//-/.}/${pkgname//-/.}-$pkgver-py3-none-any.whl")
noextract=("${pkgname//-/.}-$pkgver-py3-none-any.whl")
sha256sums=('31d49574af25396d67416e1bbff7073fb463ca526e6385f31fd928580d783bf7')


package() {
    python -m installer --destdir="$pkgdir" "${pkgname//-/.}-$pkgver-py3-none-any.whl"
}

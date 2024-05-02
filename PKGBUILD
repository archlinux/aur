# Maintainer: Shae VanCleave <shae.m.vc@proton.me>

pkgname='caustic-cst'
pkgdesc="Caustic's Abstract Syntax Tree (Python package)"
url='https://codeberg.org/Caustic/CausticAST'
license=('Apache-2.0')

groups=('caustic')

pkgver=2.1.1
pkgrel=1

arch=('any')
depends=('python')
makedepends=('python-installer')
optdepends=('python-parglare: generate SourceInfos from parglare contexts')

source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname//-/.}/${pkgname//-/.}-$pkgver-py3-none-any.whl")
noextract=("${pkgname//-/.}-$pkgver-py3-none-any.whl")
sha256sums=('e3a465eb2f107aa131d68837688a6a0284c4aaaa90331e172b0df1b51619e8c3')


package() {
    python -m installer --destdir="$pkgdir" "${pkgname//-/.}-$pkgver-py3-none-any.whl"
}

# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

_pkgbase=pandoc-plantuml-filter
pkgname=${_pkgbase}-py
pkgver=0.1.2
pkgrel=2
pkgdesc='Pandoc filter for PlantUML code blocks, python version'
arch=('any')
url='https://pypi.org/project/pandoc-plantuml-filter'
license=('MIT')
depends=('python' 'python-pandocfilters')
makedepends=('python-setuptools')
conflicts=('pandoc-plantuml-filter')
replaces=('pandoc-plantuml-filter')
source=("https://files.pythonhosted.org/packages/2b/a6/d63364f4f89314efc29b541d9422532bd6825f0fa64f6e471ecce8500516/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=(
  '2a26b6375f2ee6d34ee2498fecf1d6c8ace5cf6f8bbe5745d186ebce5d1dc720'
  )

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

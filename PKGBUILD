# Maintainer: Bernardas Ališauskas bernardas.ališauskas@protonmail.com
pkgname=parselcli
pkgver=0.26.1
pkgrel=2
pkgdesc="CLI interpreter for xpath and css selectors"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/parsel-cli"
depends=('python' 'python-click' 'python-requests-cache' 'python-prompt_toolkit>=2')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/parsel-cli/archive/${pkgver}.tar.gz")
md5sums=('b01df2cf2e7c69ff5d86ec7d9947a614')
package() {
  cd "${srcdir}/parsel-cli-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python-pyupcean
pkgver=2.7.11
pkgrel=3
pkgdesc="PyUPC-EAN is a barcode library/module for python3."
arch=('any')
url="https://github.com/GameMaker2k/PyUPC-EAN/"
license=('BSD')
replaces=('python-upcean')
depends=('python' 'python-pillow')
options=(!strip !emptydirs)
_gitrevision='325a9a29e6030e6c15964a62c21cca21f2aed3e8'
source=("https://github.com/GameMaker2k/PyUPC-EAN/archive/${_gitrevision}.tar.gz")
md5sums=('aa90949f003146483e7438194bc6048f')
sha256sums=('2ecccd82220cd307f938f21634cc6f47e6f9bd8c8c6098be8f150e2d8cb912d2')
sha384sums=('5199fbd96911e13cf186fd90c782173339b39b9ef0bd72c80949a1919f88d8b7bdc25186545fb39761015d4cf22678f0')
sha512sums=('aee641664776a6dbcd13d8c21cb65e0cd5a9d969bce309299c2a5f59fce42b327867fc4303a4ca09e02d5b60d8141acf490fa14bc594477eed8939690f792aff')

package() {
  cd "${srcdir}/PyUPC-EAN-${_gitrevision}"
  /usr/bin/python ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

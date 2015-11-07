# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname='python-pyvidia'
_pipname=pyvidia
pkgver=1.0.1
pkgrel=3
pkgdesc='NVIDIA driver version detector for Linux'
url='https://github.com/ntpeters/pyvidia'
arch=('any')
license=('MIT')
provides=("${_pipname}=${pkgver}")
depends=('python' 'python-lxml' 'python-beautifulsoup4')
source=("https://pypi.python.org/packages/source/p/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b2b2f04c6f2b873e7c290a45db0b3e85e9ae3daac9b643d48966b23439c4fdea')

package() {
  cd "${srcdir}/${_pipname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  # install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:

# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-pyppeteer
_pyname=pyppeteer
pkgname=('python-pyppeteer')
depends=('python' 'python-pyee' 'python-websockets')
makedepends=('python-setuptools')
pkgver=0.0.16
pkgrel=1
pkgdesc="Headless chrome/chromium automation library"
arch=('any')
url="https://github.com/miyakogi/pyppeteer"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/miyakogi/${_pyname}/archive/${pkgver}.tar.gz")
sha512sums=('5c195a79be0fb9062b43648fe4509b6184bc177686f5ecd1d3768dfafde2b43d6ddd855203e06272c3392765b8f066e316e5630f150a858434645901fcf4ee86')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:

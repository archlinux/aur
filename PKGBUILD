# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=tftpy
pkgname=('python2-tftpy')
pkgver=0.6.2
pkgrel=1
pkgdesc='Pure Python TFTP library'
url='https://github.com/msoulier/tftpy'
arch=('any')
license=('MIT')
makedepends=('python2-setuptools')
source=(https://pypi.org/packages/source/t/tftpy/tftpy-${pkgver}.tar.gz)
sha512sums=('f4b3b14f3db62006775126d42e7582f20f6e9aa2b1d50fd554dc7567e1b21a437ecf17d6cda4700a7b2c663524016917ba179db27a993c3c7770fcc33e9401b0')

package_python2-tftpy() {
  depends=('python2')
  cd ${pkgbase}-${pkgver}
  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README ChangeLog  -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

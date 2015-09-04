# Maintainer: crito <crito@cryptodrunks.net>
pkgname=python2-dirspec
pkgver=13.10
pkgrel=1
pkgdesc="Handling of directories as described in the XDG Directory specifications."
arch=('any')
url="https://launchpad.net/dirspec"
license=('LGPL3')
depends=('python2>=2.7')
source=("https://launchpad.net/dirspec/stable-13-10/13.10/+download/dirspec-${pkgver}.tar.gz")
md5sums=('941d59e0f10ade1b992a90899f248358')

package() {
  cd "${srcdir}/dirspec-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 COPYING.LESSER "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=vboxwrapper
pkgver=0.9.1
pkgrel=1
pkgdesc='VirtualBox wrapper for python 2.7. GNS3 tool.'
arch=('any')
url='https://github.com/GNS3/vboxwrapper'
license=('GPL2')
groups=('gns3')
makedepends=('python2-setuptools')
depends=('virtualbox' 'virtualbox-sdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('f105827adb099e7408c2ede2af66c862')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

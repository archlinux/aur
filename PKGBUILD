# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-moped
pkgver=0.6.1
pkgrel=1
pkgdesc="Responsive Web client for Mopidy"
arch=('any')
url="https://github.com/martijnboland/moped"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/martijnboland/moped/archive/v${pkgver}.tar.gz")
md5sums=('5636a495f3835b88cd9dbe85b78b4f00')

package() {
  cd "${srcdir}/moped-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

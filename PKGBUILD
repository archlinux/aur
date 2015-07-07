# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-moped
pkgver=0.4.2
pkgrel=1
pkgdesc="Responsive Web client for Mopidy"
arch=('any')
url="https://github.com/martijnboland/moped"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/martijnboland/moped/archive/v${pkgver}.tar.gz")
md5sums=('0cff39fc0de4150887745e2a9dad0209')

package() {
  cd "${srcdir}/moped-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

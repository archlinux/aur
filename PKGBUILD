# Maintainer: ot com>

pkgname=mopidy-local-images
pkgver=0.3.3
pkgrel=1
pkgdesc="Responsive Web client for Mopidy"
arch=('any')
url="https://github.com/martijnboland/moped"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/tkem/mopidy-local-images/archive/v${pkgver}.tar.gz")

package() {
    cd "${srcdir}/mopidy-local-images-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
      
md5sums=('1bc4b305b61465003ccdfec2e9d10463')

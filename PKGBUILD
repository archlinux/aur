# Maintainer: Emanuel Evans <mail@emanuel.industries>

pkgname=mopidy-pandora
pkgver=0.1.8
pkgrel=1
pkgdesc="Mopidy extension for playing music from Pandora"

arch=('any')
url="https://github.com/rectalogic/mopidy-pandora"
license=('APACHE')
depends=('mopidy>=1.0.7' 'python2-pykka>=1.1' 'python2-pydora>=1.5.1' 'python2-requests>=2.5.0')
makedepends=('python2' 'python2-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/rectalogic/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('21c87a65fdf2fa22a9b0e68f7fe2486d')

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

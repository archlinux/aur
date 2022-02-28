# Maintainer: sseneca <me@ssene.ca>
pkgname=mopidy-jellyfin
pkgver=1.0.3
pkgrel=1
pkgdesc="Mopidy extension for playing music from jellyfin"
arch=('any')
url="https://github.com/jellyfin/mopidy-jellyfin"
license=('Apache')
depends=('python'
  'python-setuptools'
  'mopidy>=3.0'
  'python-pykka'
  'python-requests'
  'python-unidecode'
  'python-websocket-client')
replaces=('python-mopidy-jellyfin')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('890753089413da2d02464d6c9585b6b3004292569dff8898ecfe66ae023ea413afafd77d47756e620d9f87a03a04bfe2c051a2f26d2911c8e96d27d98c34d75b')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

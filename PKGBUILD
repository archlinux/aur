# Maintainer: sseneca <me@ssene.ca>
pkgname=mopidy-jellyfin
pkgver=1.0.4
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
sha512sums=('e78d61ab1c4029fcc472a55c30eb4f75d18427d5ca5759ea03bb1dcb6bf9626570c5e2a84f7727ec59be07dd5ce78c63228c08524e703042950f087ae3878823')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

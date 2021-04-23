# Maintainer: sseneca <me@ssene.ca>
pkgname=mopidy-jellyfin
pkgver=1.0.2
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
sha512sums=('6ad48eb887156c02d610e7d3b0ef57b85f050fb69027a1ede6ab08ac5a84aa678dde6ab4fe8d210ca56a1f4c9f7eca91eebe6a1142539c2fd1bb5e2983061031')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

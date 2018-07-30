# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dylan Araps <dylan.araps@gmail.com>

pkgname=nama
pkgver=v1.1
pkgrel=1
pkgdesc="This tool uses nmcli to easily set static ip addresses"
arch=('any')
url="https://github.com/chn555/nama"
license=('GPLv3')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chn555/nama/archive/${pkgver}.tar.gz")
sha256sums=('910ef13759902bfebfe3b0c4451fe3c7f2453918d95d28e14cd3096cb1ba5aa2')
source=("$pkgname::git+https://github.com/dylanaraps/neofetch.git")

package() {
  cd "${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dylan Araps <dylan.araps@gmail.com>

pkgname=nama
pkgver=2.0.0
pkgrel=1
pkgdesc="This tool uses nmcli to easily set static ip addresses"
arch=('any')
url="https://github.com/chn555/nama"
license=('GPLv3')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chn555/nama/archive/${pkgver}.tar.gz")
source=("$pkgname::git+https://github.com/chn555/nama.git")
md5sums=('SKIP')

package() {
  cd "${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

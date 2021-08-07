# Maintainer: Benjamin 'PenguinJoints' Wang <w.benji at tuta dot io>
# Contributor: Frederic Bezies <frdbezies at gmail dot com>
# Contributor: Takashi Kokubun <takashikkbn@domain.com>

pkgname=nocturn
pkgver=1.8.4
pkgrel=2
pkgdesc='Desktop twitter client'
arch=('x86_64')
url='https://github.com/k0kubun/Nocturn'
license=('MIT')
makedepends=('gconf')
depends=('gconf')
source=("Nocturn-$pkgver.zip::https://github.com/k0kubun/Nocturn/releases/download/v$pkgver/Nocturn-linux-x64.zip")
sha256sums=('2ef1f5b43b5f282ee0c32734b20612f6437af43f4608df42c04a0baf2b644e0f')

package() {
  install -Dm644 Nocturn-linux-x64/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv Nocturn-linux-x64 "$pkgdir/usr/share/nocturn"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/share/nocturn/Nocturn "$pkgdir/usr/bin/nocturn"
}

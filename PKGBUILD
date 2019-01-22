# Maintainer: Frederic Bezies <frdbezies at gmail dot com>
# Contributor: Takashi Kokubun <takashikkbn@domain.com>
pkgname=nocturn
pkgver=1.6.6
pkgrel=1
pkgdesc='Desktop twitter client'
arch=('x86_64')
url='https://github.com/k0kubun/Nocturn'
license=('MIT')
depends=()
source=("Nocturn-$pkgver.zip::https://github.com/k0kubun/Nocturn/releases/download/v$pkgver/Nocturn-linux-x64.zip")
sha256sums=('4b3d516db1f25ee562e29019e79d581a52422482b3b49887548d30108b25788e')

package() {
  install -Dm644 Nocturn-linux-x64/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv Nocturn-linux-x64 "$pkgdir/usr/share/nocturn"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/share/nocturn/Nocturn "$pkgdir/usr/bin/nocturn"
}

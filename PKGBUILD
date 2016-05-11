# Maintainer: Takashi Kokubun <takashikkbn@domain.com>
pkgname=nocturn
pkgver=1.2.1
pkgrel=1
pkgdesc='Desktop twitter client'
arch=('x86_64')
url='https://github.com/k0kubun/Nocturn'
license=('MIT')
depends=()
source=("Nocturn-$pkgver.zip::https://github.com/k0kubun/Nocturn/releases/download/v$pkgver/Nocturn-linux-x64.zip")
sha1sums=('d49a3a8fb01cf4674970fabd1ace1d78226d3a9e')

package() {
  install -Dm644 Nocturn-linux-x64/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv Nocturn-linux-x64 "$pkgdir/usr/share/nocturn"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/share/nocturn/Nocturn "$pkgdir/usr/bin/nocturn"
}

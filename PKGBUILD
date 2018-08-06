# Maintainer: pbar <piercebartine@gmail.com>

pkgname=mfaws-bin
pkgdesc="AWS Multi-Factor Authentication manager"
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="https://github.com/pbar1/mfaws"
license=('MIT')
source_x86_64=(mfaws::https://github.com/pbar1/mfaws/releases/download/v$pkgver/mfaws_v${pkgver}_linux_amd64)
sha256sums_x86_64=('09fdeb8cd60bdee7678437272d461c885c67c82b7f531ddc85b35b4acebdddc5')

package() {
  install -Dm 755 "$srcdir/mfaws" "$pkgdir/usr/bin/mfaws"
}

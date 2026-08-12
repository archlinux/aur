# Maintainer: pacmanics

pkgname=psx2eboot
pkgver=1.0.0
pkgrel=2
pkgdesc="GUI batch converter for PlayStation BIN/CUE images to PSP EBOOT.PBP files"
arch=('any')
url="https://github.com/pacmanics/psx2eboot"
license=('GPL-3.0-only')
depends=('python' 'tk' 'podman' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pacmanics/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24cf82ebeaea17e9dca7f6efad3e763d1370a4056a8c4f3f0d461e5df31a09c8')

package() {
  local src="$srcdir/$pkgname-$pkgver"

  install -Dm755 "$src/psx2eboot.py" "$pkgdir/usr/bin/psx2eboot"
  install -Dm644 "$src/psx2eboot.desktop" "$pkgdir/usr/share/applications/psx2eboot.desktop"
  install -Dm644 "$src/psx2eboot.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/psx2eboot.svg"
  install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

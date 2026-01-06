pkgname="systemd-boot-to-windows"
pkgver="1.0.0"
pkgrel=2
pkgdesc="Creates a .desktop application to boot into Windows using sytemd-boot's automatic entry"
arch=(any)
license=('Unlicense' 'CCPL:by')
source=('systemd-boot-to-windows.sh' 
  'systemd-boot-to-windows.desktop'
  'systemd-boot-to-windows.svg::https://upload.wikimedia.org/wikipedia/commons/0/0a/Unofficial_Windows_logo_variant_-_2002%E2%80%932012_%28Multicolored%29.svg')

sha256sums=('SKIP'  
  'SKIP'
  '945ccf7088614541e0b730d71581f29a583cf9282f8c684d8e7c69793f588058')

package() {
  install -Dm755 "$srcdir/systemd-boot-to-windows.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/systemd-boot-to-windows.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "$srcdir/systemd-boot-to-windows.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

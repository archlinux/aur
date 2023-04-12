pkgname="systemd-boot-to-windows"
pkgver="1.0.0"
pkgrel=2
pkgdesc="Creates a .desktop application to boot into Windows using sytemd-boot's automatic entry"
arch=(any)
license=('Unlicense' 'CCPL:by')
source=('systemd-boot-to-windows.sh' 
  'systemd-boot-to-windows.desktop'
  'systemd-boot-to-windows.svg::https://www.iconfinder.com/icons/317717/download/svg/4096')

sha256sums=('SKIP'  
  'SKIP'
  '7d309f9b56eb574364309297c97df966af67b64293743e856f445c309f1b005b')

package() {
  install -Dm755 "$srcdir/systemd-boot-to-windows.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/systemd-boot-to-windows.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "$srcdir/systemd-boot-to-windows.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
# Maintainer: Sterophonick
pkgname=atapi-customizations
_pkgname='atapi-customizations'
pkgbase=atapi-mimetypes
pkgver=1
pkgrel=5
pkgdesc='Various Arch Linux customizations that I do :3'
arch=(any)
makedepends=()
source=(x-atapi-mimetypes.xml 51-dolphinbar.rules 51-gamecube-adapter.rules killsteam steam-monitor unfuck_bt)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm644 "$srcdir/x-atapi-mimetypes.xml" "$pkgdir/usr/share/mime/packages/x-atapi-mimetypes.xml"
  install -Dm644 "$srcdir/51-dolphinbar.rules" "$pkgdir/etc/udev/rules.d/51-dolphinbar.rules"
  install -Dm644 "$srcdir/51-gamecube-adapter.rules" "$pkgdir/etc/udev/rules.d/51-gamecube-adapter.rules"
  install -Dm755 "$srcdir/steam-monitor" "$pkgdir/usr/bin/steam-monitor"
  install -Dm755 "$srcdir/unfuck_bt" "$pkgdir/usr/bin/unfuck_bt"
  install -Dm755 "$srcdir/killsteam" "$pkgdir/usr/bin/killsteam"
}

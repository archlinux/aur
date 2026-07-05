# Maintainer: Sterophonick
pkgname=atapi-customizations
_pkgname='atapi-customizations'
pkgbase=atapi-mimetypes
pkgver=1
pkgrel=15
pkgdesc='Various Arch Linux customizations that I do :3'
arch=(any)
makedepends=()
source=(x-atapi-mimetypes.xml 51-dolphinbar.rules 51-gamecube-adapter.rules killsteam steam-monitor unfuck_bt unfuck_wpe mod-preload.conf 10-atapi-envs.conf edit-in-imhex.desktop edit-in-kate.desktop gbafix.desktop imagemagick.desktop conv2png.sh conv2jpg.sh rotate.sh flip.sh)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm644 "$srcdir/x-atapi-mimetypes.xml" "$pkgdir/usr/share/mime/packages/x-atapi-mimetypes.xml"
  install -Dm644 "$srcdir/51-dolphinbar.rules" "$pkgdir/etc/udev/rules.d/51-dolphinbar.rules"
  install -Dm644 "$srcdir/51-gamecube-adapter.rules" "$pkgdir/etc/udev/rules.d/51-gamecube-adapter.rules"
  install -Dm755 "$srcdir/steam-monitor" "$pkgdir/usr/bin/steam-monitor"
  install -Dm755 "$srcdir/unfuck_bt" "$pkgdir/usr/bin/unfuck_bt"
  install -Dm755 "$srcdir/unfuck_wpe" "$pkgdir/usr/bin/unfuck_wpe"
  install -Dm755 "$srcdir/killsteam" "$pkgdir/usr/bin/killsteam"
  install -Dm644 "$srcdir/mod-preload.conf" "$pkgdir/etc/modules-load.d/mod-preload.conf"
  install -Dm644 "$srcdir/10-atapi-envs.conf" "$pkgdir/etc/environment.d/10-atapi-envs.conf"
  
  install -Dm755 "$srcdir/edit-in-imhex.desktop" "$pkgdir/usr/share/kio/servicemenus/edit-in-imhex.desktop"
  install -Dm755 "$srcdir/edit-in-kate.desktop" "$pkgdir/usr/share/kio/servicemenus/edit-in-kate.desktop"
  install -Dm755 "$srcdir/gbafix.desktop" "$pkgdir/usr/share/kio/servicemenus/gbafix.desktop"
  install -Dm755 "$srcdir/imagemagick.desktop" "$pkgdir/usr/share/kio/servicemenus/imagemagick.desktop"
  
  install -Dm755 "$srcdir/conv2png.sh" "$pkgdir/usr/share/atapi-customizations/conv2png.sh"
  install -Dm755 "$srcdir/conv2jpg.sh" "$pkgdir/usr/share/atapi-customizations/conv2jpg.sh"
  install -Dm755 "$srcdir/rotate.sh" "$pkgdir/usr/share/atapi-customizations/rotate.sh"
  install -Dm755 "$srcdir/flip.sh" "$pkgdir/usr/share/atapi-customizations/flip.sh"
}

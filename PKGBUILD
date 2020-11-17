# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=amigaos-xfwm4-themes
pkgver=1
pkgrel=1
pkgdesc="Amiga OS Themes for XFCE (XFWM4)"
url="https://github.com/lordwolfchild/amigaos_xfwm4_themes"
arch=(any)
license=(Unlicense)

source=("https://github.com/lordwolfchild/amigaos_xfwm4_themes/archive/main.zip")
sha256sums=("264744554c8329fd911864acb85b5d6c024e8d569466b9783d64b6536ffb9148")

package() {
  install -d $pkgdir/usr/share/themes
  cp -r $srcdir/amigaos_xfwm4_themes-main/Amiga1.3 -t $pkgdir/usr/share/themes/
  cp -r $srcdir/amigaos_xfwm4_themes-main/Amiga1.3_hidpi -t $pkgdir/usr/share/themes/
  cp -r $srcdir/amigaos_xfwm4_themes-main/Amiga3.x -t $pkgdir/usr/share/themes/
  cp -r $srcdir/amigaos_xfwm4_themes-main/Amiga3.x_hidpi -t $pkgdir/usr/share/themes/
}

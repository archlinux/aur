# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>

pkgname=catppuccin-grub-theme-git
_pkgname=catppuccin-grub-theme
_theme=catppuccin
pkgver=r17.3907bdd
pkgrel=1
pkgdesc="Catppuccin GRUB theme."
arch=("any")
url="https://github.com/catppuccin/grub"
license=("MIT")
source=("https://github.com/catppuccin/grub/archive/3907bddf16a366e56078fe3becb8402cff4cd15d.zip")
sha256sums=("997826e92d86a3285c6336961260f5e18de7f075e3ac395adea9932f545a9c87")
install=$_pkgname.install

package() {
  cd $srcdir/grub-*

  install -dm755 "$pkgdir/usr/share/grub/themes/$_theme"
  cp -r --no-preserve=ownership $_pkgname/* "$pkgdir/usr/share/grub/themes/$_theme"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>

pkgname=catppuccin-grub-theme-git
_pkgname=catppuccin-grub-theme
_theme=catppuccin
pkgver=r14.9e5ade4
pkgrel=1
pkgdesc="Catppuccin GRUB2 theme."
arch=("any")
url="https://github.com/catppuccin/grub"
license=("MIT")
source=("https://github.com/catppuccin/grub/archive/9e5ade440a5506691f5afaa4b24aaba4e6c9d434.zip")
sha256sums=("84f4d19e111b192efa733975d9f22bd70d1a99b62c60d8073d8ab5228cc0b4d8")
install=$_pkgname.install

package() {
  cd $srcdir/grub-*

  install -dm755 "$pkgdir/usr/share/grub/themes/$_theme"
  cp -r --no-preserve=ownership $_pkgname/* "$pkgdir/usr/share/grub/themes/$_theme"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
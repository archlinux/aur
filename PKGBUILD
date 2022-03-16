# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>

pkgname=catppuccin-grub-theme-git
_pkgname=catppuccin-grub-theme
_theme=catppuccin
pkgver=r24.3f62cd4
pkgrel=2
pkgdesc="Catppuccin GRUB theme."
arch=("any")
url="https://github.com/catppuccin/grub"
license=("MIT")
source=("https://github.com/catppuccin/grub/archive/3f62cd4174465631b40269a7c5631e5ee86dec45.zip")
sha256sums=("6f73b676cdc4bf11dbe38fa31f3981db4f5b8afd68f5fbf05154c8e27f4d7848")
install=$_pkgname.install

package() {
  cd $srcdir/grub-*

  install -dm755 "$pkgdir/usr/share/grub/themes/$_theme"
  cp -r --no-preserve=ownership $_pkgname/* "$pkgdir/usr/share/grub/themes/$_theme"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

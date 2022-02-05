# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>

pkgname=catppuccin-grub-theme-git
_pkgname=catppuccin-grub-theme
_theme=catppuccin
pkgver=r18.82e7552
pkgrel=1
pkgdesc="Catppuccin GRUB theme."
arch=("any")
url="https://github.com/catppuccin/grub"
license=("MIT")
source=("https://github.com/catppuccin/grub/archive/82e7552bd71451152db4e57fd9937e77a6fab25a.zip")
sha256sums=("588b85e95b187666e1653322e869d4b626bb2df700f12f525e0d9cf80c8402ba")
install=$_pkgname.install

package() {
  cd $srcdir/grub-*

  install -dm755 "$pkgdir/usr/share/grub/themes/$_theme"
  cp -r --no-preserve=ownership $_pkgname/* "$pkgdir/usr/share/grub/themes/$_theme"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
# Maintainer: Tuhana GAYRETLİ <tuhana at cok dot gay>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154,SC2128

pkgname=(
  catppuccin-frappe-grub-theme-git
  catppuccin-latte-grub-theme-git
  catppuccin-macchiato-grub-theme-git
  catppuccin-mocha-grub-theme-git
)
pkgbase=catppuccin-grub-theme-git
pkgver=r25.4f6ac65
pkgrel=1
pkgdesc='Soothing pastel theme for GRUB2'
arch=(any)
url='https://github.com/catppuccin/grub'
license=(MIT)
makedepends=(git)
source=("git+$url.git")
sha256sums=(SKIP)

package_catppuccin-frappe-grub-theme-git() {
  pkgdesc+=' - frappe color scheme'
  install=$pkgname.install

  cd "$srcdir/grub"

  install -d "$pkgdir/usr/share/grub/themes"
  cp -r "src/${pkgname%-git}" "$pkgdir/usr/share/grub/themes/${pkgname%-grub-theme-git}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_catppuccin-latte-grub-theme-git() {
  pkgdesc+=' - latte color scheme'
  install=$pkgname.install

  cd "$srcdir/grub"

  install -d "$pkgdir/usr/share/grub/themes"
  cp -r "src/${pkgname%-git}" "$pkgdir/usr/share/grub/themes/${pkgname%-grub-theme-git}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_catppuccin-macchiato-grub-theme-git() {
  pkgdesc+=' - macchiato color scheme'
  install=$pkgname.install

  cd "$srcdir/grub"

  install -d "$pkgdir/usr/share/grub/themes"
  cp -r "src/${pkgname%-git}" "$pkgdir/usr/share/grub/themes/${pkgname%-grub-theme-git}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_catppuccin-mocha-grub-theme-git() {
  pkgdesc+=' - mocha color scheme'
  install=$pkgname.install

  cd "$srcdir/grub"

  install -d "$pkgdir/usr/share/grub/themes"
  cp -r "src/${pkgname%-git}" "$pkgdir/usr/share/grub/themes/${pkgname%-grub-theme-git}"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

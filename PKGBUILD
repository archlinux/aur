# Maintainer: Catppuccin <releases@catppuccin.com>


pkgbase=plymouth-theme-catppuccin-git
pkgname=(
  plymouth-theme-catppuccin-latte-git
  plymouth-theme-catppuccin-frappe-git
  plymouth-theme-catppuccin-macchiato-git
  plymouth-theme-catppuccin-mocha-git
)
pkgver=r12.e13c348
pkgrel=1
pkgdesc="Soothing pastel theme for Plymouth"
arch=('any')
url="https://github.com/catppuccin/plymouth"
license=('MIT')
depends=('plymouth')
makedepends=('git')
source=("$pkgbase::git+https://github.com/catppuccin/plymouth.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package_plymouth-theme-catppuccin-latte-git() {
  pkgdesc="Soothing pastel theme for Plymouth - Latte" 
	
  cd "$srcdir/$pkgbase/themes/catppuccin-latte"
  mkdir -p $pkgdir/usr/share/plymouth/themes/catppuccin-latte
  install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/catppuccin-latte
}

package_plymouth-theme-catppuccin-frappe-git() {
  pkgdesc="Soothing pastel theme for Plymouth - Frappe" 
	
  cd "$srcdir/$pkgbase/themes/catppuccin-frappe"
  mkdir -p $pkgdir/usr/share/plymouth/themes/catppuccin-frappe
  install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/catppuccin-frappe
}

package_plymouth-theme-catppuccin-macchiato-git() {
  pkgdesc="Soothing pastel theme for Plymouth - Macchiato" 
	
  cd "$srcdir/$pkgbase/themes/catppuccin-macchiato"
  mkdir -p $pkgdir/usr/share/plymouth/themes/catppuccin-macchiato
  install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/catppuccin-macchiato
}

package_plymouth-theme-catppuccin-mocha-git() {
  pkgdesc="Soothing pastel theme for Plymouth - Mocha" 
	
  cd "$srcdir/$pkgbase/themes/catppuccin-mocha"
  mkdir -p $pkgdir/usr/share/plymouth/themes/catppuccin-mocha
  install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/catppuccin-mocha
}

# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-sddm-theme-frappe
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/sddm
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM - Frappe'
arch=('any')
license=('MIT')
depends=('sddm' 'qt6-svg' 'qt6-declarative')
url='https://github.com/catppuccin/sddm'
source=(
	"$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/catppuccin-frappe.zip"
)
sha256sums=('6b7eb5e549e9a2bb28f7c6f8f42997bd55aaac172158aa2dcd780c2bfa262774')

package() {
	install -d "$pkgdir/usr/share/sddm/themes/"
	cp -r -a --no-preserve=ownership \
		catppuccin-frappe "$pkgdir/usr/share/sddm/themes"
}

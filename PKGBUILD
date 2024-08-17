# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-sddm-theme-latte
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/sddm
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM - Latte'
arch=('any')
license=('MIT')
depends=('sddm' 'qt6-svg' 'qt6-declarative')
url='https://github.com/catppuccin/sddm'
source=(
	"$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/catppuccin-latte.zip"
)
sha256sums=('19cc14098c9cc709334b6f65598520834f373bd24702301411c6ac1a6ecc4c32')

package() {
	install -d "$pkgdir/usr/share/sddm/themes/"
	cp -r -a --no-preserve=ownership \
		catppuccin-latte "$pkgdir/usr/share/sddm/themes"
}

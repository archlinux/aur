# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-sddm-theme-mocha
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/sddm
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM - Mocha'
arch=('any')
license=('MIT')
depends=('sddm' 'qt6-svg' 'qt6-declarative')
url='https://github.com/catppuccin/sddm'
source=(
	"$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/catppuccin-mocha.zip"
)
sha256sums=('1fb17a79685d97ea616e81c0b9f4fd01c70bdd08f4f5c11d33db7eb0b1d32999')

package() {
	install -d "$pkgdir/usr/share/sddm/themes/"
	cp -r -a --no-preserve=ownership \
		catppuccin-mocha "$pkgdir/usr/share/sddm/themes"
}

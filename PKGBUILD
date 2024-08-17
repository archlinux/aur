# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-sddm-theme-macchiato
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/sddm
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM - Macchiato'
arch=('any')
license=('MIT')
depends=('sddm' 'qt6-svg' 'qt6-declarative')
url='https://github.com/catppuccin/sddm'
source=(
	"$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/catppuccin-macchiato.zip"
)
sha256sums=('4a43034dfe13195632fea8243d3f732c2a5806b7857ae131ba2ba0da7a7204fa')

package() {
	install -d "$pkgdir/usr/share/sddm/themes/"
	cp -r -a --no-preserve=ownership \
		catppuccin-macchiato "$pkgdir/usr/share/sddm/themes"
}

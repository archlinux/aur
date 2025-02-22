# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-macchiato
pkgver=2.0.0 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Macchiato'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-cursors.zip"
)

sha256sums=('4c66fba0272661f03dee2e5ffefd1829e1a94625781237804bc791ca5a781c42'
            '206ea3995f859baef5f4f7bd2669ecd16a60d70d9d4241b7eea7a89b0dde7572'
            'a51490a997e95572c7e00ba128435296e0285e013cdf6db7a600488fff2df7e3'
            'c79852bcbd8a82402ef2d8fdffd54ef959eeb6d3e0675512985bf0f22a6832bc'
            '6f5a5f71ab0ca9ed088dca1167b7fd8b4921c16234fc073d15fce1c54965eeae'
            'a1d55b07dddfca4678cb300b5b75618de66d730cc22cedaba1ed6f2952a7db1c'
            'a0349e9ef2ee46afd245026bc520849b5bd36b7618b38c1a5fe807b8563a62ed'
            'e7388debd7694c0da59aaa1d4f37d98517ff9cf231d15b9540e941db3543c1d9'
            'ba60a5cf8829267585b46fa82594384f231af258eee4d541972d14887ee7b88a'
            '47e452cbc8f7d6cb40249eef8d442960aefef2ac0b977352e03065397e8e8444'
            '1a35badf6a2c35408a632007ddebdf00db45b54edbe7a4928b99e643ad838b7e'
            '7dad1841a8585f95ecf79f977eb64642ca8c422efdd770d66ec74fab23d655d8'
            '34e3bfee2421c9d87ef63a96deb574d2a38bd905553f90aedf725059811a00a8'
            'c04cb5dcc5672a23b4099fddb71a79927e0d9bb07c4ac965fb30433df12ad8c1'
            'b4a1ef760769503a0b31a3fedd6c8928c7cc3eed3274006a0be6b2b533c7e8ec'
            'c354b397797df5b4fd0868b53e7d4e8f64899ef8ca41a264a9dc64ed6a975e8f')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-macchiato-* "$pkgdir/usr/share/icons"
}

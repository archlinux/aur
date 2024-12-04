# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-mocha
pkgver=1.0.2 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Mocha'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-mocha-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-mocha-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-mocha-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-mocha-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-mocha-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-mocha-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-mocha-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-mocha-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-mocha-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-mocha-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-mocha-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-mocha-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-mocha-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-mocha-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-mocha-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-mocha-yellow-cursors.zip"
)

sha256sums=('80ed98fdfece5e27ca28b5777437d17406b1721d7d90ac735e3cb472dec39b4e'
            '8f225a6b46df2dc4ebacf4f75f62c9b3a3fc8ef2936524755fa28da13153f2c0'
            '93c6c149186c70201f72e82c3b1a6b9733cb4e47696054e7a0ea7c720b8ec028'
            'aef0ed17599c1f808a4a1c46743b5d63b3c836f8f55081f567f836d12df74051'
            '57a3225620c3af6ec51fbb6254b44232040c9690bcf056574e2da0f31601c656'
            '0da9eb94c55c1d92a65ff418f7b2a1ec6974f577dbc7bcc644a80f4b9bfd58cf'
            '3bc8301a3df60f9b11d4d1a9a5c349a07748a70dced62d816889db1dfa4a69a6'
            '3c87be22490cf357809f42b20b2dea584cf97cff87950c1a296c93660e17396a'
            '367d458c6d1e25a46211fe41e1653ae550327e3dfe50dd707694fa65b178fecb'
            'a86ea815c0685cff21f07d1057bee81c3bdc9fad29b68e8fbe91f3752128dc89'
            '347c5d5d75d3ce8707e9dd7dbb64c2647bd5e8b9869bcac49aa716da8a58d15b'
            'a87e10cb55958a21a529fdf831d2a361e120c6e83a5ac0db5822ded46ee5cdd0'
            '82b21e8c7d43afe2ceba1f624c515bb28a91d86e0189e6c034dcd16c22d88de4'
            '116586c6fa82b2cba84ab2a4104b61f2cefa4b3b9212f3d5adff0dca6b7c36cf'
            '471aa6b5497516be64f9acc424295a78e04741a01a5dd813ff60858f433182b4'
            '39c94793e9768ab64f31c64cb6451bd9f8672d4284e87331c3c4d4b872f69b7b')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-mocha-* "$pkgdir/usr/share/icons"
}

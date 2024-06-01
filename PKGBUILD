# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-latte
pkgver=0.3.0 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Latte'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-latte-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-latte-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-latte-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-latte-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-latte-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-latte-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-latte-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-latte-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-latte-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-latte-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-latte-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-latte-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-latte-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-latte-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-latte-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-latte-yellow-cursors.zip"
)

sha256sums=('529656e8a84ff02c0c809a47a3e4942587c751c4619af92949397e5752a3401d'
            'd7a50e97947e17d78e1f8aa2ea93992d081f09a666ffb9de613d74f5c6626631'
            'a1149fba30a448791810e316e3ab7927a1452a6a444f5f08252c1796f44b98f7'
            '485ffccb9b60b199792934019e9ff5caf079c42fa922a0d9d254a0df094d305f'
            '22977585fc439cfcc3302de98dc21051b7917874adbf3552e9ba1c07dae955f5'
            'b243ef2528f49ef87247730b7811adf68097dcb9aad752ba85a15506a6bd86a6'
            'bd366ac75a45e2b5b35e4751eda488b5422825f4b1eaf90c286704885e9f9030'
            'a974c2c73673dfa583899f06a7ed85a3524d01744b8f48a5b98c90f03651d5c1'
            'c801375c85e0a7360ba8c25bf3e843cd47db9acc77cd0ddbca689ce533c1eeb5'
            '12fd790e4825d12ac383b02d819125291f0e7b883cb6d036b0accf7635005f1a'
            'c81418fda85b7d9671778bd967a75b72bb604a6eade9c0183c6cb882392a5009'
            'e79f6e2f9ede32af0e97dff0cbfd1206bc82926f1d562a4d2b8ca7a2a5eac8ba'
            '8ca81f5cca170f6bfda606cf4ee44fb0e3fc569de752d721d5fd8996c38f98ea'
            'b4cbc6e8fb85d8b5bc4fec71a37c896315c77269cc4835119273e7ab52604de2'
            'e789f9370161e155316a6abbcbbcf5ac9f90147c97791755f5774e1d5b7a003d'
            'd306b94c0c1347091d382937fe972f07aec77f3d04a967e9bb2a409b97a2507c')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-latte-* "$pkgdir/usr/share/icons"
}

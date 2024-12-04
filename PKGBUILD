# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-latte
pkgver=1.0.2 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('9ed28282fb7230eb0acb719588c2deff0e91792ceec7d8b03e1985e168e1de4b'
            'c8886881c0358d395f3151392fdf407bf5576dc54ef3c0878436487df76a8f49'
            '0f6000e5c261be6a2401c16f42cf327e7ebdb4480e5188d0af3718f82b03fa67'
            '8ec966a93d8c93866e70b47f36c982d489804f711941468227631dacab4b4776'
            '017d31427805d86407eef813de375bf72448619fe06f8951e79709f684db48bc'
            '7111737ab461ac28789f4266b3640d95ea79414a467753887358edc78fdc047b'
            'd6cf7badb39a6d6d0458480cbb0256e5fdc3f57816f495abdfd15d6155d871c5'
            '40cbafa068b7af5f3b5e5278574f2d88385634139d45b96f4537ee51d1f898ad'
            '15ca4dc0dbc88d34f6fe7ebea0168cd2d6134a1aa03b7ef5fa6f74d6b0919b8f'
            '1437c70a343b952a192fa0e789cce94da4a380e139aa3b094007fcdce9fe40a3'
            '5dc159335910063bc845dfb738809283b8a41191556f4f14499dc3b6b884d193'
            '739d201c3ad4437f7bf75d426c4c7a4114a5c9657c9151779bc9e6fccb7c2a02'
            '5aeee5ba3c940921314ea6ed37b7b1d736bb2465b6573f35a3fd633a83c07e10'
            '99895cf1a2260333f3acba4b57e0cec8bd1affa5187879a7928025b8949765c8'
            '91a2b2589ee762908d72986b992c57fb369549684b953932b354b634119ca3ad'
            '1f1344468bbe6a8b9225f090e48c70528b6a5dd3bed66af5d96f92f6a4c3dd00')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-latte-* "$pkgdir/usr/share/icons"
}

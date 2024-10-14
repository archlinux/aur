# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-mocha
pkgver=0.4.0 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('0abb9609fb343176a625c2e7c112fde2e836b91fd187a553e79e5fc345ad0606'
            'fa20ea644343f7634efe95a2bbd25a7f238168bb8c1c6b6c69e3761a5a1389e5'
            'fdeb06eacfb4afe19dd6d1d91296697a454fda526bf6808732783632570a5f5a'
            '8f2a6175814a3fb469570fa8645f13a4caaaae2cd3fb839bac94876cd5bb2a69'
            '07c480cd14dc51aaba591f3394d813153e67d03d154d19f8739d878465d60248'
            '39feae9693389e4d336a2cb13374ba34901027840ef1f2690072dc331d5bb9ef'
            '994c881a72d9f0bec7dffa0b2707c57322bf10063453efaa5b49b1775efcbbfe'
            'bf764f5c30425bccc33e2ecbb0c3159f21eb7ecb750dab37b28cd73c8ebf96a2'
            '685a302886203bcb406f7ec0f2dd6e6b3c5df3d9ef14d7a090f292e9f2cec434'
            '0bd8206f79b32bff0fe37c5437493498f0da519e56d1c92e6b45340ce2ca8a10'
            'e4d7f37724f38de08bee65b8fda03534bee77f8baa399711a91243e8e6eba052'
            '88145de0a96e24fb32f42e2d7c5c7bc4536d656ecc811070b92cd8e73a3c0957'
            'd166d3b4bdfd47b8fc6dd0c3430b06045a5e69812f9e4faa85385b0a05fa801c'
            'b90a2b24b01245f42e5de120f41bd23950c27d559d5482e2be43bc3280dfa739'
            '3b927aa728219bc6e0e18a433288220ae56b883af5f72ea15e965f55d9aa2874'
            'd1bf8da9e01f2df2e696d738a791cfb49df3a84a0457102ea00375e5ee963e39')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-mocha-* "$pkgdir/usr/share/icons"
}

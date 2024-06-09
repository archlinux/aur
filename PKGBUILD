# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-mocha
pkgver=0.3.1 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('6bec52b32699bc9846fed8ea2d384bf0da0250c957766a2f5c09e6d009f990c1'
            '5a4391576467245861cedabffaa860fab088cacdfa071d424901642c3065165e'
            'fbcf8ef2a6dac8b64ebfbcbda6961c842bfc8a22e4aed0ba77864a990316cc4e'
            'c61e3bd74f5de1911bb9b5480e58d55390374c9eabfee48947010a1ecaf74068'
            '5172c2d089033e3651a9c4be736e6d5b745ff861af766aff54590908e9dbfae3'
            '4e2cbb6fd5a1a6dc487847d40f12a6e1315c68ab82656333fc3d625242d0fc14'
            '1e2bba02c621badb1ce9de1054f2661e3ae857d813f39c3987b8f8f09f559307'
            '78f91c4b0d6aff819603124febfd1b764a470615c1f4550cb79b5721338ab464'
            '4b1240dbb2f7ae7e712c04b45eb41807a88a2b199ac1614187b3d0d341bcc35f'
            '7eb518768f212eae2ffe07905b615eb8712ed046e07bfa694409e7638b371acb'
            '2d13997025d72a038a2c30584b9f70766d1f204203cbb04988b7ba4d457255cc'
            '76209fece5a92ec8e6b7ba801867abf490d758c6a314de004a5749e456eee79d'
            'f18f56f35df5121eb42abdd07a6356166550b7283fa78cb3689726921f0d7d5f'
            'f3acb14a0bb02fd793b46f90d767c68d01a3678edde4641356c9664bc5d174f9'
            '3112c712e6ccb2638319759ff60052cb979737f41b14a0f75fbfc83685c348a7'
            '52fe73bdd320ee11b3741e2608d38199be836e25a127ba260e29f109beb8da66')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-mocha-* "$pkgdir/usr/share/icons"
}

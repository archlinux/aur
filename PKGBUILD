# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-sddm-theme-mocha
pkgver=1.1.2 # renovate: datasource=github-tags depName=catppuccin/sddm
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM - Mocha'
arch=('any')
license=('MIT')
depends=('sddm' 'qt6-svg' 'qt6-declarative')
url='https://github.com/catppuccin/sddm'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-mocha-blue-sddm.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-mocha-flamingo-sddm.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-mocha-green-sddm.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-mocha-lavender-sddm.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-mocha-maroon-sddm.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-mocha-mauve-sddm.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-mocha-peach-sddm.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-mocha-pink-sddm.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-mocha-red-sddm.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-mocha-rosewater-sddm.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-mocha-sapphire-sddm.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-mocha-sky-sddm.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-mocha-teal-sddm.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-mocha-yellow-sddm.zip"
)
sha256sums=('a68fbed896d3066aec1fdaded561e8d20c855f0de4e193bdca4bc0d59ac1e333'
            'da49a4951377cf952ba33a5a3335edcd85631e8e375ef7d648c9cf7e82db65ab'
            '85b9795c1482f2c317c1f83e878901f30e2b37ac8f95172dbef003eb8ef9246d'
            '08b5a99524bff09b3beedd292c5897433308a914a639236f04b15be60cef0829'
            'fb3adcff47f99156a6abed7e23fc4228b0d8cf709b26b32273be10970e28947d'
            '3d9bcc540924e06ae1aaef6994130170db7f630d7d1b25fe5e780d08493ed67f'
            '6c7a3d438a4e5d6f9a8bc099a6c43912dc30fa973515b637e03d94fe40311feb'
            '18f79ce47e519e2fdc09cf69857ed8a020d9177cdb1be9626c802fff3e810b95'
            '4a016ec4e32d4bb1c1bc61ac4a75597a1f745eebb4cb92418182628a57d74d82'
            '18eb1a4471a6d8c74ac7182137fb5ab0f5795b99eb2da9036d2aafddd1c4e2ce'
            '62914deafd7efb0475f01cacc55b4d94c3b27b9ba93d038872abed4833c16f4c'
            '61a0dda411f24d3109f91cccc4be4582b60c29ad7e7a4701535236ed2497ccaf'
            '9634fcec76afc927b919e709eaad19a9cae46ccc228040875208cf275dde5e45'
            'cf5438cf5dbbc10d9b17cad5655e2fb1f15d5196755ea0b3ecbee81b2c8682fe')

package() {
	install -d "$pkgdir/usr/share/sddm/themes/"
	cp -r -a --no-preserve=ownership catppuccin-mocha-* "$pkgdir/usr/share/sddm/themes"
}

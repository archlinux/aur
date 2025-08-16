# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-sddm-theme-latte
pkgver=1.1.2 # renovate: datasource=github-tags depName=catppuccin/sddm
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM - Latte'
arch=('any')
license=('MIT')
depends=('sddm' 'qt6-svg' 'qt6-declarative')
url='https://github.com/catppuccin/sddm'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-latte-blue-sddm.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-latte-flamingo-sddm.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-latte-green-sddm.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-latte-lavender-sddm.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-latte-maroon-sddm.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-latte-mauve-sddm.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-latte-peach-sddm.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-latte-pink-sddm.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-latte-red-sddm.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-latte-rosewater-sddm.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-latte-sapphire-sddm.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-latte-sky-sddm.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-latte-teal-sddm.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-latte-yellow-sddm.zip"
)
sha256sums=('4fd60ed3a1ebab7e7bbfdddd03efc5023b1e5eee075aa3bf03143002a5c45b6a'
            '3b923c5c87c5d488493f992a6d912dee0aa21c7dfe253dae06de3ab86e2fa401'
            'e52b992dd4f8e012ac951c18a0fb528e1a81c3714018166b1bed56cb3bb65056'
            'c5f0dffa27faae35b1b940f84c6f6f6fb1301e11a6017a51b6d33bc881867f4b'
            '228124d37bb36bde8501815f78c777f8cab4224a4d954f1cc61ff8fc15c37909'
            '2de7110556de8eed1f3b38ac07f8a2cbc36459fde5ee5bd5e15eb6635a26ed8d'
            '3402b3cf62c85d4bb3a02d80d78491f37ccd1a597c8f88bb6014d26e10b0e45a'
            'd27e26311f25eae86e97878b3431373dd98a4c496b27e8a6dc267333ffa1919c'
            'b02cb72cf32ec0c1597f87a3734a03a3b264fc690773ea5d53fc3dea8db41c43'
            'ca30d4339032af0c91800848717f3283e0a10665201b6415785084c8312e52af'
            '1710c97d40733807c5b20a099d74e070d1b8f3ad18238dbe6fd6b3dbf52f17ac'
            '2b31878fc2e1f58f24607c688e2c142eb1dc732b3f912ffd4db8d4991deab606'
            '393066e0e2304e78fbd68a3e6edf9435183125198083fb6af35030a332ce9002'
            'a8a4ed72c6854b03b9453551158f01968f2cf2d9f957b578fc88ff726c9bbdca')

package() {
	install -d "$pkgdir/usr/share/sddm/themes/"
	cp -r -a --no-preserve=ownership catppuccin-latte-* "$pkgdir/usr/share/sddm/themes"
}

# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-frappe
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/gtk
pkgrel=1
pkgdesc='Soothing pastel theme for GTK - Frappe'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-frappe-blue-standard+default.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-frappe-flamingo-standard+default.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-frappe-green-standard+default.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-frappe-lavender-standard+default.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-frappe-maroon-standard+default.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-frappe-mauve-standard+default.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-frappe-peach-standard+default.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-frappe-pink-standard+default.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-frappe-red-standard+default.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-frappe-rosewater-standard+default.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-frappe-sapphire-standard+default.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-frappe-sky-standard+default.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-frappe-teal-standard+default.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-frappe-yellow-standard+default.zip"
)

sha256sums=('13b737c33ca5ce44642bc112da74dc815556ffdd368d95d6c374003aec220572'
            '003116abc595828137ec2551a78a1e8f5c85e71d8dd536bfbd6e0af4f18d85cb'
            '34577252f485b050fc0a7364f805f54ae7342d77272060168f3e2c7897ba7822'
            '514dd115610841de5df024d37d31b0749bb3bf3991096a5cc970352e9799d580'
            'd86277451f39cd7031362627324bd93261e2834eb94ae808975b3566293f37a4'
            'f658918b053bbb04cf9ca4518e4913f5007febd8e6a8a0cbe03fc4d2e6db29f1'
            'c02c5b577280e55680474142a8484e505534e3fc3287f20f5160b755eb1d79c2'
            'ee7ccdace41618742990382aa6bad1aab1f3581a66b2d1cc9e1bae6f4677ec7a'
            '6701ad2abdafacb55f7af7cf913f4a4d9ebfabb8155d0c510346d06e339358a4'
            '1de25a181fd28757b9f3140df074edb6edb24dd46bd5d84ec96a1ef2b9aebb26'
            'b2e6fa4bfa35593a2c299b248026808d1736ffa2fc4695653f0ae38e78b4dd92'
            'e5522d04d3cc3876e705b0d762b6896a7656f30580f8d97b6caae59c8cc3861b'
            'b608a96b9f2c44755ff52f6dbdb1f3f6df26d4c5c6540ac370390098cb4e108b'
            'f04e1c641b7993cbd60367426dbeeccc93e09b0eb92697cac404ecb91db8894b')
package() {
	install -d "$pkgdir/usr/share/themes"
	cp -r -a --no-preserve=ownership \
		catppuccin-frappe-* "$pkgdir/usr/share/themes"
}

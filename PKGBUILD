# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-frappe
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Frappe'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-frappe-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-frappe-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-frappe-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-frappe-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-frappe-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-frappe-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-frappe-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-frappe-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-frappe-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-frappe-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-frappe-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-frappe-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-frappe-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-frappe-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-frappe-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-frappe-yellow-cursors.zip"
)

sha256sums=('9950a0ce68f5e1acbf6456d7254a00b3909476b6b8ecac613bfb26b197e04c1c'
            'bd34659849e4dcfa8e3867fe31e26841af66b88041ce5d71b86f0d470eb7933d'
            '346d8c5b3a34f35f18957119d501075a15183fad1cd7ab227bacd949c9571c2b'
            'fb7ac44c1e4908a2adcb1eb29183b4695c01b6042a259307ad22f61aab5e88b8'
            '6fb4bcc5ebc7aa2c7603c5734b1028a7e3db6232a7746b645b232b38c48a8d5b'
            '6d4ca494266a59522bd672426645e8ce194f205502f31a76430f8f536b0191aa'
            '86bdfe337073a6ea49f911aca4cdb914ec02c98484c2b4ad8aa5a90109753aa6'
            'b613f89ffa2f426b225af80e01d47ff02709b71befbb7c727d39647a697e89c9'
            'd1e3079d06f6571110267c57769eddfec460af8f8f5251b729f48240bb084250'
            'a763352c75a86996283dba79e472c8370ed89b8572b5bb6b5ae3d55ad843f109'
            'e9dbf4f5f5d7942930b29db285820a8437c91f231b5ade5fcd8c2d9263a4108d'
            'da9583e0ea7b9eb4bb5c887b1e7c9463a4955446281845b2985c4b94ad46c0de'
            'c495a1b1aca7765fc7becaaf33ba3bd78d47592e494b145c9588cbc4bdc3d218'
            '8536d55c947745e70c1dcc871c6df5f42303a74b8d3fdfc8e60c95248f075e3c'
            '1efd43dc13d4462269ed2cbbc9d77ab826e2aac240fba656fce66bb300160e0f'
            'af213c9adb9687f4417947da1ce7d61750f13a84ed30f32724fb2984b045fe88')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-frappe-* "$pkgdir/usr/share/icons"
}

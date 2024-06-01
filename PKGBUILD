# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-frappe
pkgver=0.3.0 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('7b7d2d280adfadaa835551059df3ca57ef9eafb661e2a8fc99a2a178efbe434a'
            '4d62ff4e67a210a81fac14e6e9f5685b4c325586c5f60150b22f5552e02f0cd3'
            'b901b36074598e4f180a3b3c476101d5ae20dbc49646abf33187fa93bbe37c03'
            '7779116946611928a6778d94e5d0c3cefe965a140a5786d1d2ee495bde9c2cb6'
            '0d411a838bd4e9708edf51428ef03af7de88222b34b024b0675ae0f5bb5ca45f'
            'd57943dfa9ad60c6a187749e193267d27a9fa16a82e35d902e0455d4b883484e'
            'c0a3932bd1ceb543e972bd9fa83fddadee3ff740f4c3ee67dfacb383f71b4be0'
            'ad07f3dcc1fc1ed170f1357721534ff1a70c27d6602c0c3e4e47fd073b4b57b4'
            '863ec687f3d5794800a5779a8ad6f7555a0ed7ae319b45b3bf684ed9525b9aed'
            '63c3d84170498632d7940056cf6d8a03cf5be605221d0a286f3ab8f8ebeb8b84'
            '42bb3e8275eba7840cfdc012c7621fc1778a20ebdcc8f0aa0b03587f3a419706'
            '5ff5e447e2586be661985dca3b40b2cabdc6df17fdb16f49aae0ba669c3c0682'
            '899fdf85c292c7abdaa0e10cbe7564e6492e5fb808d4651394c5758258ea47cd'
            '34a0892e7dfa4f56830112953033e23da0790967650e463870628eb55a816886'
            '21c2c98d02ca18ce1c3b470a7f13ffa423be12194250310cf8914b27310d80b6'
            'e8a9627e9dc6363c5f907f3c9a48e134484f2bf9af87553c655a3527262cea04')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-frappe-* "$pkgdir/usr/share/icons"
}

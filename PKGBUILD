# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-macchiato
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Macchiato'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-cursors.zip"
)

sha256sums=('d5ff2636077f36c6b66815ccae07cc72a5c91222fc03462a3542c65d3b21acd1'
            'fbd593e5623a02d7dfb50005ab0769f5532f977984cad63b98e8c71d09007557'
            'a24e54503f9d10ebef3b74d5cf03c1b9f63e1c2d1bc5b0bd641ca6df9fb57a43'
            '688688225e8704e1f119187dc78351c28badf1ddd9e3f0e9ba22ac441c237445'
            '0e52b5dfb0f89b7f12a1bcb6b105731cb601567b901e8cfa33a5a110d90dd423'
            '7ef9a7e30b6a0e9424608905050b881e262390e1c030caad0b44a122d87a81e1'
            'ab3e96ad02759640efb1471aea928d75965d4b9eae83e0e87042b0520ac02b0a'
            'b7e834849e9165f9c0041491bf510e1bdfcb96686d607a44ce9f68d00a7bc8d5'
            'bab1f75f4e7a7762d44a40a294a49ebd0b177f1338b0324d7c9542f56a56b07b'
            '67eb9aa5d33d886c7e1e1484cb152a67a4c2606f4b14adc5989350502119563c'
            'b2b4edbce0fa23322567139a0e04e4c4706d539e4317a84565850e820dd4515f'
            '2f06d573d0ea4e2ad7626b784cac4755631642f89c5a8478e679a974b068310a'
            'd354a0c51526ee4b5b6baab8ff7e4be467ba068d4c706487761ac70c0ca44bfa'
            '4a87007fb7c5ffd0fe4a24eb3abf18e54c0ca65fc168b7e4d71d53f7dc4dffd5'
            '0a714a4125b3d1d3d031ff2fbc33f5a7f0d0b76e72db78bf5621e16c89fc4e2a'
            '5e79b91f3fec15fcc12a194e82d6816303ac3dcdd221cd4d77050193ef7d0163')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-macchiato-* "$pkgdir/usr/share/icons"
}

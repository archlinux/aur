# Maintainer: Dvd-Znf <email@dvdznf.xyz>
# Contributor: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-frappe
pkgver=1.0.3 # renovate: datasource=github-tags depName=catppuccin/gtk
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

sha256sums=('8c79c1e561f9b4b2cbbde7b85244ec95bfaccc69e850216f9955d8ee73a34905'
            '1accc8a5bd9a2c26a2f46bd999ed0d30601ab4dc70c2ff8fd28053053b78d276'
            'cbb9db15d2f4c559ba7e9d02d1db4ededfbdea485f838e133c6f2a9b7d884503'
            '4628432678e351388db9d9db8591044070fc9d370de33ab981d5d53c85a1bbfc'
            '408d60526560b089766e1e9ac21ed406360b43bcfcc97996f2ee46e7be8127c1'
            '3bd26181a95b230514319c3357c34ad13877837f787b7c2b4fa2c697d9f3501e'
            'b51909cd147627c3defe4dbb0716a7ba98cae28b7c876cfcac7362fa9a43da6c'
            'f88bd2b2cbb5be03a3ea1a70729a0554bbbb9786af990e2ad258f6aea9cd2e74'
            'c4540e2412534b4654b885d095bf89c1620fa42d84fc4d052e517ae0d0c1a10a'
            '7693b77cef70814e277b6199b699c32c5229457641f811da9f70d2f51fbd89a3'
            '507cd021005345528cbac42bcf6d722c768a0ce603ad58ae539dc1aacd506813'
            '6416bf01ac25a1d19a88f6817dd99b59865ef7f64a29085c0852b745d4f684f1'
            'f0fd2a456172827cae0f8f3789a0f8d15d312495f18d3ae44680f8286f393639'
            '71c45ed9895cb5780499d78bed3772f2adcea3dcda26552b4225342774c1d9e2')
package() {
	install -d "$pkgdir/usr/share/themes"
	cp -r -a --no-preserve=ownership \
		catppuccin-frappe-* "$pkgdir/usr/share/themes"
}

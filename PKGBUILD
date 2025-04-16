# Contributor: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=1.0.3 # renovate: datasource=github-tags depName=catppuccin/gtk
pkgrel=2
pkgdesc='Soothing pastel theme for GTK3/4 - Latte'
arch=('any')
license=('GPL-3.0-only')
url='https://github.com/catppuccin/gtk'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-latte-blue-standard+default.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-latte-flamingo-standard+default.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-latte-green-standard+default.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-latte-lavender-standard+default.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-latte-maroon-standard+default.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-latte-mauve-standard+default.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-latte-peach-standard+default.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-latte-pink-standard+default.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-latte-red-standard+default.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-latte-rosewater-standard+default.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-latte-sapphire-standard+default.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-latte-sky-standard+default.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-latte-teal-standard+default.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-latte-yellow-standard+default.zip"
)

sha256sums=('f4c2f6575e91ac690ca89fff80a84a382b2639f52bc549c7ff0fcfc01fdc81f7'
            'b7a33395f1bd4150ac2dd5356b6ba048a8aa93aa62f1d1aecf0283ae3503fbd7'
            'dbdc406ef9d0adef34144da182bc0c7ee5f938a5914a5da089a3a5dfe29142a8'
            '732ad587f05c4a9669f688a7d7bc6249a38f504dd83b33c8387e7d7639d775aa'
            '3e3372e5b0f859eb542724c85ec3d9150854b6e64bb21a75946b503abb7112e7'
            'b19da9e3048dc9357a3e55f2592a4e006aaf5654ff228f846d7b21adf7c3273e'
            'aabbd314daec1f7d967e7646b23436432631d18c031ae50aefdaf15e3495f098'
            '4524cbb5c9b7156bbc41f6757dd6d6972e787ed531f16e9ac7d1c3d427e58bdf'
            '5394d3e92b529f465efdbb050316a1df9b2ef1e2444bbae1b9a0e1ee7d057d99'
            '1899cc99c1592662aeabc6a1551f6cc7a3a582a1aae9732d42aa143b5afd2d56'
            '6cd98748713e8f7d71ee2b2fa10839e68c235a4e1ab19aed63bcca4fe51b2b15'
            'f99288b50e75b265cf4057850ddf35a101631ad29afd7feec2008cb86d75040f'
            '55b9c32bc149c28dc3a9b92dfc19ee480dceb382479cc4b9cb68a432cecfe0af'
            '864d3f2d16b389ac41bfd83c06efadc02810e219b1dc1561ef3d531d7ddc48c4')
package() {
	install -d "$pkgdir/usr/share/themes"
	cp -r -a --no-preserve=ownership \
		catppuccin-latte-* "$pkgdir/usr/share/themes"
}

# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=1.0.2 # renovate: datasource=github-tags depName=catppuccin/gtk
pkgrel=1
pkgdesc='Soothing pastel theme for GTK - Latte'
arch=('any')
license=('GPL3')
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

sha256sums=('f9f0c3c8242b8be8798caf9bc8a67063a097cc09961d81283596c87e5690288b'
            '54f92d8c6c30ad25fee87e55f3e6a6280c649e0e171a12a05055ef2e259afd19'
            'b4dff5097c29400890d00201ccd4157f33f1e1d63c3437a008037b9a4c4008f2'
            '1d908b3a470e9cce30abba0092d700337e95efee0b6608ee4c87b7a2556151b4'
            '8c39718509a9693f47d8a2f1c438d13ce103d6d9331cc5f58a80b4dec7da1c2b'
            'bdb104112d26ead7bdb9ae7cab4956845496fab79667656b485df04b412b6300'
            'ea3e238facb1a7968296f16e945a86e2e8833000a141ac8232cf858dcaf34061'
            '57e7196b1c8569a0aeea79ee255df6a71d7d627ed4e0d126fc84f1d2ee0b4d27'
            '2f5e0027dd5819219f1d588b4fec5732aa2dd4ba1af9850eeacfbaf5808b1521'
            '93e9a666aff9f343ef4596239fba31acc77374f74d2dd00aff4b6233d06ee053'
            '7ce4b9d26714685f5ac4067d2805cbcb8bbdc450cea0f706da0fa4d35b502baa'
            'ad7423e9da7e618588aa0227a411359282f7ba8714a04554ee29a5a165bbd1aa'
            'c0533a1c82a2397af2c25895fb394146442945f314e4d716be46352eaa231b6e'
            'fea19e7f03073512fa39cf7df0bff75c4c85ca921cd21cd02bf1da4e19f144f2')
package() {
	install -d "$pkgdir/usr/share/themes"
	cp -r -a --no-preserve=ownership \
		catppuccin-latte-* "$pkgdir/usr/share/themes"
}

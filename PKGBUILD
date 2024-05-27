# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=1.0.0 # renovate: datasource=github-tags depName=catppuccin/gtk
pkgrel=1
pkgdesc='Soothing pastel theme for GTK - Macchiato'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-standard+default.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-standard+default.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-standard+default.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-standard+default.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-standard+default.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-standard+default.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-standard+default.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-standard+default.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-standard+default.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-standard+default.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-standard+default.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-standard+default.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-standard+default.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-standard+default.zip"
)

sha256sums=('284bd641ca9c2ecbdbb49a265692f3c9a1999c7636c53e5ea7e889501f4a2939'
            '49e5619b15a20c8533e348a23ad731b58d301d95ba54ff893a15eca6f4aadcba'
            '9b31da79375c08c52697df2303716ee9dd7463c2d28901950bb845ef84405f7b'
            '5ad7a48472f8e653dde38ff82b40968e7c97fd083d190177f5891edbf9b56dc5'
            'f4670e4b0c1c4949ec9841189306dd88f3cd24185246903778cae274868ec52a'
            '60faf5c1092df518152f1ff08050b0599761ceeaefba4c468454167513e6a538'
            '028f43af7e0a9c04ce268f9541d7a7e07abba81523ea195c26f88db822927e26'
            '1689b98419d4baa7873ac803fc83ec6c213d6432ba1caeaeea87389e6dcee9d1'
            '33aa8c84143ba1d43d14915c919fa7057160da9e277849bc4198ae112f195aee'
            'a5c1dad0499e891e6cb7d11e48b9117e5660fd7e1a66229014e0d4ca418cf879'
            'eb7c09b76984ee46fa29fa95be2d1a3cd782c7b939e1c4319bda475e57ce2011'
            'e7ac6d72a2e5897e9097faccc79a6899aab3632c166d7b141efdd62a3d4a8f00'
            'a55455083a5d3ea965abbcf00a98ea4106c997e438c0b944a8cd7292e362e3e8'
            'c9ecda10b6820609df433ba3d69c3cf0ba77871a4f0534e0284799adc256e28e')
package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -r -a --no-preserve=ownership \
		catppuccin-macchiato-* "$pkgdir/usr/share/themes"
}

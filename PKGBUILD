# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-frappe
pkgver=1.0.2 # renovate: datasource=github-tags depName=catppuccin/gtk
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

sha256sums=('9fe909ccc5c978c3e4dcdbb29c061db9c5e9a2bc9cb2c6dbd79fd74fe2950f8d'
            '53e2eb1b7af7c33c2f337a414ea9c2f3ca741049c9874952d536225582dc2ea0'
            'c8e101705b5d5a68a6c5f3bfd56ef389aed83aab6622d924da8caa44fd837489'
            '617f22541a2504a744a24e3dc9134fe463c7abde6499adf0556fb0f007df948f'
            'c992f44536400a0cd4215c90e23459b24c033046d3884de2f7421457b6c1c9c3'
            '18c344639bc4a526dacdcf73ef5402f41709da350c1be413ce2c2205c2c8de28'
            'aa9ce727fcaffa3280e3574eaf88560ab16e2c4df1c58b7fcfe2ed99ddd46ec8'
            '3fbc256fc48bfcb1c711cf290b76957bc6a7f18f231138a09e68d604d19c0fc9'
            '1e0d58f9f13e3f67bd533e361b8a29bdbda3561f21c8bb59c4bf5a81f665083d'
            '9c57c8d129497d159f41a1a3ed4d0ef55a95adc23f6c04ddc0697e7d2d4e5974'
            '0b2c855e94f7c1b1e5198f0cbc1c58a7d257201f32a0b32817565569a10bfac7'
            'c440ae83c46f2a8f166dde95a3804c40d7a7fa60d11c9ab581bfb856b7763f45'
            'bbabd7cebe603a753944611d1c234522206be45a016578f16861a1db44bdac90'
            '6dc241a51d721e2bdc17d88ce71433a5b90e0f443c5cf8a9fb111284e8288d30')
package() {
	install -d "$pkgdir/usr/share/themes"
	cp -r -a --no-preserve=ownership \
		catppuccin-frappe-* "$pkgdir/usr/share/themes"
}

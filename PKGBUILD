# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-macchiato
pkgver=0.3.1 # renovate: datasource=github-tags depName=catppuccin/cursors
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

sha256sums=('2198d88c687ccc4fc0f0b8d4aaf313ad8ab9854ed9f12e2f752d8f01998f6032'
            'f008bd4f3a00ffa5f2e123bc6ec8713f5f1fd48497184c89936ad3c139e51479'
            'fe6e96043b8636426cf9fe348b1efaf458f646e30c181c7461ec345c81b1c93c'
            '7db1d2bfcbcac54721a58cee6108d7453f31b6ac77260e1c00d55476102b0891'
            '56f2f7d71f75acaba3bf3be7357f919e5d3123d9a2c7ba6a7273bcc660dcddb3'
            '2df77ff8d399d2317e2d3e2ab99588e83ad5ecc4e6b28a88dc4f27bd7fb922f1'
            'd3183c5f6a3a1ce21a9b65f1422e9a2947ed8254a960caf6f6395bf2e0b6b2cd'
            'e13abcd4a4949adaba1bae52df5b4435585f64652c767b479895bbfbde6bd78c'
            'd4d7c9e24aff8fefb14407fdb2e15e9c9ee0ec44d597bf67d59065a3e8c366e3'
            'e4fa9600da6ed2efa7dd4673efd68702e3e0e4dc4e3450c78902a8feabcb2df9'
            '0b96e37ee424e3f01f34001aa37c9ef5214074e0ce02d346960364528f835dcf'
            '04cb793e1a1f404a61e651c35cd2fdd236337a46520687c0abd05625aaa55949'
            'c2c2ad9f3698fc580dd96bda81fa90f76335cbc279350ef945f1b249cd30bf30'
            'd2b0461574224e08df12d02c6baf02d877ee33489a2e8c4bf9fd898c86c6ae6d'
            'c94fda26675a41fc98c3e12d2e2e1168e8deff89c03be07a4fe5fe9acecb11cd'
            'd515da076fce107d671b2eeed5c34b7b04df959f1e6303478385128547940af2')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-macchiato-* "$pkgdir/usr/share/icons"
}

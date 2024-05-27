# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=1.0.2 # renovate: datasource=github-tags depName=catppuccin/gtk
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

sha256sums=('eb671a5c3da0f2d30a28bb1d4a55a53926416ccf335ec51d146c1a1c0a082cdd'
            'fe21e8b9fe5474f3f82dfa1598980beeb4d5979a421e781595d0b288e7f11a0c'
            'f8621e841d146c052744c51ba46ad05c18324b5a32999f7bb564de6a132cd16b'
            '38bc28d4d9c9020b827e856b8a18d2798687742855db352817b7d49bf27850f6'
            'c0548d399a20a27324fd8b9526b4e05822e6824822989a8c29a0aeae33414c97'
            '15b6c3e7dbf0663ff69e8f27c0173ee07b381ab4776bf884d8ee336dc2df8624'
            '29079a2154c15b0493303558c23dd6bbc9d4b25ac0264600b523047b6caaf471'
            'a8c435123da2c9980fd411457a1d626fca7e885308a8a7bb421d93eeb045238b'
            'd51593bc748b5c9d9fe3be5dd45bdf745676aa347f919dafd9d87f63793363b9'
            'b04d8041a923a1f1b8adbbab4613043865f6147d144242d96d6d3b6592b72b60'
            'b858582865dcbc70344b0abb0b9f62e1827d169b5e543a287f34e99ec2af98bc'
            '5a94ebf67523df0a27a463bcf557a462e8d64d2abe510226a33cf990fc8b5a53'
            '96341f10cd0f7ada06b8001548861102a81ed7366c6704b6e43c0c2aff231007'
            '0a92bb929501386164204c65ef5e07b00fae9981ea3adfa97ec338283afd3e94')
package() {
	install -d "$pkgdir/usr/share/themes/"
	cp -r -a --no-preserve=ownership \
		catppuccin-macchiato-* "$pkgdir/usr/share/themes"
}

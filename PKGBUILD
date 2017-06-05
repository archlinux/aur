# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=1.0.0
_commit='2fa3276eb1fdea15122afab53da995a8e6d64ba9'
sha256sums=('c322c8c252441adaa322d95bd6b0e1bac1d7039fdf01bf2e13a0515a3dd2d313')

pkgname=mac-os-x-cheetah-theme-git
pkgdesc='Mac OS theme with the Aqua design guidelines'
arch=('any')
url='https://github.com/B00merang-Project/Mac-OS-X-Cheetah'
license=('GPL')
source=("https://github.com/B00merang-Project/Mac-OS-X-Cheetah/archive/$_commit.zip")

package() {
	mkdir -p $pkgdir/usr/share/themes
	cp -r "$srcdir/Mac-OS-X-Cheetah-$_commit" \
		"$pkgdir/usr/share/themes/Mac-OS-X-Cheetah"
}

# Maintainer: Jonathan Kirszling <jkirsz@gmail.com>
pkgname=upaste
pkgrel=1
pkgver=0.1.1
pkgdesc="Paste and upload files on x0.at"
arch=('any')
url="https://github.com/eoli3n/$pkgname"
license=('UNLICENSE')
optdepends=('wl-clipboard: Command-line copy/paste utilities for Wayland'
            'xclip: Command line interface to the X11 clipboard')
source=("up"
		"UNLICENSE")
sha256sums=("2d29aa3d2d9a4e36c4a0205fa3c5c630b26bfbb11c0708452ab8cd766b33d257"
"6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e")

package() {
	install -Dm755 'up' "${pkgdir}/usr/bin/up"
	install -Dm644 'UNLICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}

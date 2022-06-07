# Maintainer: Jonathan Kirszling <jonathan.kirszling@runbox.com>
pkgname=upaste
pkgrel=1
pkgver=0.1.4
pkgdesc="Paste and upload files"
arch=('any')
url="https://github.com/eoli3n/$pkgname"
license=('UNLICENSE')
optdepends=('wl-clipboard: Command-line copy/paste utilities for Wayland',
            'xclip: Command line interface to the X11 clipboard')
depends=('curl')
source=("up"
		"UNLICENSE")
sha256sums=("3654beb706bdcd61a41224da7bb13ae299fb2c8a23ed0462d1e5d747a0a38961"
"6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e")

package() {
	install -Dm755 'up' "${pkgdir}/usr/bin/up"
	install -Dm644 'UNLICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}

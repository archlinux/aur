# Maintainer: Varagnac Kim <vacaniat@pm.me>
pkgname=kjv-fzf-git
pkgver=r1
pkgrel=1
pkgdesc="King James Bible with fuzzy finder"
arch=(any)
url="https://github.com/varagnac/pure-text-bible"
license=('custom:Public Domain')
depends=('bash' 'gawk' 'fzf')
optdepends=('xclip: X11 clipboard support'
	    'wl-clipboard: Wayland clipboard support')
source=("kjv-fzf::https://github.com/varagnac/pure-text-bible/raw/master/kjv_fzf")
md5sums=('40103596055b2d5f849dc795367dc931')

package() {
	cd "$srcdir/"
	install -Dm755 kjv-fzf $pkgdir/usr/bin/kjv-fzf
}

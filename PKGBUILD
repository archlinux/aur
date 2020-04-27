# Maintainer: Varagnac Kim <vacaniat@pm.me>
pkgname=grb-fzf-git
pkgver=r1
pkgrel=1
pkgdesc="Greek Bible with the Septuagint, SBL and Apocrypha, with fuzzy finder"
arch=(any)
url="https://github.com/varagnac/pure-text-bible"
license=('custom:Public Domain')
depends=('bash' 'gawk' 'fzf')
optdepends=('xclip: X11 clipboard support'
	    'wl-clipboard: Wayland clipboard support')
source=("grb-fzf::https://github.com/varagnac/pure-text-bible/raw/master/grb_fzf")
md5sums=('SKIP')

package() {
	cd "$srcdir/"
	install -Dm755 grb-fzf $pkgdir/usr/bin/grb-fzf
}

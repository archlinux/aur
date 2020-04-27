# Maintainer: Varagnac Kim <vacaniat@pm.me>
pkgname=grb-fzf-git
pkgver=r1.1
pkgrel=1
pkgdesc="Greek Bible with the Septuagint, SBL and Apocrypha, with fuzzy finder"
arch=(any)
url="https://github.com/varagnac/pure-text-bible"
license=('custom:Public Domain')
depends=('bash' 'gawk' 'fzf')
optdepends=('xclip: X11 clipboard support'
	    'wl-clipboard: Wayland clipboard support')
source=("${pkgname}-${pkgver}::https://github.com/varagnac/pure-text-bible/raw/master/grb_fzf")
md5sums=('418a5e12c09ad9db1c3af221fc6bac9a')

package() {
	cd "$srcdir/"
	install -Dm755 grb-fzf $pkgdir/usr/bin/grb-fzf
}



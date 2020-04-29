# Maintainer: Varagnac Kim <vacaniat@pm.me>
pkgname=grb-fzf-git
pkgver=r1.2
pkgrel=1
pkgdesc="Greek Bible with the Septuagint, SBL and Apocrypha, with fuzzy finder"
arch=(any)
url="https://github.com/varagnac/pure-text-bible"
license=('custom:Public Domain')
depends=('bash' 'gawk' 'fzf')
optdepends=('xclip: X11 clipboard support'
	    'wl-clipboard: Wayland clipboard support')
source=("${pkgname}-${pkgver}::https://github.com/varagnac/pure-text-bible/raw/master/grb_fzf")
md5sums=('86dec82bd25195acc4751c58dd9e81c2')

package() {
	cd "$srcdir/"
	install -Dm755 ${pkgname}-${pkgver} $pkgdir/usr/bin/grb-fzf
}



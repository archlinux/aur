# Maintainer: Varagnac Kim <vacaniat@pm.me>
pkgname=kjv-fzf-git
pkgver=r1.2
pkgrel=1
pkgdesc="King James Bible with fuzzy finder"
arch=(any)
url="https://github.com/varagnac/pure-text-bible"
license=('custom:Public Domain')
depends=('bash' 'gawk' 'fzf')
optdepends=('xclip: X11 clipboard support'
	    'wl-clipboard: Wayland clipboard support')
source=("${pkgname}-${pkgver}::https://github.com/varagnac/pure-text-bible/raw/master/kjv_fzf")
md5sums=('50b49ad793362ad63605c61d9eca4cb4')

package() {
	cd "$srcdir/"
	install -Dm755 ${pkgname}-${pkgver} $pkgdir/usr/bin/kjv-fzf
}

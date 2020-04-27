# Maintainer: Varagnac Kim <vacaniat@pm.me>
pkgname=kjv-fzf-git
pkgver=r1
pkgrel=1
pkgdesc="King James Bible with fuzzy finder"
arch=(any)
url="https://github.com/varagnac/pure-text-bible"
license=('custom:Public Domain')
depends=('bash' 'fzf')
source=("kjv-fzf::https://github.com/varagnac/pure-text-bible/raw/master/kjv_fzf")
md5sums=('SKIP')

package() {
	cd "$srcdir/"
	install -Dm755 kjv-fzf $pkgdir/usr/bin/kjv-fzf
}

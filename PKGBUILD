# Maintainer: Varagnac Kim <vacaniat@pm.me>
pkgname=vul-fzf-git
pkgver=r1.2
pkgrel=1
pkgdesc="Latin Vulgate with fuzzy finder"
arch=(any)
url="https://github.com/varagnac/pure-text-bible"
license=('custom:Public Domain')
depends=('bash' 'gawk' 'fzf')
optdepends=('xclip: X11 clipboard support'
	    'wl-clipboard: Wayland clipboard support')
source=("${pkgname}-${pkgver}::https://github.com/varagnac/pure-text-bible/raw/master/vulgate_fzf")
md5sums=('21e2cf8d44bd9a5d7471def3f907b232')

package() {
	cd "$srcdir/"
	install -Dm755 ${pkgname}-${pkgver} $pkgdir/usr/bin/vul-fzf
}

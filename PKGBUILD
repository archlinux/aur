# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='gcac'
pkgver='1.0.1'
pkgrel='1'
pkgdesc='API-based replacement bash completion script for git clone'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-or-later')
depends=('bash-completion' 'curl' 'git' 'jq' 'openssh')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('c6cd66359e7b606e852f7388c416c21d29d376edad3cc970db224e0591a1f2672ee6a38c3b1424b6e11dd18fc955d2364fba5379277992319847ff27dfc02cb2')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.bash" "$pkgdir/usr/share/gcac/$pkgname.bash"
}

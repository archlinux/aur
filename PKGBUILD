# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='gcac'
pkgver='1.0.3'
pkgrel='1'
pkgdesc='API-based replacement bash completion script for git clone'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-or-later')
depends=('bash-completion' 'curl' 'git' 'jq' 'openssh')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('335d1a41510febd288b5add373b9619124dcd58ca258eebe89c952796e1135e97086dd78b0f53eb44e6eb36c4e81b8d99011800f8fa7909f9cc664c7e2e9ba6f')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.bash" "$pkgdir/usr/share/gcac/$pkgname.bash"
}

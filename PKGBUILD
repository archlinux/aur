# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='gcac'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='API-based replacement bash completion script for git clone'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-or-later')
depends=('bash-completion' 'curl' 'git' 'jq' 'openssh')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('dd883d81057b7762c75d6e93fe16a829c3679c029c63e5d2d236279a2c99a3060472baf06970d1870b1da40c22d16c859565bf72b01c77967daa23b735768d24')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.bash" "$pkgdir/usr/share/gcac/$pkgname.bash"
}

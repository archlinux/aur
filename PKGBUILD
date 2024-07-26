# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='gcac'
pkgver='1.0.2'
pkgrel='1'
pkgdesc='API-based replacement bash completion script for git clone'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-or-later')
depends=('bash-completion' 'curl' 'git' 'jq' 'openssh')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('8be64ec289f271d80ead5c624ffc060a404dcca70db4b912308942c275d35bcffe3f8fea161edefa534d7efa61b2c29f1b756a9b3e111d0c5819eb87121f0d1f')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.bash" "$pkgdir/usr/share/gcac/$pkgname.bash"
}

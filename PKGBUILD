# Maintainer: Matt C <matt@xhec.us>
# Upstream author: jnats <jnats@salyut.one>
pkgname=nowpm-git
_pkgname=nowpm
pkgver=1.0
pkgrel=1
pkgdesc="the no-bullshit wpm utility"
arch=('any')
url="https://github.com/jnats/nowpm"
license=('custom:nolicense')
depends=('coreutils' 'grep' 'sed' 'bash' 'wdiff' 'bc')
provides=('nowpm')

source=("nowpm::git+https://github.com/jnats/nowpm.git")

md4sums=("SKIP")

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$_pkgname
	cd $_pkgname
	chmod +x nowpm
	cp nowpm $pkgdir/usr/bin
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
md5sums=('SKIP')

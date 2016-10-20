# Maintainer: Kevin Daudt <ops@ikke.info>
pkgname=git-log-compact
pkgver=1.0
pkgrel=1
pkgdesc="compact git log --oneline with who & when"
arch=('any')
url="https://mackyle.github.io/git-log-compact/"
license=('GPL2')
depends=(perl)
source=("https://github.com/mackyle/$pkgname/archive/v$pkgver.tar.gz")

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 git-log-compact "$pkgdir/usr/bin/git-log-compact"
}

sha256sums=('7c63e2be64588adc8843b8e280220ee41c81728b34c6fa354df3e6741e9b8c2c')

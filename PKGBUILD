# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=run-one
_bzr=70
pkgver=1.17
pkgrel=2
pkgdesc="Run just one instance of a command and its args at a time "
arch=('any')
url="https://launchpad.net/run-one"
license=('GPL3')
depends=('sh' 'util-linux')
source=("$pkgname-$pkgver.tgz::https://bazaar.launchpad.net/~run-one/run-one/trunk/tarball/$_bzr")

package() {
	cd "~$pkgname/$pkgname/trunk"
  mkdir -p "$pkgdir/usr/bin/"
  mv run-one keep-one-running run-one-constantly run-one-until-failure run-one-until-success run-this-one "$pkgdir/usr/bin/"
  install -Dm644 run-one.1 "$pkgdir/usr/share/man/man1/run-one.1"
}

sha256sums=('2582ec486ad91dacda511967a87fd80eec6bf924867576477c8f5cd93df3f91a')

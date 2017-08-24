# Maintainer: Avital Tamir <avital.osog@gmail.com>

pkgname=funktion
pkgver=v1.0.14
pkgrel=1
pkgdesc="AWS Lambda style programming model on top of Kubernetes"
arch=('x86_64')
url="https://github.com/funktionio/funktion"
license=('Apache')
makedepends=()

source=("https://github.com/funktionio/funktion/releases/download/${pkgver}/funktion-linux-amd64")
sha512sums=('2ed17f80b606de6674b9afd764f4124ae632371861e9a5271d40a42da66e6b7fa6c50f0c7da1c43f64014e4b203b8b96c04b3fac3c828a86bc02bbe26763fc7a')

package() {
	install -D -g root -m 0755 -o root "$srcdir/funktion-linux-amd64" "$pkgdir/usr/bin/funktion"
}

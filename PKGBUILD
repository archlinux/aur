# Maintainer: mmoya <mmoya at mmoya dot org>

pkgname=depsguard-bin
pkgver=0.1.33
pkgrel=1
pkgdesc="Harden your package manager configs against supply chain attacks."
arch=('x86_64')
url="https://github.com/arnica/depsguard"
license=('MIT')
source=("https://github.com/arnica/depsguard/releases/download/v${pkgver}/depsguard-linux-amd64-musl.tar.gz")
sha256sums=('4ddb0c847b434d05fcbbecc49765838fa669a45678e0e6b6e6ac9e788d9137c5')
options=('!debug')

package() {
    install -Dm755 depsguard "${pkgdir}/usr/bin/depsguard"
}

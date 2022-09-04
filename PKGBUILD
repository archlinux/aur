# Maintainer: Arley Henostroza <arllk10@gmail.com>

pkgname=weave-gitops-bin
pkgver=0.9.4
pkgrel=2
pkgdesc='Weave GitOps is a simple open source developer platform for people who want cloud native applications, without needing Kubernetes expertise'
arch=('x86_64')
url='https://github.com/weaveworks/weave-gitops'
license=('MPL2')
depends=()
makedepends=()
provides=('weave-gitops' 'gitops')
conflicts=('weave-gitops' 'gitops')
source=("$pkgname-$pkgver.tar.gz::https://github.com/weaveworks/weave-gitops/releases/download/v$pkgver/gitops-linux-x86_64.tar.gz")
sha256sums=('01dbe762e0ffe99cb1d6ef21955e59300cfece20b5f7f693350473ca5eeab3fe')

package() {
    install -Dm 755 "$srcdir/gitops" "$pkgdir/usr/bin/gitops"
}

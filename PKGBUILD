# Maintainer: Arley Henostroza <arllk10@gmail.com>

pkgname=weave-gitops-bin
pkgver=0.31.2
pkgrel=1
pkgdesc='Weave GitOps is a simple open source developer platform for people who want cloud native applications, without needing Kubernetes expertise'
arch=('x86_64')
url='https://github.com/weaveworks/weave-gitops'
license=('MPL2')
depends=()
makedepends=()
provides=('weave-gitops' 'gitops')
conflicts=('weave-gitops' 'gitops')
source=("$pkgname-$pkgver.tar.gz::https://github.com/weaveworks/weave-gitops/releases/download/v$pkgver/gitops-linux-x86_64.tar.gz")
sha256sums=('8178fb0e04fa8f782642660a097d7dc1a1a2958357ceeb193e56a41bef712403')

package() {
    install -Dm 755 "$srcdir/gitops" "$pkgdir/usr/bin/gitops"
}

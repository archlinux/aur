# Maintainer: Arley Henostroza <arllk10@gmail.com>

pkgname=weave-gitops-bin
pkgver=0.32.0
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
sha256sums=('a2eac2f9f398eb7b8b3e23cc77d7be8d63a64060bd211fb529524a472d36610f')

package() {
    install -Dm 755 "$srcdir/gitops" "$pkgdir/usr/bin/gitops"
}

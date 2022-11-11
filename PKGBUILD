# Maintainer: Arley Henostroza <arllk10@gmail.com>

pkgname=weave-gitops-bin
pkgver=0.10.2
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
sha256sums=('76d46c2515494466c67afadf94855bbe001d12a7bf0ee69deb5ce746e08fce03')

package() {
    install -Dm 755 "$srcdir/gitops" "$pkgdir/usr/bin/gitops"
}

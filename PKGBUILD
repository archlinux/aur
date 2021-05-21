# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=vcluster-bin
pkgver=0.2.0
pkgrel=0
pkgdesc='Create fully functional virtual Kubernetes clusters'
arch=('x86_64')

url='https://vcluster.com'
license=('Apache')
source=("vcluster-$pkgver::https://github.com/loft-sh/vcluster/releases/download/v${pkgver}/vcluster-linux-amd64")

depends=()
optdepends=()

provides=(vcluster)
conflicts=(vcluster)

package() {
  install -Dm 755 "$srcdir/vcluster-$pkgver" "$pkgdir/usr/bin/vcluster"
}

sha256sums=('0756f399b6b89a082cb89c87cb5b3b07cc29a1471bf8604fc202af921dd26144')

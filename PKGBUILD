# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=vcluster-bin
pkgver=0.3.1
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

sha256sums=('50b162168ed1baa97bba0c58ef389f340dee25d3c3da05daccda01c2ce4c5027')

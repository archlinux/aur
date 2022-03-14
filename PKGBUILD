# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=vcluster-bin
pkgver=0.6.0
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

sha256sums=('e4be91adf7bdb073c65aa46ddb6e1fdf49d2f71bd5f72f8aa82ad718d78f602c')

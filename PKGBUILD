# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=vcluster-bin
pkgver=0.15.0
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

sha256sums=('e80ff494d705324b9a9f8a8998402a687f47fe219e0a6d0a50e06a851591bbdf')

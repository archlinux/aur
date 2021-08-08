# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=vcluster-bin
pkgver=0.3.3
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

sha256sums=('1dfa0d160a3c9714086e94f54b9a8d76f46948426b583fbdf136c04d9772b514')

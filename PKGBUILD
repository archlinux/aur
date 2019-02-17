# Maintainer: koyu <me at koyu dot space>
# Contributor: Aral Balkan <mail at ar dot al>

pkgname=pmd-aral
pkgver=d0dcba14
pkgrel=1
epoch=0
pkgdesc="Print Markdown (pmd) is a simple script that renders markdown in commandline terminals using grip and lynx."
arch=("armv7h" "i686" "x86_64")
url="https://source.ind.ie/aral/pmd"
license=("AGPL")
depends=("lynx" "python-grip")
source=("https://source.ind.ie/aral/pmd/-/archive/master/pmd-master.tar.gz")
sha256sums=("ea2b9455f3ec2d8f4ba438685982c115a48e23eecacbc96affa5f81426df02fe")

package() {
  cd "${srcdir}/pmd-master"
  mkdir -p "$pkgdir/usr/local/bin/"
  install -Dm755 pmd "$pkgdir/usr/local/bin/"
}

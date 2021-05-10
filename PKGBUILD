# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=koka

pkgname=koka-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Koka: a function-oriented language with effect inference"
arch=('x86_64')
url="https://github.com/koka-lang/koka"
license=('Apache')
options=('!strip')
depends=('cmake' 'gcc' 'make')
optdepends=(
  'clang: for C backend compiler'
  'nodejs'
)
provides=('koka')
conflicts=('koka')
source=(
  "https://github.com/koka-lang/koka/releases/download/v${pkgver}/koka-v${pkgver}-linux-amd64.tar.gz"
)
noextract=("koka-v${pkgver}-linux-amd64.tar.gz")
sha256sums=(
  'd2cc16e3ac588cd653c62ac1cbaf60ec61ac816a9443e1e1268dbe92c6e78887'
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf koka-v${pkgver}-linux-amd64.tar.gz -C "${pkgdir}/usr"
}

# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=koka

pkgname=koka-bin
pkgver=2.0.14
pkgrel=1
pkgdesc="Koka: a function-oriented language with effect inference"
arch=('x86_64')
url="https://github.com/koka-lang/koka"
license=('Apache')
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
  '965a776de0148f209fcd80c220aaf1a22c9e0e336bb9bce80add7e05cc72098f'
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf koka-v${pkgver}-linux-amd64.tar.gz -C "${pkgdir}/usr"
}

# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=koka

pkgname=koka-bin
pkgver=2.0.16
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
  'cfaa7d61358c4f29f704b8462041f1157482e65f81f971fce4406b936b9f81a3'
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf koka-v${pkgver}-linux-amd64.tar.gz -C "${pkgdir}/usr"
}

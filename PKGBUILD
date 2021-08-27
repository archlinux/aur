# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=koka

pkgname=koka-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Koka: a function-oriented language with effect inference"
arch=('x86_64')
url="https://github.com/koka-lang/koka"
license=('Apache')
options=('!strip')
depends=('gcc' 'make')
optdepends=(
  'clang: for C backend compiler'
  'nodejs'
)
provides=('koka')
conflicts=('koka')
source=(
  "https://github.com/koka-lang/koka/releases/download/v${pkgver}/koka-v${pkgver}-linux-x64.tar.gz"
)
noextract=("koka-v${pkgver}-linux-x64.tar.gz")
sha256sums=(
  '442871824b19f68606651d86b9287ed0fbbac323d49612706ed51ade1b2be1de'
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf koka-v${pkgver}-linux-x64.tar.gz -C "${pkgdir}/usr"
}

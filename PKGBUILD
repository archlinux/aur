# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=koka

pkgname=koka-bin
pkgver=2.1.8
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
  'bb36187ecd1619c4560373a3b245e489ff0a4586e56c3faf2a6840dce4725fe0'
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf koka-v${pkgver}-linux-x64.tar.gz -C "${pkgdir}/usr"
}

# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=koka

pkgname=koka-bin
pkgver=2.1.4
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
  "https://github.com/koka-lang/koka/releases/download/v${pkgver}/koka-v${pkgver}-linux-amd64.tar.gz"
)
noextract=("koka-v${pkgver}-linux-amd64.tar.gz")
sha256sums=(
  'e4df3358cd940ce4d7a757c5c20c776f2d9d1715256c085bbbc35fe26f6656a4'
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf koka-v${pkgver}-linux-amd64.tar.gz -C "${pkgdir}/usr"
}

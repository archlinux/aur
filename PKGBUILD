# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redpanda-cpp-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A light-weight C/C++ IDE based on Qt"
arch=('x86_64')
url="https://github.com/royqh1979/RedPanda-CPP"
license=('GPL')
options=('!strip')
depends=('qt5-base' 'qt5-svg')
optdepends=('gcc' 'gdb' 'make' 'qterminal')
provides=('redpanda-cpp')
conflicts=('redpanda-cpp')
source=(
  "https://downloads.sourceforge.net/dev-cpp-2020/${pkgver}/redpanda-cpp-debian_${pkgver}-1_amd64.deb"
)
sha256sums=(
  '1a14175c49defc38e57702ac4265f6d7581a87149485184a5c15248efab48ea1'
)
noextract=(
  "redpanda-cpp-debian_${pkgver}-1_amd64.deb"
)

package() {
  bsdtar -O -xf "redpanda-cpp-debian_${pkgver}-1_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}

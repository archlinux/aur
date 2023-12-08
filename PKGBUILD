# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
pkgname=redpanda-cpp-bin
pkgver=2.25
pkgrel=1
pkgdesc="A light-weight C/C++ IDE based on Qt"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://sourceforge.net/projects/redpanda-cpp"
_ghurl="https://github.com/royqh1979/RedPanda-CPP"
_downurl="https://versaweb.dl.sourceforge.net/project/redpanda-cpp"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'qt5-svg'
    'hicolor-icon-theme'
)
optdepends=(
    'gcc'
    'gdb'
    'git'
    'make'
    'qterminal'
    'raylib'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zst::${_downurl}/${pkgver}/linux/${pkgname%-bin}-${pkgver}-1-aarch64.pkg.tar.zst")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zst::${_downurl}/${pkgver}/linux/${pkgname%-bin}-${pkgver}-1-armv7h.pkg.tar.zst")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zst::${_downurl}/${pkgver}/linux/${pkgname%-bin}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums_aarch64=('08f57e9d5eec862ce28c24c4574aa22707dfb3b6fbd70340aba41f2fac1d0b46')
sha256sums_armv7h=('539dbbef1e6d0ed197614a42ac3642207bca637a7a3afd9fe14c1921daf765f0')
sha256sums_x86_64=('df909ebde08f6156d40fb194c4651a33a4133517a23d5b04a39b49687cf904d3')
package() {
    cp -r "${srcdir}/usr" "${pkgdir}"
}
# Maintainer: taotieren <admin@taotieren.com>
# mockitt 中文版

pkgname=mockitt-cn
pkgver=1.3.6
pkgrel=0
arch=('x86_64')
options=(!strip !debug)
conflicts=("mockitt")
pkgdesc="墨刀，让原型设计更简单, modao/mockitt 国内版本(与国际版本账户数据不互通)"
depends=(
    bash
    expat
    dbus
    gcc-libs
    glib2
    glibc)
makedepends=(
    libarchive)
license=('Commercial')
url="https://modao.cc/feature/downloads.html"
source_x86_64=("${pkgname}-${pkgver}.deb::https://cdn.modao.cc/desktop/prod-${pkgver}/linux/Mockitt-linux-x64-${pkgver}.deb")
sha256sums_x86_64=('04dcfb00287ee56d5106b4230f6223b1a523d6d12a0d268799147854da7d1672')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

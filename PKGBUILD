# Maintainer: Myqfeng <viagrahuang@outlook.com>

pkgname=qteasytier-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="基于 EasyTier, 一款美观实用的远程联机工具!"
arch=('x86_64')
options=('!debug')
url="https://gitee.com/qteasytier/qt-easy-tier"
license=('LGPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'polkit')
makedepends=('binutils')
provides=('qteasytier')
conflicts=('qteasytier')
install=qteasytier.install
source=("https://gitee.com/qteasytier/qt-easy-tier/releases/download/${pkgver}/qteasytier_v${pkgver}_linux_amd64.deb")
sha256sums=('9cd157870cc44efcd356717abb453fef62df3dcaaed5b45751118cba8d2521aa')

package() {
    cd "${srcdir}"
    ar x "qteasytier_v${pkgver}_linux_amd64.deb"
    tar -xf data.tar.* -C "${pkgdir}"
}

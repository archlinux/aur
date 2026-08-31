# Maintainer: Myqfeng <viagrahuang@outlook.com>

pkgname=qteasytier-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="基于 EasyTier, 一款美观实用的远程联机工具!"
arch=('x86_64')
options=('!debug')
url="https://cnb.cool/myqfeng/qteasytier/qt-easy-tier"
license=('LGPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'polkit')
makedepends=('binutils')
provides=('qteasytier')
conflicts=('qteasytier')
install=qteasytier.install
source=("https://cnb.cool/myqfeng/qteasytier/qt-easy-tier/-/releases/download/${pkgver}/qteasytier_v${pkgver}_linux_amd64.deb")
sha256sums=('6f865232a1ceedf7aea91dc2c97ab4cc5eb32294e763e51a623f1fe9286a8165')

package() {
    cd "${srcdir}"
    ar x "qteasytier_v${pkgver}_linux_amd64.deb"
    tar -xf data.tar.* -C "${pkgdir}"
}

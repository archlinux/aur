# Maintainer: Myqfeng <viagrahuang@outlook.com>

pkgname=qteasytier-bin
pkgver=3.1.0
pkgrel=2
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
sha256sums=('17717feaa09ba54638911bdf8ac8fb07fb0cc74954657f4c3207b4967462c56d')

package() {
    cd "${srcdir}"
    ar x "qteasytier_v${pkgver}_linux_amd64.deb"
    tar -xf data.tar.* -C "${pkgdir}"
}

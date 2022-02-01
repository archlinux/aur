# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=rsyncinator-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="This is the open source desktop and web app for Rsyncinator, the GUI tool for generating rsync commands."
arch=('x86_64')
url="https://github.com/snipline/$pkgname"
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('dae345cc767d0166be03976687e7842f5f46f49699e539a7cc5d45664cc795fa6627e3322478de709143c7e26e1c71fe3731589d62f40d6c3481ea372530760f')

prepare() {
    tar -zxvf "data.tar.gz"
}

package() {
    cp -a "usr" "${pkgdir}/usr"
}

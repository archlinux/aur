# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=rsyncinator-desktop
pkgver=0.2.0
pkgrel=2
pkgdesc="This is the open source desktop and web app for Rsyncinator, the GUI tool for generating rsync commands."
arch=('x86_64')
url="https://github.com/snipline/$pkgname"
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('43bbe8d8932685e8a0327b12c915982b3c6c22287451b3798cc0cf69e3ba121d331ff57012413e4156ac12b647637c946161829e614fb6aff2a5466ccf137c35')
depends=('webkit2gtk')

prepare() {
    tar -zxvf "data.tar.gz"
}

package() {
    cp -a "usr" "${pkgdir}/usr"
}

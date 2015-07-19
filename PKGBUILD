# Maintainer: Sébastien LEBEAU <sebcbi1 at gmail dot com>

pkgname=ngrok-bin
pkgver=2.0.19
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='http://ngrok.com'
license=('unknown')
source_i686=("https://dl.ngrok.com/ngrok_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.ngrok.com/ngrok_${pkgver}_linux_amd64.zip")
md5sums_i686=('1ab37b11def57d7f8fb9d90feaf77ea8')
md5sums_x86_64=('fea0e9f8b6ab7e6f4edff077c70ec169')
arch=('i686' 'x86_64')
conflicts=('ngrok','ngrok-git')

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/ngrok ${pkgdir}/usr/bin
}

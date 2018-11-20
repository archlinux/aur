# Maintainer: Alejandro Quisbert <alexandro@autistici.org>

pkgname=gocho
pkgver=0.1
pkgrel=1
pkgdesc='A local area network file-sharing application with nodes auto-discovery'
arch=('x86_64')
depends=('glibc')
makedepends=('unzip')
url='https://github.com/donkeysharp/gocho.git'
license=('MIT')
source=('https://github.com/donkeysharp/gocho/releases/download/0.1.0/gocho_0.1.0_linux64.zip')
md5sums=('98ab0acdb74117ecea7403acc92782ac')


package() {

    cd "${srcdir}"
    unzip --qt gocho_0.1.0_linux64.zip
    install -D gocho "${pkgdir}"/usr/bin/gocho
    
}

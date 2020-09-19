# Maintainer: Alejandro Quisbert <alexandro@autistici.org>

pkgname=gocho
pkgver=0.1.0
pkgrel=2
pkgdesc='A local area network file-sharing application with nodes auto-discovery'
arch=('x86_64')
depends=('glibc')
makedepends=('unzip')
url='https://github.com/donkeysharp/gocho.git'
license=('MIT')
_gocho_file=gocho_${pkgver}_linux64.zip
source=("https://github.com/donkeysharp/gocho/releases/download/${pkgver}/gocho_${pkgver}_linux64.zip")
sha256sums=('f6964a93f1db666220fc3d393b20b761b5f01c1d8907b03150d33992936cc90c')


package() {

    cd "${srcdir}"
    unzip --qt $_gocho_file
    install -D gocho "$pkgdir/usr/bin/gocho"

} 

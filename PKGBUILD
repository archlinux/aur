# Maintainer: BTD Master <btdmaster at disroot dot org>
pkgname=syphon-bin
_pkgname=syphon
pkgver=0.1.5
pkgrel=1
pkgdesc="Privacy-centric Matrix client"
arch=('x86_64')
url="https://github.com/syphon-org/syphon"
license=('AGPL')
depends=(gtk3)
provides=('syphon')
source=("https://github.com/syphon-org/syphon/releases/download/$pkgver/$_pkgname.linux.$CARCH.tar.gz")
md5sums=('35cb1e482a7c16677769ea14629ca6e2')

package() {
    install -d ${pkgdir}/opt/${_pkgname}
    install -d ${pkgdir}/usr/bin
    cp -r ${srcdir}/{data,lib,syphon} ${pkgdir}/opt/${_pkgname}
    ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/syphon 
}

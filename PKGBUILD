# Maintainer: Hyper-KVM <hyperkvmx86 at gmail dot com>
pkgname='wine-fsr-git'
pkgver='1.0'
pkgrel=1
pkgdesc="A script to provide easier use setting wine fsr options and configuration with proton/wine"
arch=('any')
url='https://github.com/Ann1kaB/wine-fsr'
license=('MIT')
provides=('wine-fsr')
source=("git+https://github.com/Ann1kaB/wine-fsr#branch=main")
sha256sums=('SKIP')

package() {
    
    cd "${srcdir}/wine-fsr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 wine-fsr "$pkgdir/usr/bin/wine-fsr"
    install -Dm644 wine-fsr.conf "$pkgdir/usr/share/wine-fsr.conf"

}

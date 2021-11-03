#Maintainer: Mirko Rovere <04mirko@libero.it>

pkgname="extrattor-git"
pkgver="beta"
pkgrel="3"
pkgdesc="extract one or more archives from the terminal"
arch=("x86_64")
url="https://github.com/Mirko-r/extrattor"
depends=('unarj' 'unace' 'p7zip' 'tar' 'pax' 'gzip' 'unzip')
license=("GPL-3.0")
conflicts=("extrattor")
source=("https://raw.githubusercontent.com/Mirko-r/extrattor/main/extrattor/extrattor.sh")
sha512sums=("SKIP")

package(){
    install -Dm0755 "${srcdir}/extrattor.sh" "${pkgdir}/usr/bin/extrattor"
}

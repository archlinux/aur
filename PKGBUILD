# Maintainer: Mirko Rovere <04mirko@libero.it>
# Contributor: koraynilay <koray.fra@gmail.com>

pkgname="extrattor-git"
pkgver="1.2.2"
pkgrel="1"
pkgdesc="A simple bash wrapper to extract one or more archives from the terminal"
arch=("x86_64")
url="https://github.com/Mirko-r/extrattor"
depends=('unarj' 'unace' 'p7zip' 'tar' 'pax' 'gzip' 'unzip')
license=("GPL-3.0")
conflicts=("extrattor")
source=("https://raw.githubusercontent.com/Mirko-r/extrattor/master/extrattor/extrattor.sh")
sha512sums=("SKIP")

package(){
    install -Dm0755 "${srcdir}/extrattor.sh" "${pkgdir}/usr/bin/extrattor"
}

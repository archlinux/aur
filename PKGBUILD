# Maintainer: Mirko Rovere <04mirko@libero.it>
# Contributor: koraynilay <koray.fra@gmail.com>

pkgname="extrattor"
pkgver="1.3"
pkgrel="3"
epoch="3"
pkgdesc="A simple bash wrapper to manage one or more archives from the terminal"
arch=("x86_64")
url="https://github.com/Mirko-r/extrattor"
depends=('unarj' 'unace' 'p7zip' 'tar' 'pax' 'gzip' 'unzip')
license=("GPL-3.0")
source=("https://raw.githubusercontent.com/Mirko-r/extrattor/043ea6fecda8c6692be6e47e36bc8762e1540689/extrattor/extrattor.sh")
sha512sums=("SKIP")

package(){
    install -Dm0755 "${srcdir}/extrattor.sh" "${pkgdir}/usr/bin/extrattor"
}

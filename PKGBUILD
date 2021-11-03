# Maintainer: Mirko Rovere <04mirko@libero.it>
pkgname="extrattor"
pkgver="2.0"
pkgrel="3"
pkgdesc="extract one or more archives from the terminal"
arch=("x86_64")
url="https://github.com/Mirko-r/extrattor"
depends=('unarj' 'unace' 'p7zip' 'tar' 'pax' 'gzip' 'unzip')
license=("GPL-3.0")
conflicts=("extrattor-git")
source=("https://raw.githubusercontent.com/Mirko-r/extrattor/fd4a213ef6da5b701729326af52608ef3ad0b94f/extrattor/extrattor.sh")
sha512sums=("SKIP")

package(){
    install -Dm0755 "${srcdir}/extrattor.sh" "${pkgdir}/usr/bin/extrattor"
}

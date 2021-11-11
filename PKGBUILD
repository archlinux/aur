# Maintainer: Mirko Rovere <04mirko@libero.it>

pkgname="baracle"
pkgver="1.0"
pkgrel="1"
pkgdesc="Let's make a text editor like in the 70's"
arch=("x86_64")
url="https://github.com/Mirko-r/baracle"
depends=('gcc')
license=("GPL-3.0")
source=("https://github.com/Mirko-r/baracle/releases/download/1.0/baracle.c")
sha512sums=("SKIP")

package(){
    gcc baracle.c -o baracle -Wall -Wextra -pedantic -std=c99
    install -Dm0755 "${srcdir}/baracle" "${pkgdir}/usr/bin/baracle"
}

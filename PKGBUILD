# Maintainer: Carson Rueter <bottomtext97@gmail.com>
pkgname='passman'
pkgver=0.6.0
pkgrel=1
pkgdesc="Super-secure, easy-to-use password manager."
arch=('any')
url="https://github.com/binex-dsk/passman-aur"
license=('GPL3')
source=("git+https://github.com/binex-dsk/passman-aur.git")
md5sums=('SKIP')

package() { 
        install -Dm755 "${srcdir}/passman-aur/passman" "${pkgdir}/usr/bin/passman"
}

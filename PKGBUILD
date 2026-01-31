pkgname=rooks-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='State-of-the-art adaptive steganography toolkit'
url='https://gitlab.com/harrose/rooks'
source=("rooks::https://gitlab.com/harrose/rooks/-/package_files/265705041/download")
arch=('x86_64')
license=('MIT')
sha256sums=('39d5ab92416826572fa4c387fbf568127354267818b30f2c62fc342e8e91ca56')

options=(!debug)

package() {
    install -Dm755 "$srcdir/rooks" "$pkgdir/usr/bin/rooks"
}

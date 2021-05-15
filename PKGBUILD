# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=gitwrk-bin
_pkgname=gitwrk
pkgver=1.0.11
pkgrel=1
arch=('x86_64')
url="https://github.com/unravela/gitwrk"
license=("Apache")

pkgdesc='Command line interface to manage clipboard'

source_x86_64=("https://github.com/unravela/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha512sums_x86_64=('d7195b1109e81c510daa5812497db790388d95db6ed124c6cb6c55cd8d4aec39cc538d1de83ab1ee0625560ab357e8176bc5c06156fe3c8b45b268f2c2a7b837')


conflicts=('gitwrk-git')
provides=('gitwrk')

package() {
    install -Dm755 "$srcdir/gitwrk" "$pkgdir/usr/bin/gitwrk"
}

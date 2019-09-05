# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=saw-script

pkgver=0.3
pkgrel=1
pkgdesc="The SAW scripting language."
url="http://saw.galois.com/"
arch=('x86_64')
license=('noncommercial')
depends=('cvc4' 'java-environment')
makedepends=()
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('')
provides=('saw-script')
sha512sums=(83f457f9e5b8fe7de01734b334ce45a97068a71c6884de750cc7c37a90c061c0cf53ef4b590aa4611f610312bf6f71d1b93f23e377f57b85c3a06c5fddc9e5be)

source=('https://github.com/GaloisInc/saw-script/releases/download/v0.3/saw-0.3-Ubuntu14.04-64.tar.gz')

package() {
    cd "$srcdir/saw-0.3-Ubuntu14.04-64"
    mkdir -p "$pkgdir/usr/bin"
    cp bin/* "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

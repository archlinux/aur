# First Linux Arch packager: Serge Victor <arch@random.re>

# TODO: compile fasm with itself

pkgname=fasm
pkgver=1.71.39
pkgrel=1
pkgdesc="Fast and efficient self-assembling x86 assembler for DOS, Windows and Linux operating systems"
arch=('x86_64')
url="http://www.flatassembler.net/"
license=('custom')
source=(http://www.flatassembler.net/$pkgname-$pkgver.tgz)
md5sums=(''22a100b479e350efc8a8c2d814c1ee67)

package() {
    cd "$srcdir/$pkgname"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/fasm
    install -m755 fasm $pkgdir/usr/bin
    install -m644 license.txt $pkgdir/usr/share/licenses/fasm/LICENSE
}

# vim:set ts=2 sw=2 et:

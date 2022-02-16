# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=flyingcarpet-cli
pkgver=4.1
pkgrel=1
pkgdesc="Wireless, encrypted file transfer over automatically configured ad hoc networking"
arch=(x86_64)
url="https://github.com/spieglt/FlyingCarpet"
license=('BSD')
source=("$url/releases/download/v$pkgver/flyingCarpetLinuxCLI")
noextract=("flyingCarpetLinuxCLI")
md5sums=('7433b0a5ae2fb405791b4532c7bee178')

package() {
    install -Dm 0755 $srcdir/flyingCarpetLinuxCLI $pkgdir/usr/bin/$pkgname
}

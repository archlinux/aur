# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=saw-script

pkgver=0.2
pkgrel=1
pkgdesc="The SAW scripting language."
url="http://saw.galois.com/"
arch=('x86_64')
license=('noncommercial')
depends=('cvc4' 'libtinfo' 'java-environment')
makedepends=()
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('')
provides=('saw-script')
sha512sums=('097e1a9468cc76d3ec31598d9ad120b3d3d49f55ef1399f981eb60b0ccb5283996dfb3e9f41ed209cb11496c7c096b45f774ad84d44592454e23628847742e38')

source=('https://github.com/GaloisInc/saw-script/releases/download/v0.2/saw-0.2-2016-04-12-Ubuntu14.04-64.tar.gz')

package() {
    cd "$srcdir/saw-0.2-2016-04-12-Ubuntu14.04-64"
    mkdir -p "$pkgdir/usr/bin"
    cp bin/* "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

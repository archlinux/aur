pkgname=toshiba-e2555c
pkgver=7.31
pkgrel=1
pkgdesc="Toshiba e-STUDIO255C Driver"
arch=('x86_64' 'i686')
source=('https://electronicimaging.toshiba-europe.com/publicsite-service/resource/download/pseu/en/a63be5b1-3aff-4c35-870c-11bf8e805ee8/a030a311d0f26633f63aa3c64f84b28e/TOSHIBA_e-STUDIO_CUPS_7.31.zip')
makedepends=('unzip')
md5sums=('a030a311d0f26633f63aa3c64f84b28e')

build() {
    cd ${srcdir}/
    tar -xf TOSHIBA_e-STUDIO_CUPS_7.31/CUPS/Colour/normal/TOSHIBA_ColorMFP_CUPS.tar
}

package() {
    cd ${srcdir}
    cp -rv "$srcdir/usr" "$pkgdir"
}

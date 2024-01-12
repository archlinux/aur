# Maintainer: Diego Souza <diegosouza.br@gmail.com>
pkgname=hurl-bin
_pkgname=hurl
pkgver=4.2.0
pkgrel=1
pkgdesc="Hurl, run and test HTTP requests"
arch=('x86_64' 'aarch64')
url="https://github.com/Orange-OpenSource/hurl"
license=('Apache')
source_x86_64=("https://github.com/Orange-OpenSource/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fc9789905947c3960b273fb6b8b3548fd35761d9bfcc598feeb3dc5aece625cc')
source_aarch64=("https://github.com/Orange-OpenSource/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('eed245dcd9e33db9331531b7de58e2c3749e74e49e1b34c789108eaf497bb0ed')


package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/man/man1

    cp $srcdir/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/{hurl,hurlfmt} $pkgdir/usr/bin/
    cp $srcdir/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/{hurl,hurlfmt}.1.gz $pkgdir/usr/share/man/man1/
}



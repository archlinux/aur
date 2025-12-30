# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=subrandr
pkgver=1.0.1
pkgrel=1
pkgdesc="A subtitle rendering library which aims to render SRV3 (YouTube) subtitles and WebVTT subtitles accurately"
arch=('x86_64')
url="https://repo.archlinuxcn.org"
license=('GPL')
source=("https://repo.archlinuxcn.org/x86_64/subrandr-1.0.1-1-x86_64.pkg.tar.zst")
provides=('subrandr')
b2sums=('2c4b328a6cc123d53c63f8bf38c635814f198b599b4fc18059eadd88b153acf31e54ec66b69c8728caa68e8558b904c0415304dc9059b4bfd3a236f28222644d')

package() {
    mkdir -p "$pkgdir"
    cp "$srcdir/$(basename $source)" "$pkgdir/"
}

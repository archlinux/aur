# Maintainer: Diego Souza <diegosouza.br@gmail.com>
pkgname=hurl-bin
_pkgname=hurl
pkgver=4.1.0
pkgrel=1
pkgdesc="Hurl, run and test HTTP requests"
arch=('x86_64' 'aarch64')
url="https://github.com/Orange-OpenSource/hurl"
license=('Apache')
source_x86_64=("https://github.com/Orange-OpenSource/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9528379f817d118c933afb555d62dd83994503235a0a14fda2dfa5995628ded0')
source_aarch64=("https://github.com/Orange-OpenSource/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('b7fc296aaa0963cb74c6fa871e9dc19cac7dfffdd0c4950bacaad7c8bc4819b2')


package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/man/man1

    cp $srcdir/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/{hurl,hurlfmt} $pkgdir/usr/bin/
    cp $srcdir/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/{hurl,hurlfmt}.1.gz $pkgdir/usr/share/man/man1/
}



# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgbase=skycoin-keyring
pkgname=("$pkgbase")
pkgdesc="Skycoin archlinux packages keyring"
pkgver=20200220
pkgrel=1
arch=('any')
url="https://github.com/0pcom/PKGBUILDs"
source=("skycoin-keyring.install"
        "skycoin-keyring.gpg")

sha256sums=('9880980b6668c9e85612c8c350ec10927a9f3d2c994623b84ae99c4a74887028'
            'dc9e87ebf2fbecc2836c0ef54b32affffacd0940aeb8a475bc3286098f0155f1')

install=$pkgbase.install

package() {
    mkdir -p ${pkgdir}/$destdir
    cd ..
    cp skycoin-keyring.gpg ${pkgdir}/$destdir
    install -dm 755 "${pkgdir}/$destdir"

}

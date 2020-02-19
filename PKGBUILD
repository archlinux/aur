# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgbase=skycoin-keyring
pkgname=("$pkgbase")
pkgdesc="Skycoin archlinux packages keyring"
pkgver=20200220
pkgrel=2
arch=('any')
url="https://github.com/0pcom/PKGBUILDs"
source=("skycoin-keyring.install"
        "skycoin-keyring.gpg"
        "skycoin-trusted")
sha256sums=('e63b689c0c7a183ef55d155d2d51e9796ab107e807e71139650a377fa1d32db7'
            'dc9e87ebf2fbecc2836c0ef54b32affffacd0940aeb8a475bc3286098f0155f1'
            '77c8eb384324ed90a5a565c7d38b6e5e700039d7563813c59c500c23c45235e0')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
                           '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>


destdir=/usr/share/pacman/keyrings
install=$pkgbase.install

package() {
    mkdir -p ${pkgdir}/$destdir
    cd ..
    cp skycoin-keyring.gpg ${pkgdir}/$destdir
    cp skycoin-trusted ${pkgdir}/$destdir
    install -dm 755 "${pkgdir}/$destdir"

}

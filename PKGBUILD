# Contributor: FrancyAngy <francy.angy009@gmail.com>
# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
# Maintainer: FrancyAngy <francesco@scsdc-co.org>
pkgname=dinfo
pkgver=1.2.2.005
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml, .json and html output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained")
sha256sums=('d78541976cb45345c2446e7539edacacb57005a90df15090d974b8e98bd2751f')

package() {
    mkdir -p "$pkgdir/usr/lib/dinfo"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/../dinfo-linux-x64-self-contained" "$pkgdir/usr/lib/dinfo/"
    ln -s /usr/lib/dinfo/dinfo-linux-x64-self-contained "$pkgdir/usr/bin/dinfo"
}

# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
pkgname=dinfo
pkgver=1.2.2.003
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml, .json and html output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained")
sha256sums=('597813826c0ea03da344de7378103425589862eabb860d95a2cff71c507d7f84')

package() {
    mkdir -p "$pkgdir/usr/lib/dinfo"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/*" "$pkgdir/usr/lib/dinfo/"
    ln -s /usr/lib/dinfo/dinfo-linux-x64-self-contained "$pkgdir/usr/bin/dinfo"
}

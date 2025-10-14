# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
# Maintainer: FrancyAngy <francesco@scsdc-co.org>
pkgname=dinfo
pkgver=1.2.3
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml, .json and html output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained")
sha256sums=('f60a933d42e82b9f9e3d8fb290c15f1c69d4cc0dd75f0ea5d91a58372f96848d')

package() {
    install -dm755 "$pkgdir/usr/lib/dinfo"
    install -Dm755 "$srcdir/../dinfo-linux-x64-self-contained" "$pkgdir/usr/lib/dinfo/dinfo"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "$pkgdir/usr/lib/dinfo/dinfo" "$pkgdir/usr/bin/dinfo"
}

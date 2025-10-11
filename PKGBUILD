# Contributor: FrancyAngy <francy.angy009@gmail.com>
# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
# Maintainer: FrancyAngy <francesco@scsdc-co.org>
pkgname=dinfo
pkgver=1.2.2.006
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml, .json and html output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained")
sha256sums=('62e3917c7b40be5af777dbbe2c4f21b9431e7ced9effdb8f997ed7f2d4ba1e01')

package() {
    install -dm755 "$pkgdir/usr/lib/dinfo"
    install -Dm755 "$srcdir/../dinfo-linux-x64-self-contained" "$pkgdir/usr/lib/dinfo/dinfo"

    ln -sf /usr/lib/dinfo/dinfo "$pkgdir/usr/bin/dinfo"
}

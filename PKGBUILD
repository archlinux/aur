# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=rg2sc
pkgver=2.0
pkgrel=1
pkgdesc='Converts ReplayGain ID3 tags to Apple Sound Check tags'
url='https://github.com/rwinkhart/rg2sc'
arch=('any')
license=('GPL2')
depends=(python python-mutagen)

source=("https://github.com/rwinkhart/rg2sc/releases/download/v$pkgver/rg2sc-$pkgver.tar.xz")
sha512sums=('14a5b536b2a340204034ffb89ca637e3ad3b1ab205f95cd51e5d56514635c16c5d47f6c96e670d235fc4735ec9b80c36646e06c4d05ba3bb50b09b265e59cad6')

package() {

    tar xf rg2sc-"$pkgver".tar.xz -C "${pkgdir}"

}


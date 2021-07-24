#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=samclip
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
url='https://github.com/tseemann/samclip'
pkgdesc='Filter SAM file for soft and hard clipped alignments'
license=('GPL3')
depends=('perl')
provides=('samclip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d789d8f88494a37ef42f8beb8e20e40438a5bcdf11c3809ca1d339e3c91fab689d996f40e1dcb5a29d8f82ce6a430e7ef634d0f24bc25a2ee371b7014d3952c3')

package() {
    cd $srcdir/$pkgname-$pkgver || exit

    install -Dm755 -t "$pkgdir/usr/bin" $pkgname
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

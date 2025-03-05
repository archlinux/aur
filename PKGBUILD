# Maintainer: Médéric Boquien <mboquien@free.fr>
# Original contributor: José San Juan <josesj@gmail.com>
pkgname=qfitsview
pkgver=4.2
pkgrel=1
pkgdesc="FITS file viewer based on DPUSER"
url="http://www.mpe.mpg.de/~ott/QFitsView/index.html"
license=("GPL2+")
arch=("x86_64")
source=("http://www.mpe.mpg.de/~ott/QFitsView/download/QFitsView_${pkgver}"
        'qfitsview.png'
        'QFitsView.desktop'
)
sha512sums=('88e0cd6f79a2f5d4ebc91dead0125f66cb77596caf01e46aa5f981ee60b9a61ebcb7029ec2a5c4af0c4155943f267efd7d9b488f7a7c4c9b9825d1115a6f44d9'
            '8c3a6d73865234d49574e4a60ffb35f30be1e2f1c6f56d5f3c48ec3489720a333a3ef133eb1043f48ef1760033d17abcce61849c0d82deff8ba0c27fc6a1bd6b'
            '4f712a90e5923bb24ad30a868e96100f58089b19da4893e1f9c1a5003f01e32797c220c80c7269dcafc13d109d43b44f5047b95fb25a58e3bf46d54714961de1')

package() {
  install -Dm755 "QFitsView_${pkgver}" "$pkgdir/usr/bin/QFitsView"
  install -Dm644 QFitsView.desktop "$pkgdir/usr/share/applications/QFitsView.desktop"
  install -Dm644 qfitsview.png "$pkgdir/usr/share/pixmaps/qfitsview.png"
}

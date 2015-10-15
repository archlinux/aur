# Maintainer: Markus Plangg <mksplg at gmail.com>
pkgname=docker-squash
pkgver=0.1.0
pkgrel=1
pkgdesc="Squash docker images to make them smaller"
arch=('x86_64')
url="https://github.com/jwilder/docker-squash"
license=('MIT')
provides=('docker-squash')
conflicts=('docker-squash')
source=("https://github.com/jwilder/docker-squash/releases/download/v$pkgver/docker-squash-linux-amd64-v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/jwilder/docker-squash/v$pkgver/LICENSE")
md5sums=('a2992d7660bd7205daaac3c57275e80b'
         'b9a1706302da7a4fa063eaaf7baf846b')
sha256sums=('ae046cd4e6ef3c16f3e8a12b22daaa8c444860e2254a540202f008eab2210265'
            '65fabd41da53d67cbbfad5dd2006054024d649d2179f5bc60c807342fe235065')

package() {
  install -D -m755 "$srcdir"/docker-squash "$pkgdir/usr/bin/docker-squash"
  install -D -m644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/docker-squash/LICENSE"
}

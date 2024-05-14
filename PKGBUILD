# Maintainer: Microeinstein <mu ddoott emc2 ddoott flower at inventati ddoott org>
# Contributor: Ivy Foster <iff@archlinux.org>
# Reference: PKGBUILD(5)

_pkgname=inter-font
pkgname="${_pkgname}-otf"
pkgver=4.0
pkgrel=1
pkgdesc="A typeface specially designed for user interfaces (Desktop OTF version)"
url="https://github.com/rsms/inter"
license=(custom:OFL)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=(any)
source=("$url/releases/download/v$pkgver/Inter-$pkgver.zip")

# Warning: checksums provided by packager, not upstream
sha256sums=('ff970a5d4561a04f102a7cb781adbd6ac4e9b6c460914c7a101f15acb7f7d1a4')
b2sums=('ace3b847e5354642623868441b433a9a4e57e6a78fa56bd4e7ee28d01399b000f81abb5a3cab9fb8e89588980b2ca81f41de4673609fd5626781d7bc139834be')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/inter" 'extras/otf/'*
    install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE.txt
}

# Maintainer: Dario Vladovic <d.vladimyr@gmail.com>
pkgname=deta-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.0_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Command line interface for managing Deta micros and deployments"
arch=(x86_64 aarch64)
url="https://github.com/deta/deta-cli"
license=('unknown')
provides=('deta')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$_pkgver/$_pkgname-x86_64-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$_pkgver/$_pkgname-arm64-linux.zip")
sha512sums_x86_64=('908d08f40468992d116ead24e403a6babd0f918936667ebb526c54e54fd399d6599696ccbf603b01235013225bd3be986317d2ce08bc8c1a92077eac5772380d')
sha512sums_aarch64=('3fe36ae5c37a1c32b32596ddcb2d55c5f810af9f31e4f461712ee60060ca2038ac39ca11802159dd09fce726ee636c72e630cf04d783e6da62c1af8ca77ae903')

package() {
  install -Dm755 "$srcdir/deta" "$pkgdir/usr/bin/deta"
}

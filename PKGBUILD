# Maintainer: Dario Vladovic <d.vladimyr at gmail dot com>
pkgname=deta-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.0_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Command line interface for managing Deta micros and deployments"
arch=(x86_64 aarch64)
url="https://github.com/deta/deta-cli"
license=('unknown')
provides=("$_pkgname" 'deta')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$_pkgver/$_pkgname-x86_64-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$_pkgver/$_pkgname-arm64-linux.zip")
sha256sums_x86_64=('6b81ebad24d7356c3c9572ebecd9eaf69c3eacce04bff83cd54297c9d0f17f8a')
sha256sums_aarch64=('71802fe33c9e4601de8bfbf57eb86ce22e0d1351d5d2a1823120b32313a7fcac')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

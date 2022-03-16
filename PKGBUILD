# Maintainer: Dario Vladovic <d.vladimyr@gmail.com>
pkgname=deta-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.2_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Command line interface for managing Deta micros and deployments"
arch=(x86_64 aarch64)
url="https://github.com/deta/deta-cli"
license=('unknown')
provides=('deta')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$_pkgver/$_pkgname-x86_64-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$_pkgver/$_pkgname-arm64-linux.zip")
sha512sums_x86_64=('d5af5868e7454980a096df612d80190d3cbbd93e0bd741fc8fc344f6888aa277126190ac51ca3d987bf78f1029ca9ea345c506c571ffc71b08781713709c7da8')
sha512sums_aarch64=('cf1bca448b44acdc11b4c243c4dd909b7223f55512614df852fc427eb40db30f14e27421126ca943bf57dea1db896d974014da5632a8fd8fe6aa7695874d59af')

package() {
  install -Dm755 "$srcdir/deta" "$pkgdir/usr/bin/deta"
}

# Maintainer: Dario Vladovic <d.vladimyr@gmail.com>
pkgname=deta-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.3_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Command line interface for managing Deta micros and deployments"
arch=(x86_64 aarch64)
url="https://github.com/deta/deta-cli"
license=('unknown')
provides=('deta')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$_pkgver/$_pkgname-x86_64-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$_pkgver/$_pkgname-arm64-linux.zip")
sha512sums_x86_64=('9be8b52ca8e02f92fa3c4fe240209ea9b3a8d231972a5012250f0dccfa4c7b69bbd4ffd41e3b1c1d059154a30415e6fe6793278790fcb9898296e934876b4498')
sha512sums_aarch64=('84b42412d6e8e7afaa66055d84e30210499d7a9a267f127f2874e1960de86a045c437749355e0b61dd308fb732a2ca1ca20314b461c2ee002dcde12394ca4b05')

package() {
  install -Dm755 "$srcdir/deta" "$pkgdir/usr/bin/deta"
}

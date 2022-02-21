# Maintainer: Dario Vladovic <d.vladimyr@gmail.com>
pkgname=deta-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.1_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Command line interface for managing Deta micros and deployments"
arch=(x86_64 aarch64)
url="https://github.com/deta/deta-cli"
license=('unknown')
provides=('deta')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::$url/releases/download/v$_pkgver/$_pkgname-x86_64-linux.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::$url/releases/download/v$_pkgver/$_pkgname-arm64-linux.zip")
sha512sums_x86_64=('396a3c31e460accb75edd2bfb7b2ba6f99c29cdfba9a598b18c96bbb40ae15fde5149a7f47666c6cfa696a8595130abc637e284e04fd60a5adce5949dfb3c329')
sha512sums_aarch64=('b1fd3ac13e5711728c5e4737c865637b25521342a0711c612a2a604c576f3f4c4ff5232b64bed33ff0df5d7af11ef4067462f3fcff94df14d69dd1dcac4bbe95')

package() {
  install -Dm755 "$srcdir/deta" "$pkgdir/usr/bin/deta"
}

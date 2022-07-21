# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.4.9
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider. (Pre-compiled)'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/zu1k/nali"
license=('MIT')
provides=('nali')
conflicts=('nali')

source_i686=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-386-v$pkgver.gz")
source_x86_64=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-amd64-v$pkgver.gz")
source_aarch64=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv8-v$pkgver.gz")
source_armv6h=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv6-v$pkgver.gz")
source_armv7h=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv7-v$pkgver.gz")
source_arm=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv5-v$pkgver.gz")

sha256sums_i686=('996c349dc7122bb84eea354fe01ad98d3db8a83e9e7365780544c7221834339c')
sha256sums_x86_64=('fb291272d0820300d944b51eb5e3544222f247020e2428659fd0983ca91e108d')
sha256sums_arm=('7d45fed8b2ce2d8e846e93fc990b9ec8fe373fda06db08bb642672343d2530c0')
sha256sums_armv7h=('e42bf0cfc77c6296b89169931754ba703f6b49cf7256de644e878dd299b2517a')
sha256sums_armv6h=('92e19f71fb0a039d28797eb95765b531fd7e199c2e3e5202c841ae312fd2700d')
sha256sums_aarch64=('02c2aae62e37e2fdce3bf0da797a232d2a52d7dff9c76eb3b4f064e45b880802')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}

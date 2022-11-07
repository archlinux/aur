# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=yajsv-bin
_pkgname=yajsv
pkgver=1.4.1
pkgrel=1
pkgdesc="Yet Another CLI JSON Schema Validator"
arch=('x86_64' 'i686')
url="https://github.com/neilpa/yajsv"
license=('MIT')
depends=('glibc')
provides=('yajsv')
conflicts=('yajsv')

source=("$pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/neilpa/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver.$_pkgname::$url/releases/download/v$pkgver/$_pkgname.linux.amd64")
source_i686=("$pkgname-$pkgver.$_pkgname::$url/releases/download/v$pkgver/$_pkgname.linux.386")
noextract=("$pkgname-$pkgver.LICENSE" "$pkgname-$pkgver.$_pkgname")
sha256sums=('d86d0f8389878e39031cf699fda3302980a476adcfdbbdb92424ebb1654f0127')
sha256sums_x86_64=('4bd6d2b1d6292ab1f7ba63db83c182a603a790d431429cf71f05cb0fcc677def')
sha256sums_i686=('82743008f4bc2f27db6429cc9615b97718f1fcb979399c32c5e3ce31e4be87c2')

package() {
  install -Dm755 "$pkgname-$pkgver.$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$pkgname-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

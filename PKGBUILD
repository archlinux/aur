# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=stumpwm-acpi-backlight
_pkgname=${pkgname#stumpwm-}
pkgver=0.1.0
pkgrel=1
pkgdesc='ACPI backlight control module for StumpWM'
arch=('any')
url='https://github.com/Junker/stumpwm-acpi-backlight'
license=('GPL-3.0-only')
depends=('stumpwm')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0d60cd32046e3eb427ca9ab2c7891afb8b1853b73d7299e49e62eae038aad964')

package(){
  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/stumpwm/contrib/$_pkgname" *.{lisp,asd}
}

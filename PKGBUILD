# Maintainer: Zitro <u4595650016@protonmail.com>

pkgname=foobar2000-component-dynamic-range-bin
pkgver=1.1.1
pkgrel=1
_fooname="foo_dynamic_range"
pkgdesc="A dynamic range component for foobar2000"
arch=("any")
url="https://wiki.hydrogenaud.io/index.php?title=Foobar2000:Components/Dynamic_Range_Meter_(foo_dynamic_range)"
license=("unknown")
depends=("foobar2000>=1.0.0")
source=("https://dr.loudness-war.info/downloads/foo_dynamic_range_1.1.1.zip")
sha256sums=("d34f3c2bd4317b1bcdca9110cfc7d015c7eec8a5c7e978d1256fcfdd7244945a")

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

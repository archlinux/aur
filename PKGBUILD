# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=3.3.3
pkgrel=4
arch=(any)
pkgdesc='Examples for Processing'
url='https://www.processing.org/'
license=(GPL LGPL)
makedepends=(git)
source=("git+https://github.com/processing/processing-docs#commit=f6ecf823ec2a72a724ed0918538e358fec50c60a")
b2sums=(SKIP)

package() {
  install -d "$pkgdir/usr/share/processing/modes/java"
  cp -r processing-docs/content/examples/ "$pkgdir/usr/share/processing/modes/java/"
}

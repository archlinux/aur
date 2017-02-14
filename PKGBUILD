pkgname=xed-intel
pkgver=20160202
pkgrel=2
pkgdesc="Software library for encoding and decoding X86 instructions."
url="https://software.intel.com/en-us/articles/xed-x86-encoder-decoder-software-library"
arch=('x86_64' 'i686')
license=('What If Pre-Release License Agreement')
depends=('')
makedepends=('')
source=("https://software.intel.com/system/files/managed/c2/2a/xed-install-base-2016-02-02-lin-x86-64.zip")
sha256sums=('336920f08d2602dee8f076a095ec597f393f76a3cb6322a410be09ec4408caf1')

# NOTE: To download xed-install-base-<DATE>-lin-x86_64.zip, you must accept the
# license agreement at:
#
#    https://software.intel.com/en-us/articles/xed-x86-encoder-decoder-software-library

package() {
  cd "$srcdir/kits/xed-install-base-2016-02-02-lin-x86-64"
  mkdir -p "$pkgdir/usr"
  cp -r include "$pkgdir/usr/"
  chmod 0644 $pkgdir/usr/include/*
  cp -r lib "$pkgdir/usr/"
  chmod 0755 $pkgdir/usr/lib/*
}

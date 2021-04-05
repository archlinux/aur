# Maintainer: lmartinez-mirror
pkgname=frangipanni-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.1
pkgrel=1
pkgdesc="Program to convert lines of text into a tree structure"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/birchb1024/frangipanni"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tgz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_386.tgz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tgz")
source=("https://raw.githubusercontent.com/birchb1024/frangipanni/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/birchb1024/frangipanni/v$pkgver/README.md")
sha256sums=('3cef0d7345e2a2f9205ad48191decfb293d2f72fa3fdcd6794f32868f9863bf7'
            'f9122312556da81bfd3cc0bff13d6a0093b02dbdbe563b8fc13e3a25b68a531c')
sha256sums_x86_64=('d5b2b27d2962c0feea83dc3b8f9cfef3d8bd73c7ea41b12f6d7b649e2bca5989')
sha256sums_i686=('888f29cad305a453edcac6a906f228b80883b3110301a165227c3ffd8a266035')
sha256sums_aarch64=('8b33ec6b54baef67aa88f7cacc7ee0c869cc74cbd1fb6c89cb12a8aefef8e5a0')

package() {
  install -Dm 755 frangipanni_linux_* "$pkgdir/usr/bin/frangipanni"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}


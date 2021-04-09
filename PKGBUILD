# Maintainer: lmartinez-mirror
pkgname=frangipanni-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.2
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
            '996d1bfa83a9860508f410d11ad8288fc83c613a200e4bd8571394d69d2db70f')
sha256sums_x86_64=('be99d7656ff3c3e1fd97169ddf8e5903646ba380e5cbd51bc6c53e1ab0741d64')
sha256sums_i686=('a71962ec99ae670653d6dbdb03118675ee018477fd7f787b4c2ec69f0cd1a2eb')
sha256sums_aarch64=('589f2e294c73f2fbda0764ae7104b31b0c92739f0345cb1daaed70cd08a5caa1')

package() {
  install -Dm 755 frangipanni_linux_* "$pkgdir/usr/bin/frangipanni"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}


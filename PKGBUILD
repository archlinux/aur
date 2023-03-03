# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.1.3
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/sjlleo/nexttrace'
license=('GPL3')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/nexttrace_linux_amd64")
sha256sums=('99a5cf197ddf62934c2929c64bdf93a460e6e8491881ecd4ec3e089ca8ecf3af')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

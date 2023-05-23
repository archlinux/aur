# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.1.4
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/sjlleo/nexttrace'
license=('GPL3')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/nexttrace_linux_amd64")
sha256sums=('24c0074c132638bc5c1b790531d079da9b7ec11a4bddb14044c037644b502b70')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

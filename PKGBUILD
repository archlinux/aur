# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.1.2
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/sjlleo/nexttrace'
license=('GPL3')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/nexttrace_linux_amd64")
sha256sums=('e2fd40350175da1f60f71d1fddbc823a6ec174db8d4a8d7b817080e7b5375b32')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

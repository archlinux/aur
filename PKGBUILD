# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.1.5
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/sjlleo/nexttrace'
license=('GPL3')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/nexttrace_linux_amd64")
sha256sums=('112f005318acffee9a2913aaa002f6ef16f01cfad5b88c18e5099c17fd47affa')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

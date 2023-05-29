# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.1.6
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/sjlleo/nexttrace'
license=('GPL3')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/nexttrace_linux_amd64")
sha256sums=('a7cb124006cade8c3e1bc13539e391319035fe101ffb9a1304f4b0268cb3c915')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.7.4
_tag=v$pkgver
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/nxtrace/NTrace-core'
license=('GPL-3.0-only')
install=nexttrace.install
source=("$pkgname-$pkgver::$url/releases/download/$_tag/nexttrace_linux_amd64")
sha256sums=('25100992ad8924d6bfc7724eb6cc98547d87ec13828aa9b354516687331e170c')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

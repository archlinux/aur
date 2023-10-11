# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.2.2.1
_tag=v$pkgver
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/nxtrace/Ntrace-V1'
license=('GPL3')
source=("$pkgname-$pkgver::$url/releases/download/$_tag/nexttrace_linux_amd64")
sha256sums=('43b0e76973ceaa656bba1cc7770abe285b613b0e566e0e309fc39a6e187affeb')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

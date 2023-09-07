# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.2.1.1
_tag=v$pkgver
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/nxtrace/Ntrace-V1'
license=('GPL3')
source=("$pkgname-$pkgver::$url/releases/download/$_tag/nexttrace_linux_amd64")
sha256sums=('d86bfc2293b643a564c30726db16df8922e174d8286312d5ec97b3a1033f7c87')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

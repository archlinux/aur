# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.2.0.3
_tag=v$pkgver
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/nxtrace/Ntrace-V1'
license=('GPL3')
source=("$pkgname-$pkgver::$url/releases/download/$_tag/nexttrace_linux_amd64")
sha256sums=('69f36119603fb288d0bfaa94100d78dffb1124d631226b0182c7c11de7c5f96b')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}

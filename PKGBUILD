# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=kubewrap-release
pkgver=0.1.0
pkgrel=1
pkgdesc="Wrap kubectl command, offers some useful tools"
arch=('x86_64')
url="https://github.com/fioncat/kubewrap"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/kubewrap/releases/download/v${pkgver}/kubewrap-linux-amd64.tar.gz")
sha256sums=('9ca4ae29cccb035a866bbe23294d69177da9a5bbcc4a69a197a7304739d0d087')

options=('!strip' '!debug')

package() {
    install -Dm755 "kubewrap" "$pkgdir/usr/bin/kubewrap"
}

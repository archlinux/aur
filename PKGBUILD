# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=mpls-bin
pkgver=0.15.4
pkgrel=1
pkgdesc="Markdown Preview Language Server"
provides=('mpls')
conflicts=('mpls')
arch=('x86_64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mhersson/mpls/releases/download/v${pkgver}/mpls_${pkgver}_linux_amd64.tar.gz")
sha256sums=('10e6c83b8698248f45a99abefa2df476b50076212a199f89d6a71f3cc1c1fa6b')

package() {
    install -Dm 755 "$srcdir/mpls" "$pkgdir/usr/bin/mpls"
}

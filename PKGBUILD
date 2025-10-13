# Maintainer: Volodymyr Zahorniak <v.zahorniak@gmail.com>
pkgname=hcledit-bin
pkgbase=hcledit-bin
pkgver=0.2.17
pkgrel=1
pkgdesc='A command line editor for HCL'
arch=('x86_64')
url='https://github.com/minamijoyo/hcledit'
license=('MIT')
depends=()
source=(
    "https://github.com/minamijoyo/hcledit/releases/download/v${pkgver}/hcledit_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('5e085bd319c84c74e87b915ab2c1f95afccb2d4326be481fbe19c1d7a0eb5fee')
replaces=('hcledit')

package() {
    install -D -g root -m 0755 -o root "$srcdir/hcledit" "$pkgdir/usr/bin/hcledit"
}

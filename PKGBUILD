# Maintainer: Volodymyr Zahorniak <v.zahorniak@gmail.com>
pkgname=hcledit-bin
pkgbase=hcledit-bin
pkgver=0.2.18
pkgrel=1
pkgdesc='A command line editor for HCL'
arch=('x86_64')
url='https://github.com/minamijoyo/hcledit'
license=('MIT')
depends=()
source=(
    "https://github.com/minamijoyo/hcledit/releases/download/v${pkgver}/hcledit_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('5974db4486a7e7ecbcbce8b96cb77051419575858d0fc97d73af536b18baabe7')
replaces=('hcledit')

package() {
    install -D -g root -m 0755 -o root "$srcdir/hcledit" "$pkgdir/usr/bin/hcledit"
}

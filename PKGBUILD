# Maintainer: Volodymyr Zahorniak <v.zahorniak@gmail.com>
pkgname=hcledit-bin
pkgbase=hcledit-bin
pkgver=0.2.19
pkgrel=1
pkgdesc='A command line editor for HCL'
arch=('x86_64')
url='https://github.com/minamijoyo/hcledit'
license=('MIT')
depends=()
source=(
    "https://github.com/minamijoyo/hcledit/releases/download/v${pkgver}/hcledit_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('f95214bae776e9b6bb1406189e438aaa592332e8bb10640099b6fee80b7930a2')
replaces=('hcledit')

package() {
    install -D -g root -m 0755 -o root "$srcdir/hcledit" "$pkgdir/usr/bin/hcledit"
}

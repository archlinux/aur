# Maintainer: Darko Mesaros<d at rko dot rs>
pkgname=bedrust
pkgver=0.7.4
pkgrel=1
pkgdesc="A command line tool to invoke and work with Large Language models on AWS, using Amazon Bedrock"
arch=("x86_64")
url="https://github.com/darko-mesaros/bedrust"
license=('MIT')
provides=("bedrust")
source=("https://github.com/darko-mesaros/bedrust/releases/download/v$pkgver/bedrust-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2becd57f00ee9f15fbc333551bccda180df7d6ef158571af35280b3b12c90ff8')
options=(!lto !debug)

package() {
    install -Dm755 "$srcdir/bedrust" "$pkgdir/usr/bin/bedrust"
}

#Maintainer: Thomas R Waller <thomas.r.waller@gmail.com>

_pkgname=stax2aws
pkgname=$_pkgname-git-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="stax2aws is a CLI tool that enables you to log in and retrieve temporary credentials granting access to your Stax-managed AWS accounts."
url="https://github.com/stax-labs/stax2aws-releases"
arch=('x86_64')
license=('UNLICENSED')

source=("https://github.com/stax-labs/stax2aws-releases/releases/download/v${pkgver}/stax2aws_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f7700e6bfdab3c1f985710b15ef4212e2448d7fd0105509213f5e9822a4207a2')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "stax2aws_${pkgver}_linux_amd64/stax2aws" "$pkgdir/usr/bin/stax2aws"
}

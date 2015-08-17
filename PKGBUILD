# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

# http://dl.bintray.com/mitchellh/terraform/terraform_0.6.3_SHA256SUMS
source_i686=("https://dl.bintray.com/mitchellh/terraform/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/terraform/terraform_${pkgver}_linux_amd64.zip")
sha256sums_i686=('32db19ec45c46b5ab7894c75062fe163b4c9003945ee234979e5f4c8db448923')
sha256sums_x86_64=('0160fcdb7f0d00948d52912df0626a2e49db958b6df2c6108cbd8b3527ce1144')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
}

# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.8
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

# http://dl.bintray.com/mitchellh/terraform/terraform_0.6.6_SHA256SUMS
source_i686=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_amd64.zip")
sha256sums_i686=('5260aba337b536e2dbee57f7df02b4b41dc3cb4610d8603590ae2d6ae5eec59b')
sha256sums_x86_64=('fd61718820c3f2334276517a89694cebe82db354b584ea90c376f1c6d34bb92d')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
}

# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.10
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

# http://dl.bintray.com/mitchellh/terraform/terraform_0.6.6_SHA256SUMS
source_i686=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_amd64.zip")
sha256sums_i686=('a39f4d835bd1d1ec8a3dc3156699381b1e4b57c6e428921783d7587eeed36223')
sha256sums_x86_64=('d7c07e2bf587257673bae710c776430a8cc5a755a9ad4a2cbae066d0cd02a862')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
}

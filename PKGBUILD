# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

# http://dl.bintray.com/mitchellh/terraform/terraform_0.6.2_SHA256SUMS
source_i686=("https://dl.bintray.com/mitchellh/terraform/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/terraform/terraform_${pkgver}_linux_amd64.zip")
sha256sums_i686=('291b0e1fcba6d81836d12e98c02c8b853ecaf9d0f63c1cb8165366b7a53ca356')
sha256sums_x86_64=('36e92a21ca384f48802c43f7334f756267632cc9bb939a11a625e2c414de0360')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
}

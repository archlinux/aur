# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.6
pkgrel=2
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

# http://dl.bintray.com/mitchellh/terraform/terraform_0.6.6_SHA256SUMS
source_i686=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_amd64.zip")
sha256sums_i686=('27fbf1818a7aa7848a24d685198c213103f04566e4cf5d4f4f2846bf1da441bb')
sha256sums_x86_64=('497e9f9ace4c3da9afd8240222f6f29a7209b3a9ac5b143cefe117e41d5985f4')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
}

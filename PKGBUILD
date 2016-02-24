# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.12
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

source_i686=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_amd64.zip")
sha256sums_i686=('c936e073988cef78dd1c1d29873276f85a7ec44329074bc353a022054fbd5e06')
sha256sums_x86_64=('37513aba20f751705f8f98cd0518ebb6a4a9c2148453236b9a5c30074e2edd8d')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
}

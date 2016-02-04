# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.11
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

source_i686=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_amd64.zip")
sha256sums_i686=('8b3bf0e1ac3180f3846abea9bfb3a30eb098460f7923989b5eb4bb8cd4ae80fc')
sha256sums_x86_64=('f451411db521fc4d22c9fe0c80105cf028eb8df0639bac7c1e781880353d9a5f')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
}

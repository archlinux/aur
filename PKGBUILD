# Maintainer: Stykers <stykers at stykers dot moe>

pkgname=vagrant-vmware-utility
pkgver=1.0.7
pkgrel=3
pkgdesc="Proprietary plugin for vagrant vmware provider."
arch=('x86_64')
url="https://www.vagrantup.com/vmware/"
license=('GPL')
depends=('vagrant')
source=('https://releases.hashicorp.com/vagrant-vmware-utility/1.0.7/vagrant-vmware-utility_1.0.7_x86_64.tar.xz')
install=${pkgname}.install
md5sums=('248101f9de76df92bf8ac80be9338312')

package() {
  tar xlvf ${srcdir}/*.tar.xz -C ${pkgdir}
  rm ${pkgdir}/.INSTALL
  rm ${pkgdir}/.BUILDINFO
  rm ${pkgdir}/.MTREE
  rm ${pkgdir}/.PKGINFO
  }

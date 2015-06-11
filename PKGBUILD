# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>

pkgname=createvm
pkgver=0.5
pkgrel=2
pkgdesc="Script to create VMware virtual machine"
arch=('i686' 'x86_64')
url="https://github.com/beeman/createvm.sh"
license=('GPL2')
depends=('bash')
source=(https://github.com/beeman/createvm.sh/archive/${pkgver}.tar.gz)
md5sums=('40b39ca6879b02234046d79bd7a02700') 

package() {
  cd ${srcdir}/${pkgname}.sh-${pkgver}

  install -d ${pkgdir}/usr/bin
  install -m755 createvm.sh ${pkgdir}/usr/bin/createvm
}

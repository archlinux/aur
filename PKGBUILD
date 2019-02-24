# Maintainer: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
pkgname=ao
pkgver=6.8.0
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://github.com/klaussinani/ao/"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
provides=('ao')
conflicts=('ao-git')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
md5sums=('3456e8c4d152024646df1e6cb2175bdf')

package() {
  tar xfJ ${srcdir}/data.tar.xz -C ${pkgdir}
  install -d ${pkgdir}/usr/bin/
  ln -s /opt/Ao/ao-app ${pkgdir}/usr/bin/ao
}

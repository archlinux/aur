# Maintainer: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
pkgname=ao
pkgver=5.6.0
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://klauscfhq.github.io/ao/"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
provides=('ao')
conflicts=('ao-git')
source=("https://github.com/klauscfhq/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
md5sums=('d8ca1af7bc90c455812f77793de95e5e')

package() {
  tar xfJ ${srcdir}/data.tar.xz -C ${pkgdir}
  install -d ${pkgdir}/usr/bin/
  ln -s /opt/Ao/ao-app ${pkgdir}/usr/bin/ao
}

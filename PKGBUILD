# Maintainer: Paul Oppenheimer <redg3ar@airmail.cc>
pkgname=ao
pkgver=5.2.0
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://klauscfhq.github.io/ao/"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
provides=('ao')
conflicts=('ao-git')
source=("https://github.com/klauscfhq/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-amd64.deb")
md5sums=('8281cc9859e755225b4495b848e1fe15')

package() {
  tar xfJ ${srcdir}/data.tar.xz -C ${pkgdir}
  install -d ${pkgdir}/usr/bin/
  ln -s ${pkgdir}/opt/Ao/ao-app ${pkgdir}/usr/bin/ao
}

# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=lxdm-gdmflexiserver
pkgver=1
pkgrel=2
pkgdesc="gdmflexiserver emulation for LXDM so you can switch user from XFCE4, x-screensaver..."
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('lxdm')
optdepends=()
makedepends=()
conflicts=('gdm')
replaces=()
backup=()
install=
provide=("gdmflexiserver")
source=("gdmflexiserver")

md5sums=('ef8fba099b625baa2539d92fc26a7731'
         )

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/gdmflexiserver ${pkgdir}/usr/bin/gdmflexiserver
  }

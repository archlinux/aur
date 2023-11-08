# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: proton  (https://aur.archlinux.org/account/proton, https://aur.archlinux.org/packages/radeon-profile-daemon-git#comment-777899 -> https://pastebin.pl/view/7773b3a7)

_basename=radeon-profile-daemon
pkgname="${_basename}-openrc"
epoch=1
pkgver=r2
pkgrel=2
pkgdesc="OpenRC init script for '${_basename}'."
arch=('any')
url="https://gitweb.gentoo.org/repo/gentoo.git/plain/x11-apps/radeon-profile-daemon/"
license=('GPL2')
depends=("${_basename}")
optdepends=('openrc: To make use of the init script.')
conflicts=('systemd-sysvcompat')
source=("https://gitweb.gentoo.org/repo/gentoo.git/plain/x11-apps/radeon-profile-daemon/files/radeon-profile-daemon.initd-${pkgver}")
sha256sums=('1dfed15d0af194b5a4588cf2dadd514f490fdbde1316b619f562b87485f3d643')

package() {
  install -Dvm755 "${srcdir}/radeon-profile-daemon.initd-${pkgver}" "${pkgdir}/etc/init.d/radeon-profile-daemon"
}

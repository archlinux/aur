# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-gtk2-bin
pkgver=46.0.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'ffmpeg' 'desktop-file-utils'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'ttf-font')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'upower: Battery API')
options=('!emptydirs' '!makeflags')
provides=("firefox=${pkgver}-${pkgrel}")
conflicts=("firefox")
source_x86_64=(http://repo.archlinuxcn.org/x86_64/firefox-gtk2-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz)
sha256sums_x86_64=('9cc31b5012bcab85b98871272e1e182821745f86a8546330d62a21016fb542a1')
validpgpkeys=('2B90598A745E992F315E22C58AB132963A06537A')

package() {
  cp -R ${srcdir}/usr ${pkgdir}
}

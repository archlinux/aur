# Maintainer: Lolka LLC <support@lolka.app>

pkgname=lolka-x-bin
pkgver=2.0.14
pkgrel=1
pkgdesc='Native desktop client for lolka.app - chat and voice with friends'
arch=('x86_64')
url='https://lolka.app'
license=('LicenseRef-LolkaX')
depends=(
  'glibc'
  'gcc-libs'
  'libxcb'
  'libx11'
  'libxkbcommon'
  'libxkbcommon-x11'
  'xcb-util-cursor'
  'xcb-util-wm'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'libglvnd'
  'fontconfig'
  'freetype2'
  'dbus'
  'glib2'
  'libpulse'
  'xdg-utils'
  'libxext'
  'libxdamage'
  'libxfixes'
  'libxcomposite'
  'libxrandr'
  'libxtst'
  'mesa'
  'libdrm'
  'libsm'
  'libice'
  'libssl.so=3-64'
  'hicolor-icon-theme'
)
provides=('lolka-x=2.0.14')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.14-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.14/lolka-x-bin-2.0.14-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.14-x86_64.pkg.tar.zst')
sha512sums=('ca3541721edbedb3a16378693aac048a43aeb11d2fc2791866882ac31603c435ddceff9ec9f3d3840dc7ed15ea70338796d9bbe08210622b6ad5b9aaacc6d171')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.14-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}

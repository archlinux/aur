# Maintainer: Lolka LLC <support@lolka.app>

pkgname=lolka-x-bin
pkgver=2.0.15
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
provides=('lolka-x=2.0.15')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.15-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.15/lolka-x-bin-2.0.15-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.15-x86_64.pkg.tar.zst')
sha512sums=('b2d4e9b57850e68be07b4d9e6d88b943afa338213c92f948751501c46816ff2b105e61bbd3ff10e8d5c545e4e093a1e4f13647d67241aa9f4e76479169c1c873')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.15-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}

# Contributor: Lolka LLC <support@lolka.app>

pkgname=lolka-x-bin
pkgver=2.0.13
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
provides=('lolka-x=2.0.13')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.13-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.13/lolka-x-bin-2.0.13-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.13-x86_64.pkg.tar.zst')
sha512sums=('d8e36ac01a9ea27fe7931a92e60d788de0f450ea261ae65cf370dc5289097246bf2c9426f634c095d900549c60413648d4d363350980a3912192a495efbf5665')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.13-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}

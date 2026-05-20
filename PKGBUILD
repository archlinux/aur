# Maintainer: Pablo Pascual <pablocpascual@gmail.com>

pkgname=tiri-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A tiling Wayland compositor derived from niri'
arch=('x86_64')
url='https://github.com/pablocpas/tiri'
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'glib2'
  'libdisplay-info'
  'libinput'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'pango'
  'pixman'
  'seatd'
  'systemd-libs'
  'wayland'
  'xdg-desktop-portal-impl'
)
optdepends=(
  'alacritty: suggested GPU-accelerated terminal emulator'
  'bash: required by tiri-session'
  'fuzzel: suggested Wayland application launcher'
  'gnome-keyring: secrets portal provider configured by tiri-portals.conf'
  'mako: suggested Wayland notification daemon'
  'swaybg: suggested Wayland wallpaper tool'
  'swaylock: suggested Wayland screen locker'
  'waybar: suggested Wayland bar'
  'xdg-desktop-portal-gnome: required for screencasting'
  'xdg-desktop-portal-gtk: fallback portal configured by tiri-portals.conf'
  'xwayland-satellite: required for running X11 applications'
)
provides=('tiri' 'wayland-compositor')
conflicts=('tiri' 'tiri-git')
source=(
  "tiri-${pkgver}-x86_64-archlinux.tar.zst::${url}/releases/download/tiri-v${pkgver}/tiri-${pkgver}-x86_64-archlinux.tar.zst"
)
b2sums=(
  'e5270d7a73bd8711d183d09422de8a39135d75d14433a5549eedb0f89b5331224b1e51f3ac053533a19ce915e87d68b2a07a817b56a182f45e1492f7c3b1445b'
)

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}

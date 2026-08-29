# Maintainer: Mathis <999frostz@gmail.com>
pkgname=screenix-bin
pkgver=1.6.9
pkgrel=1
pkgdesc="Professional screen recorder with smooth zoom effects"
arch=('x86_64')
url="https://github.com/mathisdev7/screenix"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'glib2'
  'gdk-pixbuf2'
  'cairo'
  'pango'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-libav'
  'ffmpeg'
  'xdotool'
  'pipewire'
  'wireplumber'
  'xdg-desktop-portal'
)
optdepends=(
  'gst-plugins-bad: additional media codec support'
  'gst-plugins-ugly: additional media codec support'
  'xdg-desktop-portal-kde: portal backend for KDE Plasma'
  'xdg-desktop-portal-hyprland: portal backend for Hyprland'
  'xdg-desktop-portal-wlr: portal backend for Sway/wlroots compositors'
  'xdg-desktop-portal-gnome: portal backend for GNOME'
  'xdg-desktop-portal-gtk: portal backend fallback for other desktops'
)
provides=('screenix')
conflicts=('screenix')
options=('!strip' '!debug')
source=("https://github.com/mathisdev7/screenix-releases/releases/download/v${pkgver}/Screenix_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
}

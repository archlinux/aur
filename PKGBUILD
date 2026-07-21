# Maintainer:
# Contributor:
pkgname=sbsp
pkgver=2.5.4
pkgrel=2
pkgdesc="Audio playback software for event usage with precice control and remote control."
arch=('x86_64')
url="https://github.com/Keinsleif/sbsp"
license=('Elastic-2.0')
depends=('glibc' 'libgcc' 'cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'dbus' 'webkit2gtk-4.1' 'alsa-lib')
options=('!strip' '!debug')
source=("https://raw.githubusercontent.com/Keinsleif/sbsp/refs/tags/app-${pkgver}/LICENSE.md")
source_x86_64=("${url}/releases/download/app-${pkgver}/SBS.Player_${pkgver}_amd64.deb")
sha256sums=("48255018b41fc0e965b1115af7e6779bc218bb8a6747d561da800d5022622aa2")
sha256sums_x86_64=('dfeef77ceb829c171c7dde30da6c5d951e44b7694aff952c41bf29d313901928')
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.md"
}

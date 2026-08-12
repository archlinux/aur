# Maintainer: Aditya Hebballe <adityahebbale@gmail.com>

pkgname=official-chatgpt-bin
pkgver=26.803.81509
pkgrel=1
pkgdesc='The official ChatGPT desktop application for Linux'
arch=(x86_64)
url='https://chatgpt.com/'
license=('LicenseRef-Proprietary')
depends=(
  alsa-lib
  at-spi2-core
  cairo
  cups
  dbus
  expat
  gdk-pixbuf2
  glib2
  glibc
  gcc-libs
  graphite
  gtk3
  libdrm
  libglvnd
  libnotify
  libusb
  libx11
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nspr
  nss
  openssl
  pango
  systemd-libs
  xdg-utils
  xz
)
options=(!strip)
source_x86_64=('https://persistent.oaistatic.com/codex-app-prod/linux/deb/latest/chatgpt_amd64.deb')
sha256sums_x86_64=('a9bf91a368f9f7c4eea38082a9fb8fb46b8d005b719a6d7715d2e5a1982c38eb')

package() {
  bsdtar -xOf "${srcdir}/chatgpt_amd64.deb" data.tar.xz | bsdtar -xf - -C "${pkgdir}"
}

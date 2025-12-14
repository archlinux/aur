# Based on: xcompmgr (Official Arch Linux package maintainers and contributors.)
# Maintainer: LinuxLover471

pkgname=fastcompmgr-bin
pkgver=0.5
pkgrel=1
pkgdesc="A lightweight compositor for X11 with a focus on speed."
arch=('x86_64')
url="https://github.com/tycho-kirchner/fastcompmgr"
license=('MIT')
depends=(
  libx11
  libxcomposite
  libxdamage
  libxfixes
  libxrender
  libxcb
  libxau
  libxdmcp
  glibc
)
source=("https://github.com/tycho-kirchner/fastcompmgr/releases/download/v$pkgver/fastcompmgr"
  "https://raw.githubusercontent.com/tycho-kirchner/fastcompmgr/v$pkgver/LICENSE")
sha512sums=('bcf0781fb49a221c4afa573942268ea5e2ef45b4a63d32f64a8a0b524b1b9ae45b0df1ddd542d5e1078bc9d75f911f8ee83a8c6b9f25e9c4e660b01e985cb8e0'
  'SKIP')
conflicts=("fastcompmgr")
provides=("fastcompmgr")

package() {
  install -Dm755 fastcompmgr \
    "${pkgdir}/usr/bin/fastcompmgr"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: nepetacsv, and ChatGPT ;)

pkgname=sysfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Beautiful and detailed system fetch script for Arch Linux"
arch=('any')
url="https://aur.archlinux.org/packages/sysfetch"
license=('MIT')
depends=('bash' 'coreutils' 'procps-ng' 'pciutils')
optdepends=(
  'mesa: OpenGL / Vulkan info'
  'lm_sensors: temperature support'
  'flatpak: flatpak packages count'
  'snapd: snap packages count'
)
source=('sysfetch')
sha256sums=('SKIP')

package() {
  install -Dm755 sysfetch "$pkgdir/usr/bin/sysfetch"
}


# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' 'aarch64' 'armv7h' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
source_i686=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz )
source_aarch64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm64-v${pkgver}.tar.gz )
source_armv7h=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm-v${pkgver}.tar.gz )

sha256sums_x86_64=( 'b35ea0829a11f1f1f528e0298cde14091b92529d9c1b0ff8cfc64355229a03e8' )
sha256sums_i686=( '7e3087ec46c0261bdefc2a4ffa250e364b9a11fb4e1241426b784a7251e3d83d' )
sha256sums_aarch64=( '708c35c586e86094fde236eab5f4af986e300c0fa8b439f9815d6ee81e550304' )
sha256sums_armv7h=( '4097e4ef8d82e81b01bceef79c449d176b26e677975ef0c930a3c1e7ff916bc4' )

provides=( 'dnslookup' )
conflicts=( 'dnslookup-git' 'dnslookup' )

package() {
  find "${srcdir}" -type f -iname 'dnslookup' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;
}

# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' 'aarch64' 'armv7h' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
source_i686=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz )
source_aarch64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm64-v${pkgver}.tar.gz )
source_armv7h=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm-v${pkgver}.tar.gz )

sha256sums_x86_64=('8827d781e813894044e681a95e63d8d929200133aaae12f5cca9d1709fa41d16')
sha256sums_i686=('e63134da23fde47204cd9f796fba9d578ce7a61755fe27f4752ee2a82e8df9d4')
sha256sums_aarch64=('9944e4495e3dd710f966e3aaf4c37fc07a58a171cb0009bfaa27112d0c3e2f57')
sha256sums_armv7h=('f5a2ba90ff767fa0a6803578029e21c5d361b286d2a24215ded4560f90ed6c7c')

provides=( 'dnslookup' )
conflicts=( 'dnslookup-git' 'dnslookup' )

package() {
  find "${srcdir}" -type f -iname 'dnslookup' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;
}

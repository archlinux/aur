# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' 'aarch64' 'armv7h' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
source_i686=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz )
source_aarch64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm64-v${pkgver}.tar.gz )
source_armv7h=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm-v${pkgver}.tar.gz )

sha256sums_x86_64=( 'e5f7f3a7892566f8665fdf794d701ab845d2aee6af05119d555d045290e18a5d' )
sha256sums_i686=( '96aa009dae5bcc7029975cf315ff39ac59322eadce8502de0991bf7384e946b3' )
sha256sums_aarch64=( '225ed0ed34fa7774aac32a07fe2dddd29d64ce730f508a28fec6b7cc58b31e38' )
sha256sums_armv7h=( 'e76516d837eaee66358e0a73d4dea9d5a78f96b75940d6b80fb22eedeb27a257' )

provides=( 'dnslookup' )
conflicts=( 'dnslookup-git' 'dnslookup' )

package() {
  find "${srcdir}" -type f -iname 'dnslookup' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;
}

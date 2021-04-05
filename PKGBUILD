# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.4.8
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' 'aarch64' 'armv7h' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
source_i686=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz )
source_aarch64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm64-v${pkgver}.tar.gz )
source_armv7h=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm-v${pkgver}.tar.gz )

sha256sums_x86_64=( '96e410de07b7272984682ee7fa9e19ee130b580c6c67b57dfce6c056d30c759c' )
sha256sums_i686=( 'ab1b0266b81b141453bf7796ae7397c80b8585c570808f15e854959e9cc6c778' )
sha256sums_aarch64=( '99ea76808fbf1c7beccaa7b0b0581567900ce8d551746e65b1adf12678d7911a' )
sha256sums_armv7h=( '717ed94c9b16225c02f3ba7cd2e5f12eb812770b0fbcb12be3f251d2a886e89c' )

provides=( 'dnslookup' )

package() {
  find "${srcdir}" -type f -iname 'dnslookup' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;
}

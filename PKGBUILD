# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.7.3
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' 'aarch64' 'armv7h' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
source_i686=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz )
source_aarch64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm64-v${pkgver}.tar.gz )
source_armv7h=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm-v${pkgver}.tar.gz )

sha256sums_x86_64=( 'a5c90e6dc074b60b7b055f9c798fc63d1e54976f127d8b90d369e4a322723493' )
sha256sums_i686=( 'c2b7f0e751d25da2ecf8bfcc2b205887c3cba8d12a521478bed51d5a87faef4d' )
sha256sums_aarch64=( '58aefca9a48133d0a32a594dea2b685e711523d560efc08444f943109b082d5e' )
sha256sums_armv7h=( '376d1c6b3d58c574ec9c9a260827c2b841ed3e723c06c73fc882721153bf38f5' )

provides=( 'dnslookup' )
conflicts=( 'dnslookup-git' 'dnslookup' )

package() {
  find "${srcdir}" -type f -iname 'dnslookup' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;
}

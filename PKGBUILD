# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' 'aarch64' 'armv7h' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
source_i686=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz )
source_aarch64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm64-v${pkgver}.tar.gz )
source_armv7h=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm-v${pkgver}.tar.gz )

sha256sums_x86_64=( '8308268b3750b813fee5742b15246baa30f4e5a29cc519cc784bfbc8690cfd93' )
sha256sums_i686=( 'c915218bc07bcb4213b4a3d6dd76fb2a7ddb1f756e72a7c6e9e22b1bd04622be' )
sha256sums_aarch64=( '87d6e299e47c9ffa8245ac09b2d147ef651a7ea8f5ddfe34689ca1acbbacd4f9' )
sha256sums_armv7h=( '1e00e2e77c27ad1d12b73936f744b77ca2ddb0cdf483b9c6e950470a3c40266e' )

provides=( 'dnslookup' )
conflicts=( 'dnslookup-git' 'dnslookup' )

package() {
  find "${srcdir}" -type f -iname 'dnslookup' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;
}

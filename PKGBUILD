# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.4.7
pkgrel=2
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
source_i686=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz )

sha256sums_x86_64=( 'bc5ff9e24af206fe895521c8f4ec73ceb981168711ee6b9444cbc7ede5733ba9' )
sha256sums_i686=( 'b11593d54ac095aedcd67c2cf71f38b7108e903d1156b813def9f400b5575866' )

provides=( 'dnslookup' )

package() {
  find "${srcdir}" -type f -iname 'dnslookup' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;
}

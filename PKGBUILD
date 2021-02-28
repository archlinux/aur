# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.4.7
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
sha256sums=( 'bc5ff9e24af206fe895521c8f4ec73ceb981168711ee6b9444cbc7ede5733ba9' )

conflicts=( 'dnslookup-git' )

package() {
  install -Dm755 "${srcdir}/linux-amd64/dnslookup" "${pkgdir}/usr/bin/dnslookup"
}

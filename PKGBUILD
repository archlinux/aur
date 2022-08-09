# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' 'aarch64' 'armv7h' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz )
source_i686=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz )
source_aarch64=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm64-v${pkgver}.tar.gz )
source_armv7h=( https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm-v${pkgver}.tar.gz )

sha256sums_x86_64=( '56353b4c02a354e800d483ac36798a98e775f9c5f0f606365e5a87726ae19dff' )
sha256sums_i686=( '207600fa08ba4c8a940ba6dce278f5bad3de8d1ee93186728210b1ffae453755' )
sha256sums_aarch64=( 'fa3c1904aca8dcedb086af012f531d0824fef54ea5dc0a19c0f41b05fcc9642b' )
sha256sums_armv7h=( 'c29e82edc136e17517251019abceb4ab57459d701221d37431ccacb176b69558' )

provides=( 'dnslookup' )
conflicts=( 'dnslookup-git' 'dnslookup' )

package() {
  find "${srcdir}" -type f -iname 'dnslookup' -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;
}

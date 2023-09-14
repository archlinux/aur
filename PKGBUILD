# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=dnslookup-bin
pkgver=1.9.2
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=( 'x86_64' 'i686' 'aarch64' 'armv7h' )
url="https://github.com/ameshkov/dnslookup"
license=( 'MIT' )

source_x86_64=( "https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-amd64-v${pkgver}.tar.gz" )
source_i686=( "https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-386-v${pkgver}.tar.gz" )
source_aarch64=( "https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm64-v${pkgver}.tar.gz" )
source_armv7h=( "https://github.com/ameshkov/dnslookup/releases/download/v${pkgver}/dnslookup-linux-arm-v${pkgver}.tar.gz" )

sha256sums_x86_64=('dee1c42131a56842b2993ef0f74c45f36cefd7866fb8dc6f6495f0be4cb50854')
sha256sums_i686=('b79961a5574d4cada3231107fc8d1a5c6ee43c676266baeeecc9497b104c17b0')
sha256sums_aarch64=('29d50db6b551b22a65580bba1b67fc272675656809c876311cbe2bfea5f23625')
sha256sums_armv7h=('2c6fc1b88d1377b25f262ab59add77f9ca0275e99708e9e72e23398f1b301fdc')

provides=( 'dnslookup' )
conflicts=( 'dnslookup-git' 'dnslookup' )

package() {

    find "${srcdir}" \
        -type f \
        -iname 'dnslookup' \
        -exec install -Dm755 '{}' "${pkgdir}/usr/bin/dnslookup" \;

}

# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.8.0"
pkgrel=1
pkgdesc='a simplistic papermc helper (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('3ff79759e738e6c5ad91c55cd8c22a7d76cd4763a2f5d8c351cbcfdc5ded9620')
sha256sums_x86_64=('d185dbb825dcaca0ae2bb0a8c226a50e3467d722543ac58773102c368e31d0cd')
sha256sums_armv7h=('bb91513b4d50f1af1b93d862f4706e79b19e2ebd1c53799f32ec4dcbc8bfc3d8')
sha256sums_armv6h=('f2e3aff790fda291fa9d01274181390b3ed0badd82e769c01c44f4e644932ed0')
sha256sums_aarch64=('bdb1c9b5a865ab96af727dbd37c85d2a8a08bcc533f3fd126da0ba5b21ebf5ec')

source_x86_64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_x86_64")
source_i686=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_i386")
source_armv6h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_arm64")

conflicts=('pap')
provides=('pap')
depends=('pacman')
optdepends=('java-runtime: running the downloaded jarfiles')

package() {
  install -Dm755 pap_${pkgver}_linux_* "${pkgdir}"/usr/bin/pap
}

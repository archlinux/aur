#
# Maintainer: Anthony Vitacco <avitacco@protonmail.com>
#

pkgname=jig
pkgdescr='A tool for building and publishing Puppet modules'
url='https://github.com/avitacco/jig'

arch=('x86_64' 'aarch64')

pkgver=1.2.0
pkgrel=2

source_x86_64=("https://github.com/avitacco/jig/releases/download/v${pkgver}/jig_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('1387814e3567340ed002e50325e7d1a8c3f1b88aa018b18183be635b5a89699c')

source_aarch64=("https://github.com/avitacco/jig/releases/download/v${pkgver}/jig_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('cdc33ab5d5721bcc1155e2d524b6da1cbbbbb0e8125dac9d4d5c9cd68d4ba4fb')

package() {
    install -d -m 755 "${pkgdir}/usr/bin"
    install -m 755 jig "${pkgdir}/usr/bin/jig"
}

#
# Maintainer: Anthony Vitacco <avitacco@protonmail.com>
#

pkgname=jig
pkgdescr='A tool for building and publishing Puppet modules'
url='https://github.com/avitacco/jig'

arch=('x86_64')

pkgver=1.2.0
pkgrel=1

source=("https://github.com/avitacco/jig/releases/download/v${pkgver}/jig_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1387814e3567340ed002e50325e7d1a8c3f1b88aa018b18183be635b5a89699c')

package() {
    tar xf "jig_${pkgver}_linux_amd64.tar.gz"
    mv jig "${pkgdir}"

    cd "${pkgdir}"
    install -d -m 755 usr/bin
    mv jig usr/bin
}


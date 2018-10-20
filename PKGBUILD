# Maintainer: David Stark <david@starkers.org>

pkgname=kail
pkgver=0.7.0
pkgrel=1
pkgdesc='kubernetes log viewer'
url='https://github.com/Versent/kail'
arch=('x86_64')
license=('MIT')
conflicts=()

source_x86_64=("https://github.com/boz/kail/releases/download/v${pkgver}/kail_${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=('142ad194debe29548cb048d10c812dbf')

package() {
    install -Dm755 ${srcdir}/kail ${pkgdir}/usr/bin/kail
}

# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.1.0.20221124
_pkgvergh=v0.1.0-alpha-20221124-nightly
pkgrel=2
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()

source=("greptime-linux-amd64-${pkgver}.tgz::https://github.com/GreptimeTeam/greptimedb/releases/download/${_pkgvergh}/greptime-linux-amd64.tgz")
sha256sums=("12989f1e468d19b6345809c5c2cef93dffe9a91a194b1b2d82218a996437e7fa")

package() {
    install -Dm755 "${srcdir}/greptime" "${pkgdir}/usr/bin/greptime"
}

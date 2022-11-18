# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.1.0.20221116
_pkgvergh=0.1.0-alpha-20221116
pkgrel=1
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()

source=("https://github.com/GreptimeTeam/greptimedb/releases/download/v${_pkgvergh}/greptime-linux-amd64.tgz")
sha256sums=("c26bf098dd6e726d634856d81a5a1422253f11938b0f090e0d53aa2c7bd34049")

package() {
    install -Dm755 "${srcdir}/greptime" "${pkgdir}/usr/bin/greptime"
}

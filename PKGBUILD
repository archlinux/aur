# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=meshcmd-bin
pkgver=1.1.46
pkgrel=1
pkgdesc="A command line tool for performing many Intel AMT management operations"
arch=("x86_64")
url="https://www.meshcommander.com/meshcommander/meshcmd"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("meshcmd::https://alt.meshcentral.com/meshagents?meshcmd=6")
b2sums=('3285d6178db98163ef4ce60ab8ad3e3e371f94fc27f6b518c741f175d8ead89c013de85cfad736d7cb9c5146f66ff98f7ce8502bcf60d97be8f5bf9105fe1cea')

package() {
    install -Dm755 "meshcmd" "${pkgdir}/usr/bin/meshcmd"
}

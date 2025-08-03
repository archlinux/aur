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
b2sums=('7b3ccabb29faa6e8204494f33c8f30f4251299791bc8382b2186a9c382c4956464d2eb8a5fe31b48d3cfade82d6621f803e1aa8481bcdae821cb59bcf5e737b3')

package() {
    install -Dm755 "meshcmd" "${pkgdir}/usr/bin/meshcmd"
}

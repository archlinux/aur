# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname="warp-terminal-pacman-repo"
pkgname=${_pkgname}
pkgver=0.1.stable
pkgrel=1
pkgdesc="This is a bootstrap script for official wap-terminal pacman repo. Please run pacman -Sy warp-terminal after install this package."
arch=('x86_64' 'aarch64')
url="https://warp.dev"
license=('custom')
provides=("${_pkgname}=${pkgver}" 'warp-terminal-bin')
conflicts=('warp-terminal-bin')
replaces=('warp-terminal-bin')
options=('!strip')
depends=()
source=(
    "warp-terminal-pacman-repo-install"
)
sha256sums=(
            '82dceb7a370d4de5a6c3bea45522ff544577aa2a5d935d787fc63e341bd379e5'
           )

install="warp-terminal-pacman-repo-install"

# Maintainer: Mikescher <aur@mikescher.com>
# Repo:       https://github.com/Mikescher/better-docker-ps

pkgname=dops-bin
pkgver=1.11
pkgrel=1

pkgdesc="A replacement for the default docker-ps that tries really hard to fit into the width of your terminal."

url="https://github.com/Mikescher/better-docker-ps"
license=('Apache')

arch=('x86_64')

_binary="dops_linux-amd64"

source=(
  "https://github.com/Mikescher/better-docker-ps/releases/download/v${pkgver}/${_binary}"
)

_bin_sha='48addb268291151b0dd6752675829dc3ba81523d1515d6094ccf18269e26dfd6'

sha256sums=(
  "$_bin_sha"
)

package()
{
  install -D -m755 "$srcdir/${_binary}" "${pkgdir}/usr/bin/dops"
}


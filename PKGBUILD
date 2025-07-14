# Maintainer: Mikescher <aur@mikescher.com>
# Repo:       https://github.com/Mikescher/better-docker-ps

pkgname=dops-bin
pkgver=1.15
pkgrel=1

pkgdesc="A replacement for the default docker-ps that tries really hard to fit into the width of your terminal."

url="https://github.com/Mikescher/better-docker-ps"
license=('Apache')

arch=('x86_64')

_binary="dops_linux-amd64"

source=(
  "https://github.com/Mikescher/better-docker-ps/releases/download/v${pkgver}/${_binary}"
)

_bin_sha='7317e89b38ca78b77dd1910a6483a742caa7b4312f38b1618145af178f3203cf'

sha256sums=(
  "$_bin_sha"
)

package()
{
  install -D -m755 "$srcdir/${_binary}" "${pkgdir}/usr/bin/dops"
}


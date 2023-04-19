# Maintainer: Mikescher <aur@mikescher.com>
# Repo:       https://github.com/Mikescher/firefox-sync-client

pkgname=ffsclient-bin
pkgver=1.5.0
pkgrel=1

pkgdesc="A cli to access firefox-sync data"

url="https://github.com/Mikescher/firefox-sync-client"
license=('Apache')

arch=('x86_64')

_binary="ffsclient_linux-amd64"

source=(
  "https://github.com/Mikescher/firefox-sync-client/releases/download/v${pkgver}/${_binary}"
)

_bin_sha='0000000000000000000000000000000000000000000000000000000000000000'

sha256sums=(
  "$_bin_sha"
)

package()
{
  install -D -m755 "$srcdir/${_binary}" "${pkgdir}/usr/bin/ffsclient"
}


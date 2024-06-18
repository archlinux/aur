# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nymvpn-x-bin
pkgver=0.1.2_dev
# upstream version
_pkgver=0.1.2-dev
_release_tag=nightly-x
pkgrel=1
pkgdesc='NymVPN next desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'bash' 'cairo' 'pango' 'gtk3' 'webkit2gtk' 'gdk-pixbuf2' 'glib2' 'openssl' 'libsoup')
makedepends=()
optdepends=('nym-vpnd: NymVPN daemon as a systemd service')
provides=('nymvpn-x')
conflicts=('nymvpn-x')
source=("$url/releases/download/$_release_tag/nymvpn-x_${_pkgver}_linux_x64"
    'nymvpn-x-wrapper.sh'
    'nymvpn-x.desktop'
    'nymvpn-x.svg')
sha256sums=(
    'de41c726909df17c4a9057867a7a58b2a064068f771b8a865a1e7939eb9bfa11' 
    '4a68bccaa807684d2fd45832cd6df24f977e8d4e1c7a37de583c54423c21d259' 
    '8bf0dbd2a6c312630e1c2e866431d0361b24975ba17b4ab14c891efea326251c' 
    'c15b6028f25ea931c9bedf2b5600f91d6f94f15066afdbd7f789c770ea250e06')

package() {
  install -Dm755 "nymvpn-x_${_pkgver}_linux_x64" "$pkgdir/usr/bin/nymvpn-x"
  install -Dm755 "nymvpn-x-wrapper.sh" "$pkgdir/usr/bin/nymvpn-x-wrapper.sh"
  install -Dm644 "nymvpn-x.desktop"    "$pkgdir/usr/share/applications/nymvpn-x.desktop"
  install -Dm644 "nymvpn-x.svg"        "$pkgdir/usr/share/icons/nymvpn-x.svg"
}


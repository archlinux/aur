# Maintainer: Matthew Anderson <mpa.business@pm.me>

pkgname=plex-media-server-openrc
pkgver=1.0
pkgrel=1
pkgdesc="OpenRC service for Plex Media Server"
arch=('any')
url='https://aur.archlinux.org/packages/plex-media-server-openrc'
license=('custom')
depends=('openrc' 'plex-media-server')
source=('plex.conf.d' 'plex.init.d')
sha256sums=('fa43b4aa21d378b8bf64bc53f7fcb8ef700ed9cbeebffccd70f0080c010c2cd9'
            'e9bb58b7daeff881c18c45c754b5d62aee81acff9803b9553ac8da8a91328a2e')
package() {
  install -Dm755 ${srcdir}/plex.init.d "$pkgdir"/etc/init.d/plex
  install -Dm755 ${srcdir}/plex.conf.d "$pkgdir"/etc/conf.d/plex
}

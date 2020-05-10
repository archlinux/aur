# Maintainer: Pietro Carrara <pbcarrara@inf.ufrgs.br>

pkgname=deluged-service
pkgver=0.1
pkgrel=1
pkgdesc='Systemd unit for the deluge torrent daemon'
arch=('i686' 'x86_64')
url='https://deluge-torrent.org/'
license=('GPL')
depends=('deluge')
provides=('deluge-service')

package() {
  mkdir -p "$pkgdir/etc/systemd/system/deluged.service.d/"

  cp ../deluged.service "$pkgdir/etc/systemd/system/"
  cp ../user.conf "$pkgdir/etc/systemd/system/deluged.service.d/"
}

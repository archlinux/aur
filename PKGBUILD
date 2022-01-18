# Maintainer: Cyrusmg <aur@kulovany.net>
pkgname=eobcanka
pkgver=3.2.1
pkgrel=1
pkgdesc="eObcanka software for Czech Citizen Portal"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://info.identitaobcana.cz"
license=('GPL')
depends=('pacman>=5.2'
         'pcsclite')
optdepends=('ccid: Smart Card Interface Devices driver'
    'opensc: Tools and libraries for smart cards')
source=(https://info.identitaobcana.cz/Download/eObcanka.deb)
options=('!strip')

package ()
{
  tar -xf data.tar.xz -C "${pkgdir}"
}

post_install ()
{
  echo "If your reader is not being recognized, run systemctl start pcscd.socket and pcscd.service"
}

sha1sums=('546995d5bf6c039ac7e44441bba57cadf4a569eb')

# vim:set ts=2 sw=2 et:

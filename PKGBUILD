# Maintainer: Cyrusmg <aur@kulovany.net>
pkgname=eobcanka
pkgver=1.0.1
pkgrel=1
pkgdesc="eObcanka software for Czech Citizen Portal"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://info.eidentita.cz"
license=('GPL')
depends=('pacman>=5.2'
         'pcsclite')
optdepends=('ccid: Smart Card Interface Devices driver'
    'opensc: Tools and libraries for smart cards')
source=(https://info.eidentita.cz/download/eObcanka.deb)

package ()
{
  tar -xf data.tar.xz -C "${pkgdir}"
}

post_install ()
{
  echo "If your reader is not being recognized, run systemctl start pcscd.socket and pcscd.service"
}

# vim:set ts=2 sw=2 et:
md5sums=('287d82c9c256cf09234dcfa5c5b92049')


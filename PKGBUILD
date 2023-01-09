# Maintainer: Cyrusmg <aur@kulovany.net>
pkgname=eobcanka
pkgver=3.3.2
pkgrel=1
pkgdesc="eObcanka software for Czech Citizen Portal"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://info.identitaobcana.cz"
license=('custom')
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

sha1sums=('631df46ab4aa48d82a3d20b70981e425e8e804d9')

# vim:set ts=2 sw=2 et:

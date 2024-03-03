# Maintainer: Pavel Kuzminov <neko@pavel.gg>
# Contributor: Emily Marigold Klassen <forivall@gmail.com>
pkgname='teamspeak3-addon-installer'
pkgver=0.3
pkgrel=1
pkgdesc='Simple script to install packages from Teamspeak 3'\''s addon site. Automatically creates packages for the teamspeak directory'
arch=('any')
url='https://github.com/NekoPavel/teamspeak3-addon-installer'
license=('WTFPL')
depends=('bash' 'teamspeak3' 'pacman-contrib')
source=('teamspeak3-install-addon' 'WTFPL')
sha256sums=('fe41d4d04a99333a726ad1afc291b368bbaed2fb368a712941ca1687082e1f5f'
            '7637386b5f81e8a719ca336233149005e5fa28b5e6054ea7b67de49355b0ad40')

package() {
  install -D "teamspeak3-install-addon" "$pkgdir/usr/bin/teamspeak3-install-addon"
  install -Dm644 ./WTFPL "$pkgdir/usr/share/licenses/$pkgname/WTFPL"
}

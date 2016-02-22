# Maintainer: Jordan Klassen <jordan@klassen.me.uk>
pkgname='teamspeak3-addon-installer'
pkgver=0.1
pkgrel=1
pkgdesc='Simple script to install packages from Teamspeak 3'\''s addon site. Automatically creates packages for the teamspeak directory'
arch=('any')
url='https://github.com/forivall/aur-packages'
license=('WTFPL')
depends=('teamspeak3')
source=('teamspeak3-install-addon')
sha1sums=('37fd0ed23676d784b2c988aeda99d810719bbeff')

package() {
  mkdir -p -- "$pkgdir/usr/bin"
  cp "teamspeak3-install-addon" "$pkgdir/usr/bin/teamspeak3-install-addon"
}

# vim:set ts=2 sw=2 et:

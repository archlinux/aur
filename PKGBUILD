# Maintainer: Stefan Seering <stefanarch@gmx.de>
pkgname='teamspeak-soundpack-portal'
pkgver=1
pkgrel=9
pkgdesc='Soundpack for Teamspeak 3. Making it sound like the game Portal.'
arch=('any')
url='http://addons.teamspeak.com/directory/skins/sound-packs/Portal-Sound-Pack.html'
license=('Unknown')
depends=('teamspeak3')
source=('portal.zip::http://addons.teamspeak.com/directory/addon/download/Portal-Sound-Pack.html')
sha1sums=('cbfd9a69423ac839afd3b0a7dc84e40c79150c7f')

package() {
  cd -- "$srcdir/sound"
  mkdir -p -- "$pkgdir/opt/teamspeak3/sound"
  find portal -type f -exec chmod a-x -- {} \+
  cp -R -- portal "$pkgdir/opt/teamspeak3/sound"
}

# vim:set ts=2 sw=2 et:

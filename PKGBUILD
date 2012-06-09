# Maintainer: Frederik "Freso" S. Olesen
pkgname=teamspeak3-soundpack-rc1-female
pkgver=1
pkgrel=1
pkgdesc="Soundpack for Teamspeak 3 from the RC1 release. Features a British female voice."
arch=(any)
url="http://addons.teamspeak.com/directory/skins/sound-packs/TS3-RC1-Female-Sound-Pack-%28Brit%29.html"
license=(unknown)
depends=('teamspeak3')
changelog=ChangeLog
source=('TS3-RC1 Female.zip::http://addons.teamspeak.com/index.php?option=com_mtree&task=att_download&link_id=280&cf_id=24')
md5sums=('16890af67434016677540483ea162ab2')
sha1sums=('61245a8c70cbf9789579a21e8e6ee0f42a5fe0b3')

package() {
  _zipdir="TS3-RC1 Female"
  cd "$srcdir/$_zipdir"
  install -d "$pkgdir/opt/teamspeak3/sound/$_zipdir"
  install -m644 -t "$pkgdir/opt/teamspeak3/sound/$_zipdir" *.*
}

# vim:set ts=2 sw=2 et:

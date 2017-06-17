# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

pkgname=soundfont-sso-sf2
pkgver=1.0
pkgrel=1
pkgdesc="The Sonatina Symphonic Orchestra by Mattias Westlund. (SF2 format)"
arch=('any')
url="http://sso.mattiaswestlund.net"
license=("unknown")
groups=('soundfonts')
source=("http://ftp.osuosl.org/pub/musescore/soundfont/Sonatina_Symphonic_Orchestra_SF2.zip")
md5sums=('5128567e7c85efc596fcb8eb46a160d0')

package() {
  install -Dm644 "Sonatina_Symphonic_Orchestra.sf2" "$pkgdir/usr/share/soundfonts/Sonatina_Symphonic_Orchestra.sf2"
}

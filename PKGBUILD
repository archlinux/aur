# Maintainer: Patrick Mischke

pkgname=ttf-abuse
pkgver=1.0
pkgrel=1
pkgdesc="Abuse is a font to inspired by the culture of Calligraffiti, that is an art form combines calligraphy, typography, and graffiti."
arch=(any)
url="https://www.dafont.com/abuse-2.font"
license=('custom:personal use')
depends=('fontconfig')
source=("$pkgname.zip::https://dl.dafont.com/dl/?f=abuse_2")
sha256sums=('2f0c5f98c416f109cdb4896f958476609793f81943e0b30832fa06f5de8cef64')


package() {

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/"*.txt "$pkgdir/usr/share/licenses/$pkgname"

}


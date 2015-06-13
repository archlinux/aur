# Contributor: Roberto Alsina <ralsina@netmanagers.com.ar>

pkgname=ttf-orthodox-herbertarian
pkgver=1
pkgrel=2
pkgdesc="The Dune Font"
arch=('any')
url="http://dunefont.dribble-sponge.co.uk/?p=109"
license=('custom:Public domain')
depends=('fontconfig' 'xorg-font-utils')

install=ttf.install
source=('http://dunefont.dribble-sponge.co.uk/ccount/click.php?id=2')
md5sums=('1a084c983b5136e35914a4981ce87644')

package() {
    cd "$srcdir"
    install -Dm 644 click.php?id=2 "$pkgdir/usr/share/fonts/TTF/orthodoxherbertarian.ttf"
}

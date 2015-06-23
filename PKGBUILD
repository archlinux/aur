# Maintainer: "devzero" (Tim Rice) <t dot rice at ms dot unimelb dot edu dot au>
pkgname=ttf-sans-bullshit-sans
_realname=SansBullshitSans
pkgver=1.0
pkgrel=2
pkgdesc="The font that replaces every buzzword by a Comic Sans-styled censorship bar."
arch=(any)
url="http://www.sansbullshitsans.com/"
license=('APACHE')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://pixelambacht.nl/downloads/${_realname}.ttf)

build() { :
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}
md5sums=('1b1644f29e2f9981d1d67b561bb47348')

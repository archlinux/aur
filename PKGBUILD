# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: "devzero" (Tim Rice) <t dot rice at ms dot unimelb dot edu dot au>
pkgname=ttf-sans-bullshit-sans
_realname=SansBullshitSans
pkgver=1.0
pkgrel=3
pkgdesc="The font that replaces every buzzword by a Comic Sans-styled censorship bar."
arch=(any)
url="http://www.sansbullshitsans.com/"
license=('APACHE')
source=(https://pixelambacht.nl/downloads/${_realname}.ttf)
md5sums=('1b1644f29e2f9981d1d67b561bb47348')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

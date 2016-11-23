# Maintainer: crocket <crocket@no.email>
# Contributor: Wolfwood <wolfwood.thg at gmail dot com>

pkgname=ttf-unfonts-core
pkgver=1.0.2
pkgrel=8
pkgdesc="It is a set of Korean TrueType fonts derived and slightly modified from the HLaTeX's PostScript fonts."
arch=('any')
url="http://kldp.net/projects/unfonts/"
license=('GPL')
install=ttf-unfonts-core.install
source=("https://kldp.net/unfonts/release/2607-un-fonts-core-1.0.2-080608.tar.gz")
sha256sums=('3b0a7274f9aab7e8f0f1938c01a70e1581766d51b494ba145683f37ac557918e')

package() {
    fontdir=${pkgdir}/usr/share/fonts/TTF/
    docdir=${pkgdir}/usr/share/doc/ttf-unfonts-core/
    install -d $fontdir $docdir
    install -D -m644 ${srcdir}/un-fonts/Un*.ttf $fontdir
    install -D -m644 ${srcdir}/un-fonts/{COPYING,README} $docdir
}

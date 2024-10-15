# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christopher Rogers <slaxemulator@gmail.com>

pkgname=jnetmap
_pkgname=jNetMap
pkgver=0.5.5
subver=703
pkgrel=1
pkgdesc="Graphical network monitoring and documentation tool"
arch=('any')
url="http://rakudave.ch/jnetmap"
license=('GPL3')
depends=('java-runtime')
provide=('jnetmap')
conflicts=('jnetmap')
source=(https://sourceforge.net/projects/$pkgname/files/$_pkgname%20$pkgver/$pkgname-$pkgver-703_all.deb)
sha256sums=('b1b16ed96adaa1169c89ea657a13f7f5395181af0691e2e0e4e10192bda16ffb')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/jnetmap "${pkgdir}/usr/bin/jNetMap"
}

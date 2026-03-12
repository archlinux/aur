# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christopher Rogers <slaxemulator@gmail.com>

pkgname=jnetmap
_pkgname=jNetMap
pkgver=0.5.6.739
_pkgver=0.5.6
subver=739
pkgrel=1
pkgdesc="Graphical network monitoring and documentation tool"
arch=('any')
url="http://rakudave.ch/jnetmap"
license=('GPL3')
depends=('java-runtime')
provide=('jnetmap')
conflicts=('jnetmap')
source=(https://rakudave.synology.me/jnetmap/${pkgname}-${_pkgver}-${subver}_all.deb)
sha256sums=('6a752e9e6971ce3c7553952f115c289c079a2d77d8e48c36741e8e2b4dd71fff')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/jnetmap "${pkgdir}/usr/bin/jNetMap"
}

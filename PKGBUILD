# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

_pkgname='SmartAmp'
pkgname='smartamp'
pkgdesc=' Next-level guitar tone powered by machine learning.'
pkgver=1.2.0
pkgrel=1
groups=('vst-plugins' 'vst3-plugins' 'pro-audio')
depends=('freetype2' 'curl')
makedepends=()
optdepends=()
conflicts=('smartamp-git')
replaces=('smartamp-git')
arch=('x86_64')
url='https://guitarml.com/smartamp.html'
license=('APACHE')
source=("https://github.com/GuitarML/SmartGuitarAmp/releases/download/v${pkgver}/SmartAmp.vst3.zip")
sha512sums=('e1b3df62d78fae0d97fc02bbad98d1215e7baa2c11bc0ab4f9cd9d1e44e63d18f3b47174dc7f2253bf9ac51439de04eff166d81d077cf37b45b07326f988127d')

package () {
    mkdir -p "${pkgdir}/usr/lib/vst3"
    cp -ar "${srcdir}/SmartAmp.vst3" "${pkgdir}/usr/lib/vst3/"
}

# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

_pkgname='SmartGuitarPedal'
pkgname='smartpedal'
pkgdesc=' Guitar plugin made with JUCE that uses neural network models to emulate real world hardware.'
pkgver=1.2.0
pkgrel=1
groups=('vst-plugins' 'vst3-plugins' 'pro-audio')
depends=('freetype2' 'curl')
makedepends=()
optdepends=()
conflicts=('smartpedal-git')
replaces=('smartpedal-git')
arch=('x86_64')
url='https://www.facebook.com/smartguitarml'
license=('APACHE')
source=("https://github.com/GuitarML/SmartGuitarPedal/releases/download/v${pkgver}/SmartPedal.vst3.zip")
sha512sums=('d543957892ea01808947d71585ae50a20fd8f8dc3bdeec3f26f8f661b8d502fbef478b265ea78cab5b7d7bf8027175a459f666599145590025b485840f1561e4')

package () {
    mkdir -p "${pkgdir}/usr/lib/vst3"
    cp -ar "${srcdir}/SmartPedal.vst3" "${pkgdir}/usr/lib/vst3/"
}

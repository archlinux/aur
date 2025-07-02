# Maintainer: Frederick Price <fprice@pricemail.ca>
pkgname=graillon-free
pkgver=3.1.1
pkgrel=3
pkgdesc="Graillon-free LV2 and VST3 vocal plugin from Auburn Sounds"
arch=('x86_64')
url="https://www.auburnsounds.com/products/Graillon.html"
license=('custom')
groups=('pro-audio' 'vst3-plugins')
depends=('glibc')
# https://www.auburnsounds.com/downloads/Graillon-FREE-3.1.1.zip
source=("https://www.auburnsounds.com/downloads/Graillon-FREE-${pkgver}.zip")
sha512sums=('ec35ce1179f793991965699c8bba613184a8297b8ca71d79f0bd3a508ed9b931fbdf773a34db587120d855dc21e3af2ed999fe010ad1a1e53c0a494a423bd2dd')

package()
{
    install -Dm755 "${srcdir}/Graillon-FREE-${pkgver}/Linux/Linux-64b-LV2-FREE/Auburn Sounds Graillon 3.lv2/AuburnSoundsGraillon3.so" "${pkgdir}/usr/lib/lv2/auburn-sounds-graillon-free.lv2/AuburnSoundsGraillon3.so"
    install -Dm755 "${srcdir}/Graillon-FREE-${pkgver}/Linux/Linux-64b-LV2-FREE/Auburn Sounds Graillon 3.lv2/manifest.ttl" "${pkgdir}/usr/lib/lv2/auburn-sounds-graillon-free.lv2/manifest.ttl"

    install -Dm755 "${srcdir}/Graillon-FREE-${pkgver}/Linux/Linux-64b-VST3-FREE/Auburn Sounds Graillon 3.vst3/Contents/x86_64-linux/Auburn Sounds Graillon 3.so" "${pkgdir}/usr/lib/vst3/Auburn Sounds Graillon 3.vst3/Contents/x86_64-linux/Auburn Sounds Graillon 3.so"

    install -Dm644 "${srcdir}/Graillon-FREE-${pkgver}/license.html" "${pkgdir}/usr/share/licenses/AuburnSoundsGraillonFree/license.html"
}


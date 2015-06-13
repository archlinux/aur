# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kyoutubetomp3
pkgver=2.10.4.1435
pkgrel=1
pkgdesc="Extract audio from YouTube, Vimeo, Facebook and other online video hosting services."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-youtubetomp3"
license=('custom:eula')
depends=('qt5-script' 'portaudio' 'ffmpeg-compat' 'ffmpeg-compat-55>=2.3.4-2')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('386dfa4085efcd9403c4387c7be4dd0f9762c726555b5ebd0126dcd225bcf828'
            'b25f830bb1fe559ea9f0b35cc9eb8ab75e2e40d09b8755f937451f5ddeeec2fd')
sha256sums_i686=('c35fa49cbe8ac4a247e4a638ec4fbf720da90c8816b29f26d72ecff04868a763')
sha256sums_x86_64=('75f2dc088966e0c006478c867ae8ba274b739c8c8bfb45e70abeba7f43259a05')

package() {
  install -m 755 -D "${srcdir}/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 -D "${srcdir}/${pkgname}/doc/eula" "${pkgdir}/usr/share/licenses/${pkgname}/eula" 
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m 755 -D "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

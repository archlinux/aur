pkgname=vazirmatn-fonts
pkgver=32.0.0
pkgrel=2
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://github.com/rastikerdar/vazirmatn"
arch=(any)
license=('OFL')
provides=('vazir-fonts' 'vazirmatn' 'vazirmatn-fonts')
conflicts=('vazirmatn')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazirmatn-v${pkgver}.zip"
        "LICENSE::https://raw.githubusercontent.com/rastikerdar/vazirmatn/master/OFL.txt")
sha256sums=('41fe7c20dbbf6a4cf3e297b556fb0cf8f4d71fb911712d0dc00900446d306aea'
            '17e355067c8284f47743a1ee3b1ef7ff684ff0601eda357f9353b10b3016ab31')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./Round-Dots/fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./misc/Farsi-Digits/fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./misc/Farsi-Digits-Non-Latin/fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./misc/Non-Latin/fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./misc/UI/fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./misc/UI-Farsi-Digits/fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./misc/UI-Farsi-Digits-Non-Latin/fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./misc/UI-Non-Latin/fonts/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}

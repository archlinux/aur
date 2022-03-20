# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazirmatn-fonts
pkgver=32.101
pkgrel=1
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://github.com/rastikerdar/vazirmatn"
arch=(any)
license=('OFL')
provides=('vazir-fonts' 'vazirmatn' 'vazirmatn-fonts')
conflicts=('vazirmatn')
replaces=('vazir-fonts')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazirmatn-v${pkgver}.zip"
        "LICENSE::https://raw.githubusercontent.com/rastikerdar/vazirmatn/master/OFL.txt")
sha256sums=('a13974e0a8a7df50cc8f3e0404e43e5d2ab155732c69db2edcfdd4af883091e1'
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

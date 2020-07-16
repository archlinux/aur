# Maintainer: Jan Hagelauer <jan-one at pm dot me>
pkgname=ttf-catamaran-sans
_commit='cf5f213159d5ebd3209fd5bf17f8d208e8674873'
pkgver=2.000
pkgrel=1
pkgdesc='Unicode-compliant Latin and Tamil text type family designed for the digital age by Pria Ravichandran.'
arch=(any)
url='https://fonts.google.com/specimen/Catamaran'
license=('custom:SIL Open Font License v1.1')
conflicts=('ttf-google-fonts-git')
source=("Catamaran-Black-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-Black.ttf"
				"Catamaran-Bold-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-Bold.ttf"
				"Catamaran-ExtraBold-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-ExtraBold.ttf"
				"Catamaran-ExtraLight-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-ExtraLight.ttf"
				"Catamaran-Light-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-Light.ttf"
				"Catamaran-Medium-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-Medium.ttf"
				"Catamaran-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-Regular.ttf"
				"Catamaran-SemiBold-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-SemiBold.ttf"
				"Catamaran-Thin-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/static/Catamaran-Thin.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/${_commit}/ofl/catamaran/OFL.txt")
sha256sums=('78925e4fbccdc167203d2eca98e216508659f70b702bc398426d18645b08d771'
            '1eff22f6c04cad1eba4b30d53b5b8f28856ffc71192c295766b5872c0071688d'
            '39cfa0baed180a3dfbb8c51729c996b98f6952a7e9e498945894bd3df27d1fae'
            'd7a16305c919ca8ba49a448846f6584149af45a69b7b4078f8d8efea119d5c10'
            'ce75ff36ebb83e27b1cc2b80c6e3d5e93066f424cdcbabf043dac3868f4afc32'
            '290fa0a21d2b5e61353b20efb897f7135eefce7b36e2b252da074c7fec542c2a'
            '36b48aab35f52b4ccb826afb0308bdc1ad932d6315ad18d5c5e0426153da72b1'
            'ae0397d8f7e0980d56a55a851222a2b8f42c3ba1e9129bf5b276dd52f55d71d9'
            'd535797e4a721403261ee955ad7e66a621547ac1802724beb0067ec5cedac607'
            'c88333734ad7cd30540ec6614d12aa829a0395715de30e336d22ddfa3005db42')
package() {
	install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 Catamaran-Black-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-Black.ttf"
  install -m 644 Catamaran-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-Bold.ttf"
  install -m 644 Catamaran-ExtraBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-ExtraBold.ttf"
  install -m 644 Catamaran-ExtraLight-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-ExtraLight.ttf"
  install -m 644 Catamaran-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-Light.ttf"
  install -m 644 Catamaran-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-Medium.ttf"
  install -m 644 Catamaran-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-Regular.ttf"
  install -m 644 Catamaran-SemiBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-SemiBold.ttf"
  install -m 644 Catamaran-Thin-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Catamaran-Thin.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

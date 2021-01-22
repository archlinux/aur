# Maintainer: ju.adde-gmail-com

pkgname=flutter-chromium
pkgver=1
pkgrel=1
pkgdesc="Environment variable setting to use chromium with flutter instead of chrome"
arch=("any")
license=("GPL")
optdepends=("flutter-beta")
source=(flutter-chromium.sh flutter-chromium.csh)
sha512sums=('f2c331e6d153979bd178f94cdaf26927ad8df6dd0bcd1299ba57176a1b6c7723f0e32d0b0de7b919279150936ee0acf4fac66700bd4eebc1bb03a8c95b340c3c'
            'a4060e7144db16d45a3f0ca41a2eccc1c266df40571dddaeb00cb03a640de00612a12ff95a55fb13ee248419d186a78f16d05ba3aed305a55d4961ef87e62833')

package() {
	install -m755 -d "${pkgdir}/etc/profile.d"
    install -m644 "${srcdir}/flutter-chromium.sh" "${srcdir}/flutter-chromium.csh" "${pkgdir}/etc/profile.d"
}

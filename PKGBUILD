# Maintainer: nastyagrifon AT pm DOT me

pkgname=3wifi-wpa-wordlist
pkgver=2022.12.05
pkgrel=1
pkgdesc="WPA wordlist based on 3WiFi database"
url="https://3wifi.stascorp.com/"
arch=('any')
license=('custom')
source=("https://3wifi.stascorp.com/3wifi-dic-2022-12-05.7z")
sha256sums=('1665943e1e973514bdc03a61c8ab9972ae92dd1471a2a87283923e68d0a8cbe0')
b2sums=('9d508b817ecc9e48c0002d010d4feac7f38d3191c3f0ec5fba0c4482dac73da884cd1b6f2eba61165faf5a0ef336ca41021f988b926dd1c9af1ca6e8f5cd04eb')

#prepare() {
#	
#}

package() {
  mkdir -p ${pkgdir}/usr/share/wordlists

  cd ${srcdir}
  install -m644 3WiFi_WiFiKey.txt ${pkgdir}/usr/share/wordlists/${pkgname}-${pkgver}.txt
}

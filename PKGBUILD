# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('eist-returns')
pkgver=1.0.1
pkgrel=2
pkgdesc="Arcade-puzzle game"
arch=('i686' 'x86_64')
url="https://github.com/nwg-piotr/EistReturns"
license=('GPL3')
depends=('java-runtime=8' 'java8-openjfx' 'ffmpeg2.8' 'gstreamer' 'libxtst' 'qt5-base' 'webkit2gtk')
source=("https://github.com/nwg-piotr/EistReturns/raw/master/arch/eist-returns.jar"
"https://github.com/nwg-piotr/EistReturns/raw/master/arch/eist-returns.png"
"https://github.com/nwg-piotr/EistReturns/raw/master/arch/eist-editor.png"
"https://github.com/nwg-piotr/EistReturns/raw/master/arch/eist-returns"
"https://github.com/nwg-piotr/EistReturns/raw/master/arch/eist-returns-editor"
"https://github.com/nwg-piotr/EistReturns/raw/master/arch/eist-returns.desktop"
"https://github.com/nwg-piotr/EistReturns/raw/master/arch/eist-editor.desktop")
md5sums=('8a99c87700c73ba31204e7ff35093eb2'
         '5ce6928eb681ed62b1028b17f7f372b6'
         'edd0e85ff15b8c02c69c766d59443b74'
         'bd051e745cca93a3b94e345c5b2b91bc'
         '383df4312ae0ecc349de9497f7e5223e'
         '06bebf78490e6320806174e783b0d2d5'
         '774301279c5650008231c44da461fc41')

package() {
	install -D -m 755 eist-returns.jar \
 	 "$pkgdir"/usr/share/java/eist-returns/eist-returns.jar
 	install -D -m 755 eist-returns.desktop \
 	 "$pkgdir"/usr/share/applications/eist-returns.desktop
 	install -D -m 755 eist-editor.desktop \
     "$pkgdir"/usr/share/applications/eist-editor.desktop
	install -D -m 755 eist-returns \
 	 "$pkgdir"/usr/bin/eist-returns
 	install -D -m 755 eist-returns-editor \
      "$pkgdir"/usr/bin/eist-returns-editor
 	install -D -m 644 eist-returns.png \
 	 "$pkgdir"/usr/share/eist-returns/eist-returns.png
 	install -D -m 644 eist-editor.png \
     "$pkgdir"/usr/share/eist-returns/eist-editor.png
}

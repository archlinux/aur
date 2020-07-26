# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>
# Contributor: David Arroyo <david.a.arroyo@gmail.com
# Contributor: William Giokas <1007380@gmail.com>

# Note: many packages on the font size download page provide only
# "bitmap fonts", which are provided in .fon format and are thus
# Windows-compatible only and are excluded from this package.

pkgname=proggyfonts
pkgver=0.2
pkgrel=1
arch=('any')
pkgdesc='A set of fixed-width fonts designed for code listings.'
url='http://upperbounds.net'
license=('custom')
depends=('xorg-mkfontdir' 'xorg-mkfontscale' 'fontconfig')
install="$pkgname.install"
source=("$pkgname.install"
        "CodingFontTobi.zip::http://upperbounds.net/download/download_bridge.php?get=CodingFontTobi.zip"
        "Crisp.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=Crisp.ttf.zip"
        "PixelCarnageMono.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=PixelCarnageMono.ttf.zip"
        "ProggyClean.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggyClean.ttf.zip"
        "ProggyCleanCP.pcf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggyCleanCP.pcf.zip"
        "ProggyCleanSZ.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggyCleanSZ.ttf.zip"
        "ProggyCleanSZBP.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggyCleanSZBP.ttf.zip"
        "ProggySmall.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggySmall.ttf.zip"
        "ProggySquare.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggySquare.ttf.zip"
        "ProggySquareSZ.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggySquareSZ.ttf.zip"
        "ProggyTiny.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggyTiny.ttf.zip"
        "ProggyTinySZ.ttf.zip::http://upperbounds.net/download/download_bridge.php?get=ProggyTinySZ.ttf.zip"
        "Progsole.bdf.zip::http://upperbounds.net/download/download_bridge.php?get=Progsole.bdf.zip"
        "SpeedyPCF.zip::http://upperbounds.net/download/download_bridge.php?get=SpeedyPCF.zip"
        "Opti.pcf.gz::http://upperbounds.net/download/download_bridge.php?get=Opti.pcf.gz"
        "OptiSmall.pcf.gz::http://upperbounds.net/download/download_bridge.php?get=OptiSmall.pcf.gz"
        "WebbyCaps.pcf.zip::http://upperbounds.net/download/download_bridge.php?get=WebbyCaps.pcf.zip"
        "WebbySmall.pcf.zip::http://upperbounds.net/download/download_bridge.php?get=WebbySmall.pcf.zip")
noextract=('Opti.pcf.gz'
           'OptiSmall.pcf.gz'
           'WebbyCaps.pcf.gz')
sha256sums=('d6642190eb289e690c0685a0d186e87234e268c29a8d176825b9e1df1316b5f0'
            'dc4a7dee5901205a62fdd2882aef5a151a4573df8046ccdd5487331522ac6030'
            'bb078c28383b33ba45d9d804b5e14129cd9898ba2492213d1550aa584167a5c8'
            '6977862535adfba326dc7d78daab749e97c2fabfc7c68d2f9210f209541e7b40'
            '0009f3cd9622966c0bc81d61b14ada0a54f71b1ec7629e5b0f97cf2a44ff33c7'
            '2ada907b8422a98c75ecaf1678ba73b31922434f32fab9b1996607e3abaf1d1c'
            '063400d14c91adfa1e885fb1aeee1dac9a839ce4dd39b5f676bd7466b7af7e4b'
            '3c6d71e0fcf1e7ab7d9fde576750159dc3c93fca8147367fe00417d9766652a3'
            '9b0009d2aeb50cbbaff9e7a5b06f2632bf12265c1ce315edf76847bc3638cc23'
            '422160f2631ea1ec0ffb58b40a488b0ed4654f55509aedda60567639ab238200'
            '8d48ae4d413e851bb4bf7ae1b7ec5328dcabdfc2c48d79de4e48bd4b54be09f4'
            '9c9877f0b91fa63091da4188778fe9e45a6ed679e6f6d45db23281bb26a9ea55'
            '71c1cafbf4912524d4e304652c22f7cf2825fe1b5f877f94a551d6e15b2eb4e8'
            'c6f2c19bcb8554a7a0135aa1ba29341c9c58519aa26a933b9463cef2fd6be294'
            'c76f4febe5bce846d3eabd0bc2932edf10b677078960148a4eb35cf5d9f98c57'
            '3ff812820cf61253a75e5fd990ef66f6069cce1b92ec536c51d40d8bc057108f'
            '88926010ab36cbc52ab66af56843b69cebb1ba475ffc2372d6e4d03559a130ee'
            'c0dc6c6785d71beac53b87fe8ff4f620d990bd3316943756bca988587a7c003a'
            'e06a85c2100f40c47cf58e4d82dfaffe5917baaace3962e3495fa8de021002d0')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/"{misc,TTF}

  install -m644 *.pcf.gz "$pkgdir/usr/share/fonts/misc"
  install -m644 *.bdf    "$pkgdir/usr/share/fonts/misc"
  install -m644 *.ttf    "$pkgdir/usr/share/fonts/TTF"

  install -D -m644  Licence.txt \
                    "$pkgdir/usr/share/licenses/proggyfonts/LICENSE"
}

# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=pixelitor
pkgver=4.3.1
pkgrel=1
pkgdesc='Advanced image editor with support for layers, layer masks, text layers, multiple undo, blending modes, cropping, Gaussian blurring, unsharp masking, histograms, etc.'
arch=('any')
url='https://pixelitor.sourceforge.io/'
license=('GPL3')
depends=('hicolor-icon-theme' 'java-runtime')
source=("https://github.com/lbalazscs/Pixelitor/releases/download/v$pkgver/Pixelitor-$pkgver.jar"
        "https://github.com/lbalazscs/Pixelitor/raw/v$pkgver/src/main/resources/images/pixelitor_icon256.png"
        "https://github.com/lbalazscs/Pixelitor/raw/v$pkgver/src/main/resources/images/pixelitor_icon48.png"
        'pixelitor.sh'
        'io.sourceforge.Pixelitor.metainfo.xml'
        'io.sourceforge.Pixelitor.mime.xml'
        'io.sourceforge.Pixelitor.desktop')
sha256sums=('ae0147e52af8e430d971572056dca4bbdc4b613d544c3b19ac4b9376c4c40b83'
            '1bdace2276459eaffe6e71bdc1cab3ee6ec0c4734ddfd8e488357f247708e95f'
            '672e731fb58e22348ef4891e67c3ab2afed25bc2e319512620b2c51eb1d5bbe0'
            'e115a95154386e33e342d8e445b5d157db5bebe9a8f1b5a2d92a351b098b0ad5'
            'fc38d53f671fd6ca2727d811bc2bfe55c353684e1827be8a75ccc000f9cf1dd2'
            '11efc90f5ee4a69ccdfb8c5f609b7061a91051d3fac437ef794f8d0b03ef4911'
            'd352a976516f5f85198c2b914de9451c9cdb701a867ec1482ad44c4cb18ba2dd')

package() {
  install -Dm755 pixelitor.sh "$pkgdir"/usr/bin/pixelitor
  install -Dm644 Pixelitor-$pkgver.jar "$pkgdir"/usr/share/java/$pkgname/pixelitor.jar
  install -Dm644 pixelitor_icon256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/io.sourceforge.Pixelitor.png
  install -Dm644 pixelitor_icon48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/io.sourceforge.Pixelitor.png
  install -Dm644 io.sourceforge.Pixelitor.desktop "$pkgdir"/usr/share/applications/io.sourceforge.Pixelitor.desktop
  install -Dm644 io.sourceforge.Pixelitor.metainfo.xml "$pkgdir"/usr/share/metainfo/io.sourceforge.Pixelitor.metainfo.xml
  install -Dm644 io.sourceforge.Pixelitor.mime.xml "$pkgdir"/usr/share/mime/io.sourceforge.Pixelitor.mime.xml
}

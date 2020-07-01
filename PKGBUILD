# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
pkgname=ttf-zelda
pkgver=1.1
pkgrel=2
pkgdesc="A collection of fonts from the Legend of Zelda universe"
arch=('any')
url="http://www.zeldauniverse.net/media/fonts/"
provides=('ttf-font')
license=('GPL')
noextract=()

_source_base_url=http://www.zeldauniverse.net/media-files/typography/
source=("${_source_base_url}Triforce.ttf"
        "${_source_base_url}HylianSymbols.ttf"
        "${_source_base_url}Pretendo.ttf"
        "${_source_base_url}ContinuumRegular.ttf"
        "${_source_base_url}Gamecuben.ttf"
        "${_source_base_url}Ravenna.ttf"
        "${_source_base_url}AncientHylian.otf"
        "${_source_base_url}AmericanUncDRegular.ttf"
        "${_source_base_url}SherwoodRegular.ttf"
        "${_source_base_url}Hylian64.ttf"
        "${_source_base_url}ZeldaDXTTBRK.ttf"
        "${_source_base_url}ReturnofGanon.ttf"
        "http://www.zeldauniverse.net/wp-content/uploads/2012/01/skyward_sword_ancient_hylian___font_by_sarinilli-d4l1t18.zip"
        "http://www.zeldauniverse.net/wp-content/uploads/2012/01/gerudo_typography___font___9_jan___12_minor_update_by_sarinilli-d4ln2mn.zip"
        "https://zeldauniverse.net/wp-content/uploads/2014/01/HyliaSerif-v0.009.zip"
        "https://zeldauniverse.net/wp-content/uploads/2014/01/Charlemagne.zip")
md5sums=('3cf0469a6f23aefd25032f8bbc3587e5'
         'f6f44f2d7890f20ec62ecdae68c249f3'
         '487390d5558cff7a17ce35d7d92a0540'
         'ac5b280746e5eee7d336afd6f68ec437'
         'd2639bbd2646a188110e8270ec817322'
         '99f4b3cf2f8cad37b9463e3b1ff62a5f'
         'd4d1dfbaec37f60aea2f94359fac262c'
         'd3ecd5efc0b0583518b34e1ebe3f944f'
         '11f9580820728d8dc9655421a95f026a'
         '09559edd2f5b684a8587b094d7a95f1d'
         '630456bff8d3c11ea4511ef8b7184ae3'
         '3c27910b481c2d2f780ce08ab2532038'
         '7354ad6c714b905caec1cf1d7b6301c4'
         'bcad6b509e3fab3a5f9ec471dc3faf6b'
         '6e1c9c08f72a51f5c36f590863676520'
         'b194178d07e97dd558660e4f20f40202')


package() {
  cd "$srcdir"

  rm -r "__MACOSX"

  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  find . -iname \*.ttf -exec install -Dm644 "{}" "$pkgdir/usr/share/fonts/TTF/" \;
  find . -iname \*.otf -exec install -Dm644 "{}" "$pkgdir/usr/share/fonts/TTF/" \;
}

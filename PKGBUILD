# Contributor: pyjano <pyjano at protonmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>

pkgname=otf-ibm-plex
epoch=1
pkgver=1.0.0
pkgrel=1
pkgdesc="IBM Plex typefaces in otf format"
url="https://github.com/IBM/plex"
arch=('any')
license=('custom')
source=(
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-math%40${pkgver}/ibm-plex-math.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-mono%40${pkgver}/ibm-plex-mono.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans%40${pkgver}/ibm-plex-sans.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-arabic%40${pkgver}/ibm-plex-sans-arabic.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-condensed%40${pkgver}/ibm-plex-sans-condensed.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-devanagari%40${pkgver}/ibm-plex-sans-devanagari.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-hebrew%40${pkgver}/ibm-plex-sans-hebrew.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-jp%40${pkgver}/ibm-plex-sans-jp.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-kr%40${pkgver}/ibm-plex-sans-kr.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-tc%40${pkgver}/ibm-plex-sans-tc.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-thai%40${pkgver}/ibm-plex-sans-thai.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-sans-thai-looped%40${pkgver}/ibm-plex-sans-thai-looped.zip"
    "https://github.com/IBM/plex/releases/download/%40ibm%2Fplex-serif%40${pkgver}/ibm-plex-serif.zip"
)
sha256sums=('3a4f0beec798d1b3300f0d31f1bd9772ebaf284eaf9fc09187d87606b3cf56a6'
            '06ef4a7638fe20e96fe8fbea55f6f54a297352298e5cb74479cb1ceb7339fc1a'
            '4aef1ff11b58892e1fb18383c1ea45544f87c9793b95216a357d4009ed927361'
            '759e7a77c4dbae38371e5d3b1016e2ee5f75a164e708a960bb69d8949f0c3593'
            '4c3298d50688e08ebbc9f238a1f1dfe907f9bcdabaf0c2c3aab0fbeaa3e1d38d'
            '33d7517d3a67968f4db557a369861680c8f93e68c925754a5d7893e371d4c6c8'
            '06ad64c91a9e485a80b2c16f38e60659f0e75c0cfe3ceae23dd7830adde667c2'
            '6946948f66b511560786fd0ec7d561de985a1f6d8692b0ed44fbf7d880a994fa'
            'b977effaabce2328f888db8590f0989c162cb9a9aad9d70949f3910552e6652b'
            '38f4b86e52b5735eb926b6a0a41293ace6708632e41a0280618939d601dd5aaf'
            '1a39b37654916260791073046aa811450fd9bea63c2acb4413546636939c43a1'
            '734b854b745c715123713b283a077d587800c1de0e2d6c84e524862d58a649e6'
            'bb11f1cfe119d93e4a8d915d2d27e98c57a18f538e6fa88c5e31ea852a41233f')

package() {
  install -Dm644 ibm-plex-sans/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -d "$pkgdir"/usr/share/fonts/OTF
  find ibm-plex-math/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-mono/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-arabic/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-condensed/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-devanagari/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-hebrew/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-jp/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-kr/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-tc/fonts/complete/otf/hinted -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-thai/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-sans-thai-looped/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
  find ibm-plex-serif/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
}

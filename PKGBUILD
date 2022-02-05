# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-archivo-narrow
pkgver=3.001
pkgrel=1
_commit='be3adf257a69c3bec73fb2d0819823de5dfb8658'
pkgdesc="Grotesque sans serif typeface family from Omnibus-Type"
arch=('any')
url="https://github.com/Omnibus-Type/ArchivoNarrow"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/ttf/ArchivoNarrow-Bold.ttf"
        "$url/raw/$_commit/fonts/ttf/ArchivoNarrow-BoldItalic.ttf"
        "$url/raw/$_commit/fonts/ttf/ArchivoNarrow-Italic.ttf"
        "$url/raw/$_commit/fonts/ttf/ArchivoNarrow-Medium.ttf"
        "$url/raw/$_commit/fonts/ttf/ArchivoNarrow-MediumItalic.ttf"
        "$url/raw/$_commit/fonts/ttf/ArchivoNarrow-Regular.ttf"
        "$url/raw/$_commit/fonts/ttf/ArchivoNarrow-SemiBold.ttf"
        "$url/raw/$_commit/fonts/ttf/ArchivoNarrow-SemiBoldItalic.ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('cc3473ff135d77b582af97b0f9f576044fc3c021eee48414abac90f38a12b0e4'
            'a6521daa8d953d13334f7c1a65d7931fe8cf523a18d63ff2e200c9727b2e5d77'
            '8eba12933fa76f8e98f0cae8b82d2f0d413203876ca64b6f47b8840cf75b497d'
            '8d51fdbeb05d0465931fa645845e3c18a7aa162e5537b2c8a462a749a0e9da6b'
            '621fb8f58d705ba3bc534d4a463eb2203be5b3b2b7e6e432f21ca32f0eb0ad97'
            'b1877ca4479765df2d0fa5de3bb86f83c86577862d1e25290cd5398dcbb22d54'
            '64f06fa43714cf0697b503ed4f167ac24b60f2fcaeaa5ed9358846f97dbc3b03'
            '3e70ce2ee8668b6e239895be84c87d038474b4809512913877e9b448601d10a7'
            'a4087edf95fb2a6bd38073ad005ced611695dc9d7d8fd5d04a888ef4f9c748ea')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}

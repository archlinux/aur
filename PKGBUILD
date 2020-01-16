# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="fasttext-langid-models"
pkgdesc="Library for fast text representation and classification – pre-trained models for language identification"
url="https://fasttext.cc/docs/en/language-identification.html"

pkgver=0.0.1
pkgrel=1

arch=("any")
license=("custom:CC-BY-SA")

source=(
    "https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.bin"
    "https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.ftz"
)
sha256sums=(
    "7e69ec5451bc261cc7844e49e4792a85d7f09c06789ec800fc4a44aec362764e"
    "8f3472cfe8738a7b6099e8e999c3cbfae0dcd15696aac7d7738a8039db603e83"
)
noextract=(
    "lid.176.bin"
    "lid.176.ftz"
    )

package() {
    install -Dm0644 "${srcdir}/lid.176.bin" "${pkgdir}/usr/share/fasttext/lid.176.bin"
    install -Dm0644 "${srcdir}/lid.176.ftz" "${pkgdir}/usr/share/fasttext/lid.176.ftz"
}

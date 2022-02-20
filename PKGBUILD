# Maintainer: BrLi <brli at chakralinux dot org>

pkgname=ttf-klee-one
pkgver=1.000
pkgrel=1
pkgdesc="Klee is a script font handwritten by pencil or pen."
arch=(any)
url="https://fontworks.co.jp/fontsearch/KleePro-M/"
license=('OFL')
_commit=8b0532731b63ad8a445ca341d8d7d941079b83ab
_github_url=https://github.com/fontworks-fonts/Klee
source=("${_github_url}/raw/${_commit}/fonts/ttf/KleeOne-Regular.ttf"
        "${_github_url}/raw/${_commit}/fonts/ttf/KleeOne-SemiBold.ttf"
        "${_github_url}/raw/${_commit}/OFL.txt")
sha256sums=('74cb0a6523cc22b221ceaa7b78b56cea66512ec14b4145fd0102ffe27c30d084'
            '9dbb25466c575f6dc8768a28845798f67fa5d47a5d20a6408c30c58d700a1044'
            'e376b0df8e8a2345a9533db6f0a5333a1107975569ad9d1973a7ee557161ca38')

package() {
    install -Dm644 "${srcdir}/KleeOne-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/KleeOne-Regular.ttf"
    install -Dm644 "${srcdir}/KleeOne-SemiBold.ttf" "${pkgdir}/usr/share/fonts/TTF/KleeOne-SemiBold.ttf"
    install -Dm644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}

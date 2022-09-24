# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-chivo
pkgver=2.001
pkgrel=1
pkgdesc='Neo-grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/chivo/'
license=('OFL')
_commit='82cecb4b8c2af9aa74a1c2745987f7e463025ad1'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-BlackItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-ExtraLight.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-ExtraLightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Italic-Variable.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-SemiBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Thin.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-ThinItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo/fonts/otf/Chivo-Variable.otf")
sha256sums=('5e4ab199aee98d04ca9bed9088b793291dd03e4d775876012ab4f14de77af3fa'
            'a329b12696296889d8747b9c50bf8aed524dc0ca23a96581884f5574b4616153'
            '4f0fbcbf8d8025802d529dd642851406594c748dd2b4e012b07e8f93846a2d2d'
            '42bca09597bb58fe8aad86bc3970dc01b0a0d4c608b256ad28ed53be915c83dc'
            '2dd545d180837314f3b535a5bf982bcc7f470dd34c3cd9494e9df785cccfffa1'
            '8cdf7947e6b7afd8758be0549470241b80451d27fc8a7fcb718a174693865e01'
            '9ff89ebc6125a3fac4b4503ea4732b4df97103efc9cf2c79d710f69107cab855'
            'eccc8d4e8a24737bc44c116ebc26fc5a7564841a458c7cb9d5f256dbb61ae691'
            'c1c49795ffe42dd714bc9099b1c3fcba0978f54cb191a7271ff9ea091a882921'
            '6850386bf30ac1d4dc7505635778da096f8b2236fa38b86ef168061b97665d2f'
            'f83a9329234332ef190b61a1abe37dc2f3a5a43ab11090471b66add718efca89'
            '628d6d6212921439cd7eb569f11ccbe5815bf754a22d79a4aac10e468953e1d4'
            'fb6f219801e538bc6163e6c2b903a3c649757d97282fe98ddbe711fd78b4c5ec'
            'b92599dda6b92a9fede2ad692a389521a137994a73656eddc4466dae0493c545'
            '73e412e0588157551ef8f53801c62a86411e7b8a6a0b709edb159622bdd6b7d8'
            'b5ee4c8d4b500fb22f4f5e5881ebdbfd8007723dd31d7fd134e0e00707386973'
            'ea0251efba956d7ae200190b384512d4b2e9fe90de92fb82e46a5cd39d40ab6e'
            'd5d5bd39692d61b16b8d19b77f23a32fb33d02696627181b1cdaf0f36debc4e7'
            '5dd06216ce46f8e5c8e73bd7ad740e8480af516e50384eeb595c42ea8c6e5e6c'
            '95113eb37daa2b092fe0e8e0ba5879df130e5b41274b96d58acd845e85f8bd92'
            '53e48e76e046fa83b8cb5679e25e2c5c96e7b3be001099e25b48a60c7c53a72f')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-archivo-narrow
pkgver=3.002
pkgrel=1
epoch=1
pkgdesc='Grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/archivo-narrow/'
license=('OFL')
_commit='9793ec77b6682a26bc7a6ed523ca65cc3cb90aec'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-SemiBoldItalic.otf")
sha256sums=('b2087ef3fb91248e346600d19021249152a9688efea72905aa1996bb16a4c8de'
            '01abc409a11b765da6955fbc8243e2e8e660034cadf91d0822e2172cde26158b'
            'f6c6f56b154cc093fd939bcd5a73221d547caf3730048810c78954be67e100f3'
            '66d6909fded858d3ee0643994dbb8e50086bd282ef6497d96c5dcad094c99d0b'
            '53bad44aa071c9a1d2ef215d180fd0673f66104fbb85153bbc17ea654edbf92a'
            'f5f6123e320905c88471952d971a8cbcfc358fac5662cd988c158fe849ff59cb'
            '056b9173ebbf38670032127442fca81a5412530f0a9fdddf0ee83617f8c5a081'
            '3e196dd117ccfaf460652743bfaee5651f0956e8b4c2d71eb5e640697a1e11ad'
            'ff92bec20ba3e8fa3248a489192fd139b50911baffbe4b2321762648c840b7c3')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

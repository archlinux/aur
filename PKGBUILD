# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-grenze
pkgver=1.003
pkgrel=1
pkgdesc='Hybrid typeface family between Roman and Blackletter styles from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/grenze/'
license=('OFL')
_commit='6ea8fdca83c9f9655da7e23bf5ec002a6acf0fcc'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-BlackItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-ExtraLight.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-ExtraLightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-SemiBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-Thin.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/otf/Grenze-ThinItalic.otf")
sha256sums=('55a21d1fcebfa5e02100db3ae4dcff2658e9ba63e0b64149203bf6a9d645db86'
            'ec1739b74ea68036cd80407bdc9e514b2bab1f7451836b4e117c85afcec58e00'
            'c2bf5840193212546eb6dd923481a294a5045c32dd6125bbb438094d002cd834'
            '364a618c01e35568a62b0cf17de852fcf8b0de3b870b1916d36f6852b235b093'
            '6cfc504c5f8f81b8b9cf0bad348ee62f15e8270b5a4b0a8ef132c4da4ecf91b1'
            '45d2157b89f2e16d9e1d2d512765de5b1a2295f0341da2026ba0a38234721174'
            '7c6dd0723aff71473775763473d823e8b1d086e09141fa3409f6222cdcbffa61'
            '500d099b7f09ed865d4883977560a65bd4ff9c8e33b3efba09bd52a4cb042730'
            '43c92dbd2bad6f81ad2f60e158871e555a8a1aee3808abbb847a8c18fd5714dc'
            'e21b9706eb964e74ff069d482943c5b6dd23e56e369fd7972be36d8280480b8c'
            '66ffb2863cdf8d2f03c60337e19362825bd63e910cefbf52b7cc0f243201d215'
            '22fc018c289ab817f629c3bfb73e860f79c3048422d9b7fcd27f1933be275614'
            'ccc8167102d9aa4f2360de3a1864c288cc040c0c46a85ca93d78554bdf3b1daa'
            'd816fb91550455c58d3b7df2357889ff0cfda0835fc9ba4c9c1d4783b247f568'
            '586c22c5d7d326966867e9b744d99ccaca5bbf968ff6a333ddd6653cea5e5dbe'
            'dc915d30ed85b5a9e4f1d1040700aa7fde341d0b170d910a1e0a4631c997ea19'
            '194113ba07bdd8422897f9a16a3cace14a92572969741c0b267f891a44a434f1'
            'cc377676f06df2952b61487e1b8445f387d390a15d4fe75744015797ee6f7c72'
            '707c65d290d61536b8a6a9592e64a21c9ec41998050840fbc5fea6902a4ea4d1')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

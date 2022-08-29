# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-grenze
pkgver=1.002
pkgrel=2
pkgdesc='Hybrid typeface family between Roman and Blackletter styles from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/grenze/'
license=('OFL')
_commit='a2a182c7b828c3d6a1784ef08b22be8521b2b9a7'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-BlackItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-ExtraLight.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-ExtraLightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-SemiBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-Thin.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts-/otf/Grenze-ThinItalic.otf")
sha256sums=('3b84fe60cf47615bda9710f47d81f8935544b021f0a4846b2518489b2d2ea1a4'
            'e9718d947c2e45e5cdc924a6ebff7daabd0451308878e94c608373da20d85338'
            'ed452866c5a800d78bb7b3242b4bd277cc8300ecddb73effcec36ce0952a7e16'
            'a7a957a6410a2265708bcce3c95108c6bc308f1a17053f3f50f1b508f38c8a66'
            '08e84d7d59e929a1bd16ede2de8437c43ca04f0e9d176b813160d6486b0e33b1'
            '279ca2bf7a8a0c77e55ee3a3229db88feaf844ed5e88834a2232fdadc0f21ba2'
            '64e41f54b33c86ffb9511851935579e654717d07dc83ecd6ecbabcfc25bf6d89'
            'c7b8e2e591839635bc78a93b23fb20a15405ea7df8bb4d88206fc78ca5c6b144'
            'fa96fe93f17910703ac4a87f7086f810e07623347eb943cc5c51e4ee529b0a88'
            '7a9022b2a2e9c7135f5c1e3d772b97e7e12aad11981131f5142e8c27a9e24f3f'
            '2b7bada4662be42aaf08a88736d9021859bf2fe0105b4f3606819f71cb966463'
            'af18e749a313df720b85429225466aade5dfc0539de84b360c40a28b2ee7fefd'
            'fa020171fb5d32c8cff5ff976c02ff4e3179483f08586261df408d931136b635'
            '44caec715c1c50cafbd3a9cfb3cac3903c844416d24ec2eef9a95562df978df9'
            '8d51cb3681a5b31d421895cddab33f82f6f2c7462a2edaf285c3f961225966f2'
            '71b6d3caa4207f4829c9697b46b2677c93a790f1feac365cb0e1ee8f47200e97'
            '189255af972c05a2b54deebae9acd4d396497178e27daed1f435fab1b83c66b1'
            '45cc551e99d180bf5f145f683f0dc887784eb1b56c33a00ee4f0fd69a255df56'
            'ce94c29b3f519ccad5aa8090f688bf3c98be188254498cbd2f22f5f670c19553')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

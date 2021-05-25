# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-rosario
pkgver=1.200
pkgrel=1
pkgdesc='Sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/rosario/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Rosario/master/fonts/otf/Rosario-SemiBoldItalic.otf')
sha256sums=('944998f475ee63b332a19137840d9e334c94ec6300f8091a5049a647798ca33a'
            'a8c598cd88980d40509698fc0738a074772b810e366264a6b5f3d86b4fbddd57'
            'b9c168c1b76b8853bd76aea8536548b153634ecbe723ef7b83573c263bfe8e01'
            '0de8155294f9a2e0197204325e6721ee8ddc22512c574b57e5aa35af7c641379'
            '059fdf5d496e5c4ee84d361a40577c776a2ad0c6bbecc0eb7a9e329b8694bb2c'
            '9d3df37a8678d1def9f9f0b84533c6c3b2cddef3dd88ff8235aabca01df89ab2'
            'adb487ee239704d17b83eefe660cb69d5b99056934d11a7c97be6f9b187a8c69'
            'e73d1fc8bd1b38dfad5dba6ad73e37837ddda1615a094150fcf5b15ac6556bc2'
            'c7c64b04d9f46c18500b43a5436ab88b3c824dfb1fd2037b3592674311726654')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

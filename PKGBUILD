# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-sansita
pkgver=1.006
pkgrel=2
pkgdesc='A typeface exploring typography and calligraphy from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/sansita/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-Black.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-BlackItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-ExtraBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-ExtraBoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-LightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Sansita/master/fonts/otf/Sansita-Regular.otf')
sha256sums=('075f043ac4f61522cf01be3557066b546ae59cfb51dee5048cf9bc231796c023'
            '807ee006fe4bcbb01bc20f86fea7606953f7ad9c718c728472f1129a456b5ccf'
            'ee3a00bab9265c10ff5cb880597163b194d13a63ee354be69c904478fd34915e'
            'a11b6c41ba40bb0c42ee161ee5a93611450462ab4336a4239b5fa004163486be'
            'edeca654302018ad988a229f4def2286f382dec19c0cff5e5e5636db41757c1d'
            '4e465a0d49f1899cc7b072d5745c150a52ce6d5235ac73bb8f8049d75cb85108'
            'f41df8000c2edc9187100b3102b7f7a7fcedf8632f9c8ddc0cbaa92f0c180e7d'
            '2ec933c46363ae94a5d969d080182f4be27c2e22cca43caa7a53760611dec09d'
            'a6f11e6ca9e16ba1db25aeb527bf4e23efda1f71912b6681fc585b1bb01a3993'
            '38fffb64913b82da0e151c19d11af1a24a89a78c1072d811357692fee2df9f01'
            'e5566fc3dec8446695cdb371f446f7308ce1adbf8363c975b8e938861c3dcb55'
            'a0ddbd9fe90703c4641a601382bb1ccc7ddfb3cddd16b4169dd984456387bf80'
            '8b78a61832affbbfd1831fe2658bf7fb010a3ed830be50e2c5afbf9e031405a5')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

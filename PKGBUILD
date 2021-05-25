# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-grenze-gotisch
pkgver=1.001
pkgrel=1
pkgdesc='Peculiar version of Grenze from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/grenze-gotisch/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-Black.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-ExtraBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-ExtraLight.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/otf/GrenzeGotisch-Thin.otf')
sha256sums=('bca29af2c3c9e142d11f523f414902ab8fb9ab8ffa3c34c63b6b72aa4e7d6acc'
            '16626b530fdb5e1a4e1030b7832d625729223ad08d88a500f6d18f4e531a6060'
            'baf548f7e9030ac67e383b01ea8090bb19f8c4e09f5dcbfb6be1ae25f721e587'
            'af8a12c9fcab8019b197b6c6bac76712021405d82320fd90bddd05f37bb5fcf8'
            'f625301cd4e8e4adab07659ab9bb6f53716d9cc3b07867786be701f2e1d32417'
            '0a5db0a015cc1c804083e630c8ca176e3e8d76de6faf964baac18dd90ad9a53b'
            '4e2f21fdf9578f9f0982d1619d96923a370b782919d9afe367ffd19b8297edf8'
            '805d89f53d634434cc8c9b97b49f55983f33f3e7a84fbabc9f59193e454f7900'
            '1d4088afea223bc3860ca2e2ca08132278f3c347f66d57cd9cf81355939ede23'
            '3b89a564925f1ee4835cd13c8c11e0fa5e0576133533fb4732698958f474650f')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

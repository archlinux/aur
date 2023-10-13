# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-slab
pkgver=2.002
pkgrel=2
epoch=3
pkgdesc='Roboto Slab is a slab serif addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
license=('Apache')
_commit='1be6141f85b68b48c06ccac50d234302d6e59643'
source=("${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.txt::https://raw.github.com/googlefonts/robotoslab/${_commit}/LICENSE.txt"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-Black.ttf"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-Bold.ttf"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-ExtraBold.ttf"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-ExtraLight.ttf"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-Light.ttf"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-Medium.ttf"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-Regular.ttf"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-SemiBold.ttf"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/ttf/RobotoSlab-Thin.ttf")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '23bd6b67031e7fca0b8a5f42d73fb28ab06394f95b2d7faf7db513dcd0ea0a99'
            '09cd9e359296e2f9482e2445ba921041913b55e652645df083079a85a272fce4'
            'd92fe6a148ec6fb78af65c6249b8f9cfc95a1d00bd548ccd2cfc33034cca4c81'
            '30d92e2b447209aa9b39b5fd1d18f3552af12a9d491def5d67d1757cc078f23c'
            '78b2a573044b5635e35224fca8b44cc2b92dac9695ef18607bf12491ae3aae84'
            '84836bee027a67ffbc137f8f67269af4824163259b0de4bf90d30b412e67f07e'
            'fd4d98f8403041d58d67735f4549a42ac7cfc79464d4fac5f02345e1404dd2ca'
            'e6f84f63a76e65bb43c4fe6445e59167a0298a30f172833e5d6e6e08adcf1c8b'
            '48f7f72e33e0f4bf6bb6ad3acc3cb8712ab7b9e5c8170dfd1da70726648e83af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-mono
pkgver=2.000985
pkgrel=4
epoch=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Roboto Mono is a monospaced addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Mono'
license=('Apache')
source=('https://raw.githubusercontent.com/google/fonts/master/apache/robotomono/LICENSE.txt'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Bold.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-BoldItalic.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Italic.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Light.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-LightItalic.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Medium.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-MediumItalic.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Regular.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Thin.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-ThinItalic.ttf')
install=${pkgname}.install
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '6250e98e33a56ab2ca07bc61835a8f53ed85d231347fc9c74136c2d356b63875'
            '1810ae41851032119f44f6988d90a308c9e117e075d69cbb7ffd63a3af75f815'
            '38151927519af9365ee3f83720bb8736f892993dc6019f0ecd7bcbfba051519d'
            '4e62f5daf13403a6846a0c838e487521b56294bb5a00f07d0e75063b7ed74259'
            '2805d3d32c7da69fd92ad675fff182df61d1556337adba34a56ed7a539ca2e9c'
            '607e473da298c66f4c86abca2da5b21a5d469a8728a9e3bae2437a061a368973'
            'bedc345d490d2ae4f8644ac44a500f80e54a24ec430fe8bea2c8547ed9de4cd8'
            'bfb5fbccb5c5d32065d9029c80877a2118b4f3be06d328d7ea4420df7c0fcf64'
            'b27a635fdffee78fab7afc08b2c5d9d11c1c189dbb543d4d5852e5eb9d22655f'
            '5c851cc4efc0ce509394ea637e2dd9c9429c457a80245fc6a144fc04a8f63efe')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

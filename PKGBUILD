# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-mono
pkgver=2.000985
pkgrel=2
epoch=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Roboto Mono is a monospaced addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Mono'
license=('Apache')
source=('https://raw.githubusercontent.com/google/fonts/master/apache/robotomono/LICENSE.txt'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-Bold.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-BoldItalic.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-Italic.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-Light.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-LightItalic.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-Medium.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-MediumItalic.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-Regular.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-Thin.ttf'
        'https://github.com/google/fonts/blob/master/apache/robotomono/RobotoMono-ThinItalic.ttf')
install=${pkgname}.install
md5sums=('3b83ef96387f14655fc854ddc3c6bd57'
         'fd6e2dfdc0e85a1609486f2f13460d97'
         '1ec0dc28a2ff435cdd2b061f84e5cf2a'
         '50ca87398919a20d322a73927b1f38bc'
         '1fb2e867d7ea79803cbffe471621f7fb'
         '01ec8b091eef8410cc5964633ee25c84'
         '27051aaba28792ba5ffa2caf73c0fd08'
         '1af971e67cbb6f0a724eb43fd9e2927e'
         'ef512838b400291403759acf4062c89b'
         '21d6d1adf2c46f5a95ba8aae49b4eb93'
         '88879604cbd25924977dbe1575fab854')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

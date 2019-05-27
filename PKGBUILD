# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-mono
pkgver=2.002
pkgrel=1
epoch=1
pkgdesc='Roboto Mono is a monospaced addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Mono'
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
source=('https://github.com/google/fonts/raw/master/apache/robotomono/LICENSE.txt'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-Bold.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-BoldItalic.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-Italic.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-Light.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-LightItalic.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-Medium.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-MediumItalic.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-Regular.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-Thin.ttf'
        'https://github.com/google/fonts/raw/master/apache/robotomono/RobotoMono-ThinItalic.ttf')
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'd5ba59021ad93bc505bc7a5e317aacc8ad408b4790b49b72429ae00659238f83'
            '5f58d09712433c7f1f367ef5efb9a53c32e4fa64d8c2efadb590b61f7b434310'
            'abd8c8470d448bdee13c8ee6a9b3e5e75f52617eed83d61139d80cc947855eb1'
            '8a40d51f12d893655960757e1e1816c973c60354df294def5cca8173055b19c1'
            '4cc36f82257e6b2290242ec0ee2a87c7b1faa07e0044e484603518cf9fc5c223'
            '1e1b6ccb0d09ccad6f94cc23e03383a67d1c0f1f0889f6e45cccaf065a223003'
            'ab985cd18485de9d5b9f5ea66c2a7a04cac9b8dcd7d20b2b86561d491735b43b'
            '5d2a2caecd820a2ec200daf29a71ea672579adcb938b4bf2c51f1ee317c926b9'
            'bed66ad44715f4d7836770cd7a3f1888961179de0f59b436703e4a477f92b13a'
            'c7569d57dc40a12183a7370dc32f599f837d56f01f3bc46d08034d6d256cfc56')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

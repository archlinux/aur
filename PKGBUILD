# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Brandon Giesing <brandon@giesing.cf>
pkgname=ttf-roboto-slab
pkgver=1.100263
pkgrel=5
epoch=3
pkgdesc='Roboto Slab is a slab serif addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
source=('https://raw.githubusercontent.com/google/fonts/master/apache/robotoslab/LICENSE.txt'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotoslab/RobotoSlab-Bold.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotoslab/RobotoSlab-Light.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotoslab/RobotoSlab-Regular.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotoslab/RobotoSlab-Thin.ttf')
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'ba12d2eab1fa765b6b05398fa7e047dd76293f0c051ce57a8f7b0c591c14d42b'
            '153bf5b428d5cd0b27a63f9a36941cd7d6c7523a7afd59c76a12f798e4c33127'
            '13aa5f54c6f2fa2e388fe0e675cdbcc6a81f6270a8bf9c03a5df8af9cb022810'
            '4e2f26097538925162cad2a3e6051f659b9895386559a1890a4664d8e9a9a0c1')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

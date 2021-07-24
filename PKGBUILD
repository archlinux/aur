# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-slab
pkgver=2.001
pkgrel=1
epoch=3
pkgdesc='Roboto Slab is a slab serif addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
license=('Apache')
source=("${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.txt::https://raw.github.com/googlefonts/robotoslab/master/LICENSE.txt"
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Black.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Bold.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-ExtraBold.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-ExtraLight.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Light.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Medium.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Regular.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-SemiBold.ttf'
        'https://raw.github.com/googlefonts/robotoslab/master/fonts/ttf/RobotoSlab-Thin.ttf')
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '73d0a1630a398883b1237ad8e094ce58e2e88c576eb811bae734bb2fef29a6e0'
            'e5b9453d5981ab0511d8910ffefb593b31f6a35b84d973602aa92af4e4618170'
            '7432ea7ff5651b786002c72355422b6431f461079c1b7e9a3aafb044c43e02ed'
            'b61961a015f7d1f3159f94af388cbbab53828a60ea4811003793f23a76cb21ca'
            '81fe9e6fc750c2e560495a354850709803743f3e35c5816b1f6b4a12375faa5d'
            'ad8b6b92531939bc7fd8ca0c7ad7c2e1f42f0d7eccbfcc5a6b7c6b179812c96e'
            '1422fde7e0a715a1a8c62e25105d29683b288f23e6f5240df4c152a931f1e355'
            '63ef8e344bf3393cdd833a1c9fff57a9f26de9ce5783bac6bb52e1992b1aaa6f'
            '287a8849b02eafbc7e9a2703771a1114d2021dc00923a1bc2ab4a3a2efd7a60a')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

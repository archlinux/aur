# Maintainer: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=cgoban3
pkgver=3.5.23
pkgrel=1
pkgdesc='A KGS client and SGF editor'
url='https://gokgs.com/'
arch=('any')
license=('Freeware')
depends=('desktop-file-utils' 'java-runtime' 'bash')
install=cgoban3.install
source=(
        'http://files.gokgs.com/javaBin/cgoban.jar'
        'cgoban3'
        'cgoban3.png'
        'cgoban3.desktop'
        'cgoban3-edit.desktop'
       )
sha256sums=('9be59cad85f4bc29bfd1d0df3601916ac7748d1470b9a75aca2fdf94310c3c6b'
            'f4ad321e3aed07002581b70686c5f5298190c647f63dd4b3fa848a9756fb6f98'
            'a87ecc7d285cf19ab176a437dfb22ab8841eff2f64348cc432557d879347d510'
            'b781072cbb5ac56c102992c92307153c14842c5d9e7a6a6bbf7e397d7b714598'
            '909931d5694a205a05c602250b6b6c319cf599799dc9b1d69df0becfb768406d')
noextract=(
           'cgoban.jar'
          )

package() {
        cd ${srcdir}
        install -D -m644 cgoban.jar  "${pkgdir}/usr/share/java/cgoban3/cgoban.jar"
        install -D -m644 cgoban3.desktop "${pkgdir}/usr/share/applications/cgoban3.desktop"
        install -D -m644 cgoban3-edit.desktop "${pkgdir}/usr/share/applications/cgoban3-edit.desktop"
        install -D -m644 cgoban3.png "${pkgdir}/usr/share/pixmaps/cgoban3.png"
        install -D -m755 cgoban3 "${pkgdir}/usr/bin/cgoban3"
}

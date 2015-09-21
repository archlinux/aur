# Maintainer:  Flow

pkgname=ut2004-cbp
pkgver=1
pkgrel=1
pkgdesc="Community Bonus Pack 1 & 2 for Unreal Tournament 2004 (ut2004)"
arch=('any')
url="http://cbp.beyondunreal.com/"
license=('custom')
depends=('ut2004')

source=('https://ut.rushbase.net/beyondunreal/official/ut2004/cbp1.zip'
        'https://ut.rushbase.net/beyondunreal/official/ut2004/cbp2-volume1_zip.zip'
        'https://ut.rushbase.net/beyondunreal/official/ut2004/cbp2-volume2_zip.zip')

md5sums=('3c5b0cc278642278f3bfe154771acad6'
         '53dd8bfa1976a93d2a98dab99d23a5ad'
         '231531946eac9c19b9f7b7c04a7a44d8')

package() {

    install -d ${pkgdir}/opt/ut2004/{Animations,Maps,Music,Sounds,StaticMeshes,System,Textures}
    cp -a ${srcdir}/{Animations,Maps,Music,Sounds,StaticMeshes,System,Textures} ${pkgdir}/opt/ut2004/
}

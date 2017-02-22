# PKGBUILD: 22-Fev-2017
# Maintainer:  dysphoria <>
# Contributor: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=cgoban3
pkgver=3.5.22
pkgrel=1
pkgdesc="Kiseido Go and SGF client"
url="http://gokgs.com/"
arch=('any')
license=('Freeware')
depends=('desktop-file-utils' 'java-runtime' 'bash')
install='cgoban3.install'
source=("http://files.gokgs.com/javaBin/cgoban.jar"
        'cgoban3'
        'cgoban3.png'
        'cgoban3.desktop'
        'cgoban3-edit.desktop')
sha256sums=('459d71018e3fd5d9bbd9e34433a03d8bf32e35f5e0e0da12d7380a172a73f686'
            'f4ad321e3aed07002581b70686c5f5298190c647f63dd4b3fa848a9756fb6f98'
            'a87ecc7d285cf19ab176a437dfb22ab8841eff2f64348cc432557d879347d510'
            '8f53df2158eb96c434312b901563b4879fcea36c461f2ca99cb5cabff38ec04f'
            'a6b770b7727aae6e0699d0dce7cec84057a83670512bb17edc24753c030df55d')
noextract=('cgoban.jar')

package() {
  cd $srcdir
  install -D -m644 cgoban.jar  "$pkgdir/usr/share/java/cgoban3/cgoban.jar"
  install -D -m644 cgoban3.desktop "$pkgdir/usr/share/applications/cgoban3.desktop"
  install -D -m644 cgoban3-edit.desktop "$pkgdir/pkg/usr/share/applications/cgoban3-edit.desktop"
  install -D -m644 cgoban3.png "$pkgdir/usr/share/pixmaps/cgoban3.png"
  install -D -m755 cgoban3 "$pkgdir/usr/bin/cgoban3"
}

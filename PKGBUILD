# Contributor : Jinho Jeong <jjinho0203@gmail.com>

pkgname=ttf-d2coding
pkgver=1.1
pkgrel=1
pkgdesc="D2Coding Fixed Width TrueType fonts"
arch=('any')
url="http://dev.naver.com/projects/d2coding"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-font')
install=ttf.install
source=('http://dev.naver.com/frs/download.php/11568/D2Coding-Ver1.1-TTC-20151103.zip')
md5sums=('04b24a880d24a0203edd32ced3f0097d')

package() {
    install -dm 755 ${pkgdir}/usr/share/fonts/TTF

	install -m 644 -T ${srcdir}/D2Coding.ttc ${pkgdir}/usr/share/fonts/TTF/D2Coding.ttc
}


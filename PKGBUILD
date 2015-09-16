# Contributor : Jinho Jeong <jjinho0203@gmail.com>

pkgname=ttf-d2coding
pkgver=1.0
pkgrel=1
pkgdesc="D2Coding Fixed Width TrueType fonts"
arch=('any')
url="http://dev.naver.com/projects/d2coding"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-font')
install=ttf.install
source=('http://dev.naver.com/frs/download.php/11300/D2Coding-Ver1.0-TTC-20150911.zip')
md5sums=('5fc42a9b9396395c6bd312ca818f038c')

package() {
    install -dm 755 ${pkgdir}/usr/share/fonts/TTF

	install -m 644 -T ${srcdir}/D2Coding.ttc ${pkgdir}/usr/share/fonts/TTF/D2Coding.ttc
}


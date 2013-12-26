# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-cpma
pkgver=1.48
pkgrel=1
pkgdesc="Challenge ProMode Arena (CPMA) is a Quake3 modification which adds features aimed towards professional gamers and competitive enviroments."
url="http://eu.promode.ru/"
license=('custom')
arch=('any')
depends=('quake3')
source=('quake3-cpma.launcher' 'http://promode.ru/files/cpma148-nomaps.zip')
sha256sums=('73307f10927bef8cd29000303e1448383d1003727121fd1f7840d6db98ddca92'
            '1f0aafcaa48a16880ab4541aaa8b9d017c6c0b90c8fc0b4de871f976c05598d5')

package() {
    # Base CPMA Files
    install -d ${pkgdir}/opt/quake3/
    mv ${srcdir}/cpma ${pkgdir}/opt/quake3/

    # Install Launcher
    install -D -m 755 ${srcdir}/quake3-cpma.launcher \
        ${pkgdir}/usr/bin/quake3-cpma
}

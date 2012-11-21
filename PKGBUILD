# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-cpma
pkgver=1.48
pkgrel=1
pkgdesc="Challenge ProMode Arena (CPMA) is a Quake3 modification which adds features aimed towards professional gamers and competitive enviroments. "
url="http://eu.promode.ru/"
license=('custom')
arch=('i686' 'x86_64')
depends=('quake3')
source=('quake3-cpma.launcher' \
'http://promode.ru/files/cpma148-nomaps.zip')
md5sums=('ba3def87863a0199824902e271ae4968'
         '9d0d0277b956bc0ce0cac1f4e49fca9b')

build() {
    cd $srcdir

    # Base CPMA Files
    install -d $pkgdir/opt/quake3/
    mv $srcdir/cpma $pkgdir/opt/quake3/

    # Install Launcher
    install -D -m 755 $srcdir/quake3-cpma.launcher \
        $pkgdir/usr/bin/quake3-cpma
}

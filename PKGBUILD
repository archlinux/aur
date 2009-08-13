# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-cpma
pkgver=1.47
pkgrel=1
pkgdesc="Challenge ProMode Arena (CPMA) is a Quake3 modification which adds features aimed towards professional gamers and competitive enviroments. "
url="http://www.promode.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('quake3')
source=('quake3-cpma.launcher' \
'http://www.promode.ru/files/cpma147-nomaps.zip')
md5sums=('ba3def87863a0199824902e271ae4968'
         '922e7b4346bb2af990ac92eb2975cfea')

build() {
	cd $startdir/src/

	# Base CPMA Files
	install -d $startdir/pkg/opt/quake3/
	mv $startdir/src/cpma $startdir/pkg/opt/quake3/

    # Install Launcher
    install -D -m 755 $startdir/src/quake3-cpma.launcher \
        $startdir/pkg/usr/bin/quake3-cpma
}

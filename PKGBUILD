# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-threewave
pkgver=1.7
pkgrel=1
pkgdesc="Threewave is a modification for Quake 3 that features Capture the Flag (CTF) gameplay."
url="http://www.threewavesoftware.com/"
license="custom"
arch=('i686' 'x86_64')
depends=('quake3')
source=('http://games.mirrors.tds.net/pub/planetquake3/modifications/threewavectf/threewave_16_full.zip' \
'http://games.mirrors.tds.net/pub/planetquake3/modifications/threewavectf/threewave_17_update.zip')
md5sums=('9a5751ab2901e65d95b8134fc78c9bab'
         'c8bdda7722716f18f45a8b2e50f4d020')

build() {
    # Create Destination Directories
    install -d $startdir/pkg/opt/quake3/

	# Install Threewave CTF Files
	cp -r $startdir/src/{baseq3,threewave} \
        $startdir/pkg/opt/quake3/
}

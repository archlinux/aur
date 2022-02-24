# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: AlexTimmi <codelaunch@gmail.com>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=cqrlog-bin
pkgver=2.5.2
pkgrel=3
pkgdesc="An advanced ham radio QSO logger using MariaDB - BINARY version."
arch=('x86_64')
url="https://www.cqrlog.com"
license=('GPL2')
depends=('xdg-utils' 'gtk2' 'mariadb' 'hamlib' 'hamradio-menus')
optdepends=('winkeydaemon: usb cw xmit'
            'cwdaemon: transmitting cw'
	    'fldigi: RTTY and Digital modes'
            'masterscp: supercheckpartial files'
            'cty: country files'
            'bigcty: contest version country files'
            'trustedqsl: upload logs'
            'xplanet: gui location'
            'glabels: print qsl labels')
provides=('cqrlog')
conflicts=('cqrlog' 'cqrlog-git' 'cqrlog-source')
source=(https://github.com/ok2cqr/cqrlog/releases/download/v$pkgver/cqrlog_${pkgver}_amd64.tar.gz)

package() {
    cd $srcdir/cqrlog-$pkgver
    cp -rfv ./* $pkgdir
}
md5sums=('a22eb63403ebcd88d11b94b4d5525238')
sha256sums=('0bb82f7d3583e6e24b20da609e3e84b8d1b6bbea60e532c3aab439af196a44f5')

# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=anonsurf	
pkgver=2.0
pkgrel=1
pkgdesc="A script from ParrotSec that provides a strong system-wide anonymization module"
arch=(any)
url="https://www.parrotsec.org"
license=('GPL')
depends=('tor' 'iptables')
provides=('anonsurf')
conflicts=('anonsurf')
source=("http://downloads.sourceforge.net/project/aur-anonsurf/aur-anonsurf/anonsurf.tar?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Faur-anonsurf%2Ffiles%2Faur-anonsurf%2F&ts=1465421554&use_mirror=master")
md5sums=(901b5aa3848cd442269873e265699222)

package() {
	   cd $pkgname
           mkdir $pkgdir/usr && mkdir $pkgdir/usr/share && mkdir $pkgdir/usr/share/$pkgname && mkdir $pkgdir/usr/bin
           mv * $pkgdir/usr/share/$pkgname/
           ln -s /usr/share/anonsurf/anonsurf.sh $pkgdir/usr/bin/anonsurf
}

# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=sqlninja
pkgver=0.2.6
pkgrel=1
pkgdesc="SQL Server injection & takeover tool"
arch=('any')
url="http://sqlninja.sourceforge.net/"
license=('GPL3')
depends=('perl-dbi' 'perl-io-socket-ssl' 'perl-netpacket' 'perl-net-pcap' 'perl-net-rawip')
optdepends=('metasploit-git')
provides=('sqlninja')
source=("http://downloads.sourceforge.net/project/sqlninja/sqlninja/0.2.6-rc1/sqlninja-0.2.6-rc1.tgz")
md5sums=('ee0ceea3141a95967ce73417969decd8')

package() {
        install -dm755 "$pkgdir/usr/share/sqlninja"
        sudo cp -r sqlninja-0.2.6-rc1/* "$pkgdir/usr/share/sqlninja"
        echo Creating executable for sqlninja...
        mv -v ../sqlninja $pkgdir/usr/bin/sqlninja
}


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
        sudo mkdir /usr/share/sqlninja
        install -dm755 "/usr/share/sqlninja"
        sudo cp -r sqlninja-0.2.6-rc1/* "/usr/share/sqlninja"
        Creating executable for sqlninja...
        sudo mv -v sqlninja /usr/bin/sqlninja
}


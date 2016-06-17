# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname='sqlninja'
pkgver='0.2.6'
pkgrel=1
pkgdesc='SQL Server injection & takeover tool'
arch=('any')
url='http://sqlninja.sourceforge.net/'
license=('GPL3')
depends=('perl-dbi' 'perl-io-socket-ssl' 'perl-netpacket' 'perl-net-pcap' 'perl-net-rawip')
optdepends=('metasploit-git')
source=('http://downloads.sourceforge.net/project/sqlninja/sqlninja/0.2.6-rc1/sqlninja-0.2.6-rc1.tgz')
md5sums=('ee0ceea3141a95967ce73417969decd8')

package() {
        cd "${srcdir}"
        install -dm755 "${pkgdir}/usr/share/${pkgname}"
        cp -rf sqlninja-0.2.6-rc1/* "${pkgdir}/usr/share/${pkgname}"
        install -dm755 "${pkgdir}/usr/bin"
        install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
        mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}" 
}


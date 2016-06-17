# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='apache-users'
pkgver='2.1'
pkgrel=1
pkgdesc='Perl script to enumerate the usernames on a UNIX system that use the apache module UserDir'
arch=('any')
url='https://labs.portcullis.co.uk/'
license=('GPL2')
depends=('perl' 'perl-parallel-forkmanager' 'perl-lwp-protocol-https')
source=('https://labs.portcullis.co.uk/download/apache_users-2.1.tar.gz')
md5sums=('2ca344133dc9c11e94d35656fb590ccb')

package() {
	   cd "${srcdir}/apache_users"
           install -dm755 "${pkgdir}/usr/share/${pkgname}/"
           install -dm755 "${pkgdir}/usr/bin/"
           cp -rf * "${pkgdir}/usr/share/${pkgname}/"
           chmod +x "${pkgdir}/usr/share/${pkgname}/apache2.1.pl"
           ln -s "/usr/share/${pkgname}/apache2.1.pl" "${pkgdir}/usr/bin/${pkgname}"
}

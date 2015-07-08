# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: lp76 <l.peduto@gmail.com>

pkgname='sendemail'
pkgver='1.56'
pkgrel='1'
pkgdesc='A lightweight command line SMTP email client written in Perl'
url='http://caspian.dotconf.net/menu/Software/SendEmail/'
license=('GPL')
depends=('perl' 'perl-net-ssleay' 'perl-io-socket-ssl')
arch=('i686' 'x86_64')
source=("http://caspian.dotconf.net/menu/Software/SendEmail/sendEmail-v${pkgver}.tar.gz")
sha256sums=('6dd7ef60338e3a26a5e5246f45aa001054e8fc984e48202e4b0698e571451ac0')

package() {
  cd "${srcdir}/sendEmail-v${pkgver}"
  install -Dm0755 'sendEmail' "${pkgdir}/usr/bin/sendEmail"
}

#Maintainer: Zach Callear <zach@callear.org>
#Original Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=postfix-policyd-spf-perl
pkgver=2.010
pkgrel=3
pkgdesc='Postfix SPF policy engine, written in Perl'
arch=('i686' 'x86_64')
url='https://launchpad.net/postfix-policyd-spf-perl/'
license=('GPL')
depends=('perl-mail-spf' 'perl-netaddr-ip' 'perl-sys-hostname-long')
source=("https://launchpad.net/postfix-policyd-spf-perl/trunk/release${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('768f5425db736aedc9c40a68e2d58414')

package() {
  cd ${pkgname}-${pkgver}

  install -D ${pkgname} ${pkgdir}/usr/lib/postfix/${pkgname}
}

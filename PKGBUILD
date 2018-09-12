#Maintainer: Zach Callear <zach@callear.org>
#Original Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=postfix-policyd-spf-perl
pkgver=2.011
pkgrel=1
pkgdesc='Postfix SPF policy engine, written in Perl'
arch=('i686' 'x86_64')
url='https://launchpad.net/postfix-policyd-spf-perl/'
license=('GPL')
depends=('perl-mail-spf' 'perl-netaddr-ip' 'perl-sys-hostname-long')
source=("https://launchpad.net/postfix-policyd-spf-perl/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('f893dbe3ea7f8e49d09fa26350a8e72d'
         'SKIP')
validpgpkeys=('E7729BFFBE85400FEEEE23B178D7DEFB9AD59AF1') # Scott Kitterman

package() {
  cd ${pkgname}-${pkgver}

  install -D ${pkgname} ${pkgdir}/usr/lib/postfix/${pkgname}
}

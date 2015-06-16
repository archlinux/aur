# Maintainer: Christos Nouskas <nous at archlinux us>
# 29 Dec 2010
#Maintainer: John D Jones III <jnbek at gmail com>
# 31 Dec 2012

pkgname=w3perl
pkgver=3.19
pkgrel=0
pkgdesc="W3Perl is a free and comprehensive logfile analyzer for Web / FTP / Squid and Mail servers."
arch=(any)
url="http://www.w3perl.com"
license=('GPL3')
depends=('perl' 'fly')
optdepends=('perl-geo-ipfree')
source=(http://www.w3perl.com/download/w3perl.tar.gz
	w3perl.install)
sha256sums=('ba008a7e3d24a67039fd89122d14c0cbeb9061ca07c2dc337d9367413a260c71'
            'a6433555c7a76ae9f93451da3b8d12ed5c8b0c2c69201df6c490eafe4a614c82')
install=w3perl.install

build() {
  mkdir -p $pkgdir/usr/share/webapps
  cp -a $pkgname $pkgdir/usr/share/webapps/
}


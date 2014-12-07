# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Xavier Vierling <xavierling@free.fr>

pkgname=nzbperl
pkgver=0.6.8
pkgrel=2
pkgdesc="NZB based nntp/usenet downloader in perl"
arch=('any')
url="http://noisybox.net/computers/nzbperl/"
license=('GPL')
depends=('perl-term-readkey' 'perl-xml-dom' 'uudeview')
source=(http://noisybox.net/computers/nzbperl/$pkgname-$pkgver.pl
        http://noisybox.net/computers/nzbperl/nzbperlrc.sample)
md5sums=('70e64b7cd4ff9c7c098bf8dffeb62578'
         'b5ec89f58637d4ec34fcbab53065e1c5')

package() {
  cd "${srcdir}"

  install -D $pkgname-$pkgver.pl "${pkgdir}"/usr/bin/$pkgname
  install -D nzbperlrc.sample "${pkgdir}"/usr/share/doc/$pkgname/nzbperlrc.sample
}

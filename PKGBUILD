pkgname=get_flash_videos
_pkgname=get-flash-videos
pkgver=1.25.92
pkgrel=2
pkgdesc="Download flash videos from a web page"
arch=('any')
url="https://github.com/monsieurvideo/$_pkgname"
license=('Apache')
depends=('perl-crypt-blowfish_pp'
         'perl-html-tree'
         'perl-lwp-protocol-https'
         'perl-module-find'
         'perl-term-progressbar'
         'perl-www-mechanize')
source=($url/releases/download/$pkgver/$pkgname-$pkgver)
md5sums=('2975c1ca5af5bf993ed7b158ce711e22')
noextract=($pkgname-$pkgver)

package() {
  install -Dm755 $pkgname-$pkgver $pkgdir/usr/bin/$pkgname
}

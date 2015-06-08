# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php-blackfire
pkgver=0.23.0
pkgrel=1
pkgdesc='Blackfire Profiler - PHP extension'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license='custom'
backup=('etc/php/conf.d/blackfire.ini')
source=('blackfire.ini')
source_i686=("http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_i386-php-56.so")
source_x86_64=("http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_amd64-php-56.so")
md5sums=('4768c8ab9fe7e6d690dfafbe8adfc56d')
md5sums_i686=('d57a70ff481b75caba98ca01eab25393')
md5sums_x86_64=('7ff9b2a829ea5c62256fa5149de38af4')

package(){
  install -Dm 644 blackfire.ini ${pkgdir}/etc/php/conf.d/blackfire.ini
  install -Dm 755 blackfire-php-linux_* ${pkgdir}/usr/lib/php/modules/blackfire.so
}

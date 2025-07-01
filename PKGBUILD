# Maintainer hyx2014 <hyx20140408@163.com>
pkgname=6curl
pkgver=1.0.0
pkgrel=1
pkgdesc="Quick gui downloader"
arch=('x86_64')
depends=('curl>=8.0.0' 'libx11')
url="https://github.com/hyx-web/$pkgname/"
source=(https://github.com/hyx-web/6curl/archive/refs/heads/main.zip)

build()
{
  echo $srcdir
  cd "$srcdir/$pkgname-main"
  gcc -o $pkgname $pkgname.c -lcurl -lX11
}

package()
{
  cd "$srcdir/$pkgname-main"
  mkdir -p $pkgdir/usr/bin
  mv $pkgname $pkgdir/usr/bin/$pkgname
}

sha256sums=("SKIP")

# Maintainer: catskillmarina <catskillmarina at gmail.com>

pkgname=xroach
pkgver=4.4
pkgrel=1.3
pkgdesc="Cockroaches hide under your windows"
arch=('any')
url="ftp://ftp.netbsd.org/pub/pkgsrc/distfiles/xroach-4.4/xroach.tar"
license=('Unknown')
depends=('libx11')
source=("ftp://ftp.netbsd.org/pub/pkgsrc/distfiles/$pkgname-$pkgver/$pkgname.tar")
md5sums=('06f3887f12ab623642b446f7b330ae80')

prepare() {
  cd "$pkgname"
  pwd
  chmod -R +w $srcdir/
  cp "$srcdir/xroach/bitmaps/roach000.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach015.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach030.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach045.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach060.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach075.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach090.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach105.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach120.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach135.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach150.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach165.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach180.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach195.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach210.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach225.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach240.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach255.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach270.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach285.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach300.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach315.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach330.xbm" "$srcdir/$pkgname"
  cp "$srcdir/xroach/bitmaps/roach345.xbm" "$srcdir/$pkgname"
}

build() {
  #cd "$pkgname-$pkgver"
  cd "$pkgname"
  pwd
  gcc -lm -lX11 -o xroach xroach.c
}

package() {
  cd "$pkgname"
  pwd
  install=xroach.install
  install -Dm755 xroach "$pkgdir/usr/bin/xroach"
  install -Dm644 xroach.6 "$pkgdir/usr/share/man/man6/xroach.6"
}


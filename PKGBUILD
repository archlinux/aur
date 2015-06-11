# Maintainer: Christos Nouskas <nous at archlinux us>
pkgname=xchat-greek
pkgver=1.60
pkgrel=2
pkgdesc="A perl script to allow reading both 8-bit ISO and utf-8 text inside xchat/hexchat. Initially intended for the greek IRC users but also works with baltic, cyrillic and turkish; probably arabic and hebrew."
url="http://sourceforge.net/projects/xchat-greek/"
depends=('perl-text-iconv')
arch=(any)
source=(${pkgname}-${pkgver}.pl::http://sourceforge.net/projects/xchat-greek/files/utf8-$pkgver.pl/download
	xchat-greek.install)
noextract=(${pkgname}-${pkgver}.pl)
install=xchat-greek.install
license=('GPL')

build() {
  mkdir -p $startdir/pkg/usr/lib/xchat/plugins
  mkdir -p $startdir/pkg/usr/lib/hexchat/plugins
  cp -v $pkgname-$pkgver.pl $startdir/pkg/usr/lib/xchat/plugins
  cp -v $pkgname-$pkgver.pl $startdir/pkg/usr/lib/hexchat/plugins
}

# makepkg -g >>PKGBUILD
sha256sums=('4e13566a3bebfef7e3a2e4bc2e2908847390431bb75875d610a0912f3b2fe37b'
            '70addd1a889c6f7cfc124c500681cc28938006df2c6f14b20451bb5fbcfa3c2a')

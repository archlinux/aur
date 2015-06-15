# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=mbrola-voices-cn1
pkgver=1
pkgrel=1
pkgdesc="Mandarin Chinese female voice for mbrola."
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-cn)
depends=(mbrola)
license=(custom)
source=(http://tcts.fpms.ac.be/synthesis/mbrola/dba/cn1/cn1.zip)
md5sums=('a57e9c64a49956ac0bdffdd96b0dbd8d')

build(){
  cd $srcdir
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cd cn1
  mv License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
  mkdir -p $pkgdir/usr/share/mbrola/cn1/
  cp cn1 $pkgdir/usr/share/mbrola/cn1/
  cp -r test $pkgdir/usr/share/mbrola/cn1/
}


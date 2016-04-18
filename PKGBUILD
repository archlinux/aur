# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributer: Ebrahim Byagowi <ebrahim@gnu.org>

pkgname=ttf-iran-nastaliq
pkgver=2.0b
pkgrel=2
pkgdesc="A free Unicode calligraphic persian font created by Iran Supreme Council of Information and Communication Technology (SCICT)."
arch=('any')
url="http://www.scict.ir/portal/Home/Default.aspx?CategoryID=c7a865b2-7b95-4169-ad94-f9de320528d7"
license=('custom')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=('irannastaliq.ttf::http://www.scict.ir/portal/File/ShowFile.aspx?ID=5624fa86-e0d3-4f09-a68c-6d8998773265')
md5sums=('8d7d8fa0b9ddb8ec258ad6b8b9b6d254')

package() {
  install -Dm 644 $srcdir/irannastaliq.ttf $pkgdir/usr/share/fonts/$pkgname/irannastaliq.ttf
}

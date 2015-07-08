# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributer: Ebrahim Byagowi <ebrahim@gnu.org>

pkgname=ttf-iran-nastaliq
pkgver=2.0b
pkgrel=1
pkgdesc="A free Unicode calligraphic font created by the High Council of Informatics of Iran."
arch=(any)
url=http://www.scict.ir/portal/Home/Default.aspx?CategoryID=c7a865b2-7b95-4169-ad94-f9de320528d7
license=('unknown')
depends=('fontconfig')
install=$pkgname.install
source=('http://www.scict.ir/portal/File/ShowFile.aspx?ID=5624fa86-e0d3-4f09-a68c-6d8998773265')
sha512sums=('9edfb9a3b07f7a90a2244ed12f93945dd3190df1b546038469448debbc2158f4aa352776976b36955c41913e85a41cd72ec33b351e0fc8d4395aa3b0ee1b2ecb')

package() {
  _target="$pkgdir/usr/share/fonts/scict"
  mkdir -p $_target
  install -Dm644 ShowFile.aspx\?ID=5624fa86-e0d3-4f09-a68c-6d8998773265 \
                 "$_target/IranNastaliq.ttf"
}

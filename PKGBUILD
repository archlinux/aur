# Maintainer: Alexandros Theodotou <alex@zrythm.org>
_tarball=hts_voice_nitech_jp_song070_f001
pkgname=hts-nit-song070-f001
pkgver=0.90
pkgrel=1
pkgdesc="HTS voice trained by using the Nitech Japanese Speech Database NIT SONG070 F001"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.sinsy.jp/"
license=('custom')
depends=()
source=(https://downloads.sourceforge.net/project/sinsy/HTS%20voice/$_tarball-$pkgver/$_tarball-$pkgver.tar.gz)
md5sums=('018cce3ccb1f7110286863420b116d5b')
sha1sums=('70a00c87f85a4a6cd7f14c329cae63388c9b8027')

package()
{
  cd "$srcdir/$_tarball-$pkgver"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -D -m644 nitech_jp_song070_f001.htsvoice "${pkgdir}/usr/share/${pkgname}/"
  install -D -m644 SAMPLE.xml "${pkgdir}/usr/share/${pkgname}/"
}


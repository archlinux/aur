# Maintainer: Valdis Vitolins <valdis.vitolins@odo.lv>
pkgname=hts-voice-cmu-us-arctic-slt
pkgver=1.06
pkgrel=1
pkgdesc='HTS English voice trained by using "CMU ARCTIC database"'
arch=('i686' 'x86_64' 'armv7h')
url="https://sourceforge.net/projects/hts-engine/files/"
license=('BSD')
depends=('hts-engine')
source=("http://downloads.sourceforge.net/hts-engine/hts_voice_cmu_us_arctic_slt-${pkgver}.tar.gz")
md5sums=('614d2fc06ad81106d4328e78ba3d0c6c')
sha256sums=('10d4e70d882335c22abe1004f929845d47894aa35f2df6fe28deac8a8a4af1b2')

package()
{
  cd "$srcdir/hts_voice_cmu_us_arctic_slt-${pkgver}"
  install -m 755 -d "${pkgdir}/usr/share/hts/voices/english"
  install -m 644 "cmu_us_arctic_slt.htsvoice" "${pkgdir}/usr/share/hts/voices/english/cmu_us_arctic_slt.htsvoice"
}

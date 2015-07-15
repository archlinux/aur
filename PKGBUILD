# Maintainer: Adria Arrufat (archdria) <swiftscythe@gmail.com>
pkgname=pyuv
pkgver=0.5
pkgrel=1
pkgdesc="A raw video sequence player"
arch=('i686' 'x86_64')
url="http://dsplab.diei.unipg.it/pyuv_raw_video_sequence_player_original_one"
license=('unknown')
depends=('wxgtk')

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='amd64'
  md5sums=('5e6a89fab944c36fd689790a24f32477')
  source=(http://dsplab.diei.unipg.it/~baruffa/dvbt/binaries/player/lin64/pyuv_0.5-1_x86_64.deb)
else
  ARCH='i386'
  md5sums=('0e79185d6de4bfeb8c3ab56a26459cd6')
  source=(http://dsplab.diei.unipg.it/~baruffa/dvbt/binaries/player/lin32/pyuv_0.5-1_i386.deb)
fi

package() {
  msg "Extracting..."
  tar -xvf data.tar.gz || return 1
  msg2 "Done extracting!"
  msg "Moving files"
  mv $srcdir/usr $pkgdir
  msg2 "Done moving files"

}

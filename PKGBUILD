# Maintainer:  chocotan < loli at linux.com>

pkgname='ztoim'
pkgver='6.23.0.1013';
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="ZTO BAOHE ${_major}"
arch=('x86_64')
url='https://baohe.zto.com'
license=('custom')
provides=()
source=(
  "https://fscdn.zto.com/fs8/M05/7D/64/wKhBD2Abp1OAKCOaCCNvUuKJy_4452.deb?filename=baohe-linux-release-6.23.0.1013.deb"
)

md5sums=('3c5baff235a5237cc607b1c582b8cf85')
sha256sums=('20a525c4344e4313cac0cf26af34100be1edebfb97c70c087e1c0de148957492')

package() {
    echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
    install -d "${pkgdir}${pkgname}"
}

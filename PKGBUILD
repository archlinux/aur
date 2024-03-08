# Maintainer: Dylan Araps <dyl@tfwno.gf>
pkgname=fansly-downloader-ng
pkgver=v0.8.17
pkgrel=1
pkgdesc="Easy-to-use fansly.com content downloading tool. Written in Python and available as a standalone Windows Executable. Enjoy your Fansly content offline anytime, anywhere in the highest possible content resolution! Fully customizable to download in bulk or single: photos, videos & audio from timeline, messages, collection & single posts. "
arch=('any')
url="https://github.com/prof79/${pkgname}"
license=('MIT')
source=("$pkgname::https://github.com/prof79/fansly-downloader-ng/releases/download/v0.8.17/Fansly_Downloader_NG-Linux-${pkgver}.zip")
md5sums=('6effcdd6d67971e03a905cd00af9e72d')

package() {
  cd $srcdir
  install -Dm766 "${srcdir}/fansly-downloader-ng" "${pkgdir}/usr/local/bin/fansly-downloader-ng"
}

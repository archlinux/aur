# Maintainer: neo2001 <neo2001 at posteo dot net>

# NConvert is provided as FREEWARE (NO Adware, NO Spyware) for private or
# educational use (including non-profit organizations). 
# If you enjoy using NConvert, feel free to help the developer with a small donation.
# If you intend to use NConvert commercially, you must purchase a license.

pkgname=nconvert
pkgver=7.12
pkgrel=1
pkgdesc="Command line batch image processor and converter from XnSoft."
arch=('i686' 'x86_64')
url="https://www.xnview.com/en/nconvert/"
license=('custom')
install="${pkgname}.install"
source_i686=('http://download.xnview.com/NConvert-linux.tgz')
source_x86_64=('http://download.xnview.com/NConvert-linux64.tgz')
sha256sums_i686=('7de868c096699de99c829374827ab2cb5b92aa672fd654b1e1af0969f1cdbe7d')
sha256sums_x86_64=('7da1d24f1d5f2cf8a6fdc14f9dea2602f6edd7f4a19b2446bf778bde0a48dcc6')

package() {
  cd NConvert
  install -m 755 -D nconvert "${pkgdir}/usr/bin/nconvert"
  install -m 644 -D license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -m 644 -D -t "${pkgdir}/usr/share/doc/${pkgname}" Formats.txt ReadMe.txt Usage.txt WhatsNew.txt
}

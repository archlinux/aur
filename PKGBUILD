# Maintainer: neo2001 <neo2001 at posteo dot net>

# NConvert is provided as FREEWARE (NO Adware, NO Spyware) for private or
# educational use (including non-profit organizations).
# If you enjoy using NConvert, feel free to help the developer with a small donation.
# If you intend to use NConvert commercially, you must purchase a license.

pkgname=nconvert
pkgver=7.25
pkgrel=1
pkgdesc="Command line batch image processor and converter from XnSoft."
arch=('i686' 'x86_64')
url="https://www.xnview.com/en/nconvert/"
license=('custom')
install="${pkgname}.install"
source_i686=('http://download.xnview.com/NConvert-linux.tgz')
source_x86_64=('http://download.xnview.com/NConvert-linux64.tgz')
sha256sums_i686=('10f576609a982c9d7f4a519c9a49899609b63cea65d1a38b0c6f0c2fda2eb8c1')
sha256sums_x86_64=('852c9cfefb92ea49670c8bc8fc4364297556066026b773321fe6b13718c57467')

package() {
  cd NConvert
  install -m 755 -D nconvert "${pkgdir}/usr/bin/nconvert"
  install -m 644 -D license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -m 644 -D -t "${pkgdir}/usr/share/doc/${pkgname}" Formats.txt ReadMe.txt Usage.txt WhatsNew.txt
}

# Maintainer: phiresky <phireskyde+aur@gmail.com>

pkgname=ripgrep-all
pkgver=0.8.8
pkgrel=1
arch=(x86_64)
pkgdesc="rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc."
url="https://github.com/phiresky/ripgrep-all"
license=('AGPL3')
depends=('ripgrep' 'pandoc' 'poppler' 'ffmpeg')
archivename="ripgrep_all-${pkgver}-${arch}-unknown-linux-musl"
source=("https://github.com/phiresky/ripgrep-all/releases/download/${pkgver}/${archivename}.tar.gz")
sha1sums=('e9208c6542029d426a74802415be3754e5093256')

package() {
  cd "$srcdir/$archivename"
  mkdir -p "$pkgdir/usr/bin"
  cp rga rga-preproc "$pkgdir/usr/bin"
}

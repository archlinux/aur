# Maintainer: Vlad <avireti@gmail.com>
# Contributor: Arlekino <arlekino.zirk@gmail.com>

pkgname=rtorrent-fast-resume
pkgver=1.00
pkgrel=2
pkgdesc="Creats new torrent files from complete downloads to prevent rtorrent from hashing"
url="https://github.com/rakshasa/rtorrent/blob/master/doc/rtorrent_fast_resume.pl"
arch=("i686" "x86_64")
license=("unknown")
depends=('perl-convert-bencode-xs')
source=("https://raw.githubusercontent.com/rakshasa/rtorrent/master/doc/rtorrent_fast_resume.pl")
sha256sums=('0d64e441491328ed34bd708b3f95e2f49a6c96f5cf43e7ec132fc7f060106a95')

package() {
  install -Dv rtorrent_fast_resume.pl "${pkgdir}"/usr/bin/rtorrent-fast-resume
}

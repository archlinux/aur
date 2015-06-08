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
sha256sums=('138525eb2a0e5761c90ac7e56ec723f028d8220c6696978d7c12f1656d25edb7')

package() {
  install -Dv rtorrent_fast_resume.pl "${pkgdir}"/usr/bin/rtorrent-fast-resume
}

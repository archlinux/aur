# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpssacli
pkgver=2.20_11.0
pkgrel=1
pkgdesc="HP Command Line Smart Storage Administrator"
arch=(i686 x86_64)
url="http://downloads.linux.hpe.com"
depends=(bash)
replaces=(hpacucli)
groups=(hpproliant)
license=("CUSTOM")

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${pkgver//_/-}.i386.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")

sha256sums_i686=('690a66c34b222469ce5dd7d61495b5ba6c736f6cd5a29c55badc188b83ce47c3')
sha256sums_x86_64=('49c49493d18c450e35a8a09ea0a969b9f90c946a5da922e33fbc57bc5590c903')

package() {
	mv usr/{sbin,bin}
	cp -a opt usr "$pkgdir"
}

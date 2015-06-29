# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer:  Shaw <puxx@mail.ustc.edu.cn>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>

pkgname=ogg2mp3
pkgver=0.6.1
pkgrel=3
pkgdesc='A Perl script for converting Ogg to MP3'
arch=('any')
url='http://gitorious.org/ogg2mp3/pages/Home/'
license=('GPL2')
depends=('lame' 'perl-string-shellquote' 'vorbis-tools')
source=("git://gitorious.org/ogg2mp3/ogg2mp3.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
	install -D -m0755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}


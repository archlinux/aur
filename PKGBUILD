# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=lha
pkgver=1.17
pkgrel=6
pkgdesc="A compression and archive utility for LH-7 format archives"
arch=('i686' 'x86_64')
url="http://www.infor.kanazawa-it.ac.jp/~ishii/lhaunix/"
license=('custom')
depends_i686=('glibc')
depends_x86_64=('lib32-glibc')
source=("ftp://ftp.uhulinux.hu/mirror/http%3A/www.infor.kanazawa-it.ac.jp/~ishii/lhaunix/linux/${pkgname}${pkgver/./}.tar.gz"
        'LICENSE'
        'lha.man.en')
sha1sums=('da97195db297d2d1f8f288b1b99eea426edb8170'
          'e62662e4b8ab2b11bf60d9803312f9743ad731e2'
          '1c100e5178d324103fb6382edd3e96789a86a86a')

package() {
  install -Dm755 lha "${pkgdir}/usr/bin/lha"
  install -Dm644 lha.man "${pkgdir}/usr/share/man/ja/man1/lha.1"
  install -Dm644 lha.man.en "${pkgdir}/usr/share/man/man1/lha.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

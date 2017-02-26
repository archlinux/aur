# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.15.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('i686' 'x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::http://www.sz3dp.com/upfile/2017/02/24/20170224150536_986.deb")
source_i686=("${pkgname}-${pkgver}_i686.deb::http://www.sz3dp.com/upfile/2017/01/03/20170103151329_822.deb")
md5sums_i686=('f34f3103ad52ca1ede3d521ce190589d')
md5sums_x86_64=('52b43395ca182de61255011700ea5712')
sha256sums_i686=('e33d9607b70ae3472eb0a74fcdc962e9131f17ac4148e873d6761c2900a9cf14')
sha256sums_x86_64=('64914066ceb9a13d8c7717c5b1d96b77630a062d6be7c397a338915fc119b338')
sha512sums_i686=('2f6281a831fdda43dd75a6673d6ddc50ca2274f0fe1253e869cca058c8fb372fd6cda4349569bc4929574ce4846abfc29a2d4b0ffe4ebb6c1357be3d3f5ac2ba')
sha512sums_x86_64=('d46bc737b34cca67bd14a204b014402a6348c2e4167460faa90721c682daad872e4a0fdd32db7bb1dc1466a859167bd3e75cf340f2aca6f51c82c543deaf2625')

package() {
    cd ${pkgdir}
    tar -Jxvf ${srcdir}/data.tar.xz
    install -d ${pkgdir}/usr/bin
    ln -s ../share/FlashPrint/FlashPrint ${pkgdir}/usr/bin/flashprint
}


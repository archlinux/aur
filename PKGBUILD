# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.14.0
pkgrel=2
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('i686' 'x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::http://www.sz3dp.com/upfile/2017/01/03/20170103151442_199.deb")
source_i686=("${pkgname}-${pkgver}_i686.deb::http://www.sz3dp.com/upfile/2017/01/03/20170103151329_822.deb")
md5sums_i686=('f34f3103ad52ca1ede3d521ce190589d')
md5sums_x86_64=('8ec17f5d22f2296ebc2cb7fd30d77332')
sha256sums_i686=('e33d9607b70ae3472eb0a74fcdc962e9131f17ac4148e873d6761c2900a9cf14')
sha256sums_x86_64=('a79bd20257670540a5a301e597c063ab4b33cd8eb0fcb81ad8df18bf6b8ba262')
sha512sums_i686=('2f6281a831fdda43dd75a6673d6ddc50ca2274f0fe1253e869cca058c8fb372fd6cda4349569bc4929574ce4846abfc29a2d4b0ffe4ebb6c1357be3d3f5ac2ba')
sha512sums_x86_64=('0baa230e793b1a4385d528c1871602fa8ba03459f8e5acf619ca90b0dfc24e3922c7594530959a4dd95e559b69a382d900613b732fe520c74398f35e83f25429')

package() {
    cd ${pkgdir}
    tar -Jxvf ${srcdir}/data.tar.xz
    install -d ${pkgdir}/usr/bin
    ln -s ../share/FlashPrint/FlashPrint ${pkgdir}/usr/bin/flashprint
}


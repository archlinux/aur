# Maintainer: Oliver Rümpelein <arch@pheerai.de>; Siegfried Krug <siegfried nospamat fg4f nospamdot de>
pkgname=x32edit
pkgver=3.1
pkgrel=2
pkgdesc="Remote control and programm Behringer X32 consoles"
arch=('i686' 'x86_64')
url="http://www.behringer.com/EN/products/X32.aspx"
license=('custom:MUSIC Group End User License Agreement')
install=x32edit.install
depends=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')
source=("http://www.music-group.com/eurocom/assets/EULA_2012-09-12.pdf")
source_i686=("http://downloads.music-group.com/software/behringer/X32/X32-Edit_LINUX_3.1.tar.gz")
source_x86_64=("http://downloads.music-group.com/software/behringer/X32/X32-Edit_LINUX_64bit_3.1.tar.gz")
sha512sums=('fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284')
sha512sums_i686=('6585d34f4043696c078fcbe936cad920a5505fd43fa2954e3c82a02c49f590ae77fb45321c088dc85ff4f27113a782d80c93220575f241abf15d3d3fe19f8142')
sha512sums_x86_64=('bbbf5541860b7ea5ae65194c19189fb85bad03070bb8cf3de61e4439f0b9f7c6e91073e241e14e52c3eaad2d32d4907f8da0cbbf23963bbecef976d9644496a3')

package()
{
    cd "${srcdir}"
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/licenses/x32edit
    install -m 755 X32-Edit ${pkgdir}/usr/bin/
    install -m 644 EULA_2012-09-12.pdf ${pkgdir}/usr/share/licenses/x32edit/license.pdf
}

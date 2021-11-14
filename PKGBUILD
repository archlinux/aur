# Maintainer: Edoardo Brogiolo <edoardo at brogiolo dot eu>
# Contributor: Previous maintainer Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>


pkgname=peazip-gtk2-bin
pkgver=8.3.0
pkgrel=1
pkgdesc="File and archive manager, 7Z BR RAR TAR ZST ZIP files extraction utility
"
arch=('i686' 'x86_64')
url='http://www.peazip.org/peazip-linux.html'
license=('GPL3')
depends=('lib32-curl'
         'lib32-gmp4'
         'lib32-gtk2'
         'balz'
         'paq8o'
         'p7zip'
         'upx'
         'zpaq'
         'gtk2')
options=('!emptydirs')
optdepends=('quad: A ROLZ-based file compressor' 
            'unace: Support for ace files'
            'arc: Support for arc files')
provides=('peazip')
conflicts=('peazip'
           'peazip-qt'
           'peazip-qt-opensuse-latest')
source=("${pkgname}-${pkgver}.rpm::https://github.com/peazip/PeaZip/releases/download/${pkgver}/peazip-${pkgver}.LINUX.GTK2-1.x86_64.rpm")
sha256sums=('156318d011536be72d6614312c7e064426d3b75bda2ffa56a7ada34888c2a1a3')

package() {
  cp -aR usr/ "${pkgdir}/"
  cp -aR opt/ "${pkgdir}/"
  rm -rf "${pkgdir}/usr/lib"
}

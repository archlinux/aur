# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=recover_mp4
pkgver=1.92
pkgrel=1
pkgdesc='Recover damaged MP4 files'
arch=('x86_64')
url='http://slydiman.me/eng/mmedia/recover_mp4.htm'
license=('Proprietary')
optdepends=()
depends=('wine')
source=("http://slydiman.me/download/recover_mp4.zip"
        "recover_mp4")
md5sums=('fab39058223d468fbc9ebd0aa2db0d8b'
         '9c57acf4db1f5164e26b528e9075ad16')

package() {
    mkdir -p "${pkgdir?}"/{opt/windows,usr/bin}
    cp -a -- "${srcdir?}"/recover_mp4.exe "$pkgdir"/opt/windows
    cp -a "$(readlink -f recover_mp4)" "$pkgdir"/usr/bin
}

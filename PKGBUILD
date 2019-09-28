# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>

pkgname=aud2u
pkgver=1.0.0
pkgrel=1
pkgdesc="Create your own hybrid bootable pendrive from iso made by 'archsysback' or 'archuseriso'"
arch=('any')
url="https://github.com/toxin265/aud2u"
license=('GPL')
groups=(system)
depends=(refind-efi syslinux gptfdisk util-linux dosfstools parted cdrtools ntfs-3g zenity)
makedepends=(xz)
provides=(aud2u)
conflicts=(aud2u)
source=("https://raw.githubusercontent.com/toxin265/aud2u/master/aud2u.tar.xz")
md5sums=('6cb94e2eb781781b48454d6e84e0d2e8')

package() {
    cd "$srcdir"
    cp -r ./*/ "$pkgdir"
    cd $pkgdir/usr/local/bin
    ln -sf $pkgname"_en.sh" $pkgname
}

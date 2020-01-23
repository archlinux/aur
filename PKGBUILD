# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>
# makepkg --printsrcinfo > .SRCINFO
# makepkg -g >>PKGBUILD

pkgname=aud2u
pkgver=1.1.0
pkgrel=1
pkgdesc="Create your own hybrid bootable pendrive from iso made by 'archuseriso ^AUR'"
arch=('any')
url="https://github.com/toxin265/aud2u"
license=('GPL')
groups=(system)
depends=(refind-efi syslinux gptfdisk util-linux dosfstools parted cdrtools ntfs-3g zenity)
makedepends=(xz)
provides=(aud2u)
conflicts=(aud2u)
source=("https://raw.githubusercontent.com/toxin265/${pkgname}/master/$pkgname-$pkgver.tar.xz")
#source=("https://github.com/toxin265/aud2u/blob/master/$pkgname-$pkgver.tar.xz")
#source=("file://./$pkgname-$pkgver.tar.xz")


prepare() {
	cd "$srcdir"
	}


build() {
	cd "$srcdir"
}

check() {
	cd "$srcdir"
}


package() {
    cd "$srcdir"
    tar xf *
    cp -r ./*/ "$pkgdir"
    cd $pkgdir/usr/local/bin
    ln -sf $pkgname"_en.sh" $pkgname
}

md5sums=('e43846a0d8a3387caa1bf2753bbc0099')

#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=neroaac
pkgver=1.5.4.0
pkgrel=5
_nerover=1.5.1
_suserel=3.27
pkgdesc='Nero AAC audio codec (dec/enc/tag) all-in-one.'
arch=(x86_64)
url='https://wiki.hydrogenaud.io/index.php?title=Nero_AAC'
license=(custom)
depends_x86_64=(lib32-gcc-libs)
#depends_i686=(gcc-libs)
source=("https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Multimedia/x86_64/nero-aac-$_nerover-$_suserel.x86_64.rpm")
sha256sums=('e87e54572761950691e5c94d44dd69e338f54b191716f19eac559f15a6b7271f')
conflicts=(neroaacdec neroaacenc neroaactag)
provides=(neroaacdec neroaacenc neroaactag)

package() {
    install -D -m755 -t "$pkgdir/usr/bin" usr/bin/*
    install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" usr/share/doc/packages/nero-aac/*
}

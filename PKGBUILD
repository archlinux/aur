#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=neroaac
pkgver=1.5.4.0
pkgrel=5
pkgdesc='Nero AAC audio codec (dec/enc/tag) all-in-one.'
arch=(x86_64)
url='https://wiki.hydrogenaud.io/index.php?title=Nero_AAC'
license=(custom)
depends_x86_64=(lib32-gcc-libs)
#depends_i686=(gcc-libs)
source=('https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Multimedia/x86_64/nero-aac-1.5.1-3.20.x86_64.rpm')
sha256sums=('cc80d97c4167ad8c4bb4b151d06d34e7ca470f6167ef9aa8cb63a1c0f4b56d6e')
conflicts=(neroaacdec neroaacenc neroaactag)
provides=(neroaacdec neroaacenc neroaactag)

package() {
    install -D -m755 -t "$pkgdir/usr/bin" usr/bin/*
    install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" usr/share/doc/packages/nero-aac/*
}

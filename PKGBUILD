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
source=('https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Multimedia/x86_64/nero-aac-1.5.1-3.22.x86_64.rpm')
sha256sums=('19266da963752c7d2382378096e4f7d4fd40ff20cc99cc57647e5917c7dc82c1')
conflicts=(neroaacdec neroaacenc neroaactag)
provides=(neroaacdec neroaacenc neroaactag)

package() {
    install -D -m755 -t "$pkgdir/usr/bin" usr/bin/*
    install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" usr/share/doc/packages/nero-aac/*
}

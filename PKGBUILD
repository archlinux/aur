_name=sabermod-prebuilts
pkgname=$_name
pkgver=2015.06.02
pkgrel=1
pkgdesc="Prebuilt libraries for the SaberMod toolchain."
license=('GPL-3')
arch=('x86_64')
url='http://sabermod.net/'
optdepends=()
provides=($_name)
conflicts=($_name)
source=("http://oceighty.co/sm/$pkgname-$pkgver.zip")
sha256sums=('SKIP')

package() {
    # Install SaberMod prebuilts
    mkdir -p "$pkgdir/usr/lib/"
    install -m 755 libcloog-isl.a "$pkgdir/usr/lib/"
    install -m 755 libcloog-isl.so.4.0.0 "$pkgdir/usr/lib/"
    install -m 755 libosl.a "$pkgdir/usr/lib/"
    install -m 755 libosl.so.0.0.0 "$pkgdir/usr/lib/"
    install -m 755 libisl.a "$pkgdir/usr/lib/"
    install -m 755 libisl.so.13.1.1 "$pkgdir/usr/lib/"
    install -m 755 libmpfr.so.6.0.0 "$pkgdir/usr/lib/"
    install -m 755 libcloog-isl.so.4.0.0 "$pkgdir/usr/lib/"
    install -m 755 libcloog-isl.so.4.0.0 "$pkgdir/usr/lib/"

    # Link the libraries
    ln -s "$pkgdir/usr/lib/libcloog-isl.so.4.0.0" "$pkgdir/usr/lib/libcloog-isl.so"
    ln -s "$pkgdir/usr/lib/libcloog-isl.so.4.0.0" "$pkgdir/usr/lib/libcloog-isl.so.4"
    ln -s "$pkgdir/usr/lib/libosl.so.0.0.0" "$pkgdir/usr/lib/libosl.so.0"
    ln -s "$pkgdir/usr/lib/libosl.so.0.0.0" "$pkgdir/usr/lib/libosl.so"
    ln -s "$pkgdir/usr/lib/libisl.so.13.1.1" "$pkgdir/usr/lib/libisl.so.13.1.0"
    ln -s "$pkgdir/usr/lib/libisl.so.13.1.0" "$pkgdir/usr/lib/libisl.so.10"
    ln -s "$pkgdir/usr/lib/libisl.so.13.1.1 " "$pkgdir/usr/lib/libisl.so"
    ln -s "$pkgdir/usr/lib/libisl.so.13.1.0" "$pkgdir/usr/lib/libisl.so.13"
    ln -s "$pkgdir/usr/lib/libmpfr.so.6.0.0" "$pkgdir/usr/lib/libmpfr.so.6"

}

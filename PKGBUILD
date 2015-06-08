      # Maintainer: lemust83 <lemust83420@gmail.com>
    # Contributor: Claude Bulin <xcfaudio@gmail.com>
    pkgname=b2im
    pkgver=0.9.19
    pkgrel=1
    pkgdesc="a graphic tool for manjaro-tools"
    arch=('i686' 'x86_64')
    url="http://www.xcfa.tuxfamily.org/article25/build-2-iso-manjaro"
    license=('GPL')
    depends=('imagemagick' 'kdegraphics-kolourpaint' 'git' 'manjaro-tools-base' 'gtk3')
    makedepends=()
    conflicts=()
    replaces=(b2im)
    source=(http://download.tuxfamily.org/xcfaudio/MANJARO/build2isomanjaro/$pkgname-$pkgver.tar.gz)
    sha256sums=('f1fb84250eff225e10c55edef3143b1eb58894e9ec92485ffcd3b16b469ec947')


    build() {
      cd "$pkgname-$pkgver"
      ./autogen.sh
      make
    }


    package() {
      cd "$pkgname-$pkgver"
      make DESTDIR="$pkgdir/" install
    }




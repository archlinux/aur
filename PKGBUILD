# Maintainer: Nadir Boussoukaia <nad4reg@gmail.com>
# This PKGFILE borrowed & adapted from dolphin-root by David P. <megver83@parabola.nu>


pkgname=dolphin-split-view-the-right-way
_pkgname=${pkgname/-split-view-the-right-way}
pkgver=18.08.1
pkgrel=1
pkgdesc="Dolphin patched so that the F3 key closes the opposite pane in split view instead of the focused. This behavior is configurable."
arch=('armv7h' 'i686' 'x86_64')
#url="https://kde.org/applications/system/dolphin/"
url="https://github.com/boussou/dolphin-split-view-the-right-way"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kuiserver kcmutils kparts kinit)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kde-thumbnailer-odf: ODF thumbnails'
            'ruby: installing new service menus from KDE Store' 'kdegraphics-thumbnailers: PDF and PS thumbnails' 'konsole: terminal panel')
conflicts=($_pkgname)
provides=($_pkgname)
source=("https://download.kde.org/stable/applications/$pkgver/src/${_pkgname}-$pkgver.tar.xz"{,.sig} 
        "$pkgname"::"git+https://github.com/boussou/dolphin-split-view-the-right-way.git" )   
sha512sums=('9c941c37d8c1b132c092a3c71f75b821427b170ded6be8a0d1ca19a5807c9c2689cd695ee8e953443e2769358e3a28704c1880671a1fa0daaae9c1149cc12642'
            'SKIP'
	)
	
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87 # Christoph Feck <cfeck@kde.org>
)

prepare() {

  mkdir -p build
  
  cd $srcdir/${_pkgname}-$pkgver
  cp -R ../dolphin-split-view-the-right-way/src/* ./src
  
}

build() {
  cd build
  cmake ../${_pkgname}-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}


package() {
  cd build
  make DESTDIR="$pkgdir" install
}
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP'
            '37f631344027e7d87451312fd20fc738e4b56e0824097292dc52e3d08baef2d0338fc7aad0260fb496737c3f828c5e21c99892c8401f37a3ef91008dcc19808b')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP'
            '37f631344027e7d87451312fd20fc738e4b56e0824097292dc52e3d08baef2d0338fc7aad0260fb496737c3f828c5e21c99892c8401f37a3ef91008dcc19808b')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP'
            'SKIP')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP'
            'SKIP')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP'
            'SKIP')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP'
            'SKIP')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP'
            'SKIP')
sha512sums=('1ad302f332bbae523db78db5048b910b182ef396a4222da0718d5b280be1adb54eba6abeeaa9facc3ecc49353b91e1aa67bb6f7429446589d6b51d0458a726ae'
            'SKIP'
            'SKIP')

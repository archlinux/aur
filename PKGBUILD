# Maintainer: Sébastien Luttringer

pkgname=isostick-updater
pkgver=71
pkgrel=1
pkgdesc='Updating your isostick firmware'
arch=(x86_64)
url='http://isostick.com'
license=('custom')
depends=('lib32-zlib'
         'lib32-expat'
         'lib32-fontconfig'
         'lib32-freetype2'
         'lib32-gcc-libs'
         'lib32-glib2'
         'lib32-glibc'
         'lib32-libffi'
         'lib32-libice'
         'lib32-libsm'
         'lib32-libx11'
         'lib32-libxau'
         'lib32-libxcb'
         'lib32-libxdmcp'
         'lib32-libxext'
         'lib32-libxrender'
         'lib32-pcre'
         'lib32-util-linux'
         'lib32-zlib')
source=("http://isostick.com/updater/$pkgname.tar.gz")
md5sums=('1fa85837f9e1898d43992d61ee87233e')

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:

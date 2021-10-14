# Maintainer: Iamnotagenius <kazakk9@gmail.com>
pkgname=bevm
pkgver=1.4 # Версия проги
pkgrel=1 # Номер релиза
pkgdesc="A God's basic evm"
arch=('any')
url="https://github.com/JustAGod1/bevm"
license=('GPL')
depends=('glibc' 'sdl2' 'gtk3' 'gcc-libs')
makedepends=()
source=("$pkgname-$pkgver"::"https://github.com/JustAGod1/bevm/releases/download/v$pkgver/Linux-BasePC2.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

package() {
  mkdir -p "$pkgdir/usr/bin"
  tar xf "$pkgname-$pkgver" && mv evm "$pkgdir/usr/bin"
}

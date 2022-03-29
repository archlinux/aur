pkgname=znc-fish
pkgver=1.2018
pkgrel=2
pkgdesc='FiSH Module for ZNC'
arch=('x86_64')
url='https://github.com/qnorsten/znc-fish'
license=('GPL')
depends=('znc')
makedepends=('cmake')
provides=('znc-fish')
source=('https://gist.githubusercontent.com/v4lli/ee4edd99128e7cb518ebad548cab7a41/raw/c2a3c05714d8fbab8bdbcb4a2a52c7099a7efbbf/fish.cpp')
b2sums=('6982570d1083af973b45ce5a80313bb5634557e8b42bf2cbbe88af10bbb1fe58b39b59860a2d291519e3561d8c4679a205561ad6c6d40e9295aaa35cf636fecc')

build() {
  znc-buildmod fish.cpp
}

package() {
  install -Dm755 fish.so "${pkgdir}/usr/lib/znc/fish.so"
}

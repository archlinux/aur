pkgname=pulsenomore
pkgver=0.1
pkgrel=1
pkgdesc="Run Executable without Pulseaudio correctly"
license=('GPL')
arch=('i686' 'x86_64')
url="http://bugs.kerbalspaceprogram.com/issues/7515#note-28"
source=("https://raw.githubusercontent.com/mwestphal/pulsenomore/master/$pkgname.c")
sha256sums=('b55398ee95f9f65eeef91c5df79d12a3bdbe2e6e8e75bc46c058c330cac903ca')

build() {
  gcc -std=gnu99 -O2 -o $pkgname $pkgname.c -ldl
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}


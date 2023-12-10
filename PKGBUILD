# Maintainer: S e r g i o  S c h n e i d e r  s p s f 6 4 at g m a i l dot c o m
# Contributor:	

pkgname=jamesdsp-pipewire-bin
_pkgname=jamesdsp
pkgver=2.7.0
pkgrel=1
pkgdesc="Open-source sound effects for PipeWire"
arch=("x86_64")

url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL3')
depends=('glibmm' 'hicolor-icon-theme' 'libarchive' 'libpipewire' 'qt6-svg')
makedepends=('git')
provides=("${_pkgname%}")
conflicts=('jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp' 'jamesdsp')

#https://github.com/Audio4Linux/JDSP4Linux/releases/download/2.5.1/jamesdsp-pipewire_2.5.1-8352d5_linux64.deb
#source=("$url/releases/download/2.5.1/jamesdsp-pipewire_2.5.1-8352d5_linux64.deb")
#source=("https://github.com/Audio4Linux/JDSP4Linux/releases/download/2.6.0/jamesdsp-pipewire_2.6.0-7868e4_ubuntu22.04_linux64.deb")

source=("https://github.com/Audio4Linux/JDSP4Linux/releases/download/2.7.0/jamesdsp-pipewire_2.7.0-30a30a_ubuntu22-04_amd64.deb")
sha256sums=('34ca987f55256ed27ae475e2f5eefcedbb8654a7f2a662a393ed863ef3537de8')


package() {
    cd "$srcdir/"
    tar xaf data.tar.xz -C $pkgdir
    cd $pkgdir/usr/share/applications
}


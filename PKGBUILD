# Maintainer: S e r g i o  S c h n e i d e r  s p s f 6 4 at g m a i l dot c o m
# Contributor:	

pkgname=jamesdsp-pipewire-bin
_pkgname=jamesdsp
pkgver=2.6.1
pkgrel=2
pkgdesc="Open-source sound effects for PipeWire"
arch=("x86_64")

url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL3')
depends=('glibmm' 'hicolor-icon-theme' 'libarchive' 'libportal-qt5' 'libpipewire' 'qt5-svg')
provides=("${_pkgname%}")
conflicts=('jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp' 'jamesdsp')

#https://github.com/Audio4Linux/JDSP4Linux/releases/download/2.5.1/jamesdsp-pipewire_2.5.1-8352d5_linux64.deb
#source=("$url/releases/download/2.5.1/jamesdsp-pipewire_2.5.1-8352d5_linux64.deb")
#source=("https://github.com/Audio4Linux/JDSP4Linux/releases/download/2.6.0/jamesdsp-pipewire_2.6.0-7868e4_ubuntu22.04_linux64.deb")

source=("https://github.com/Audio4Linux/JDSP4Linux/releases/download/2.6.1/jamesdsp-pipewire_2.6.1-e8c5f0_ubuntu22.04_linux64.deb")
sha256sums=('ae7cb0cacf31cc45bb33af7efb23d764eb2b748defd621f37298249ee77aec56')


package() {
    cd "$srcdir/"
    tar xaf data.tar.xz -C $pkgdir
    cd $pkgdir/usr/share/applications
}


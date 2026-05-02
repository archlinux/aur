# Maintainer: steffeno dash etc at protonmail dot com
pkgname=greatspn-bin
pkgver=3.2
pkgrel=1
pkgdesc="GreatSPN: Graphical Editor and Analyzer for Timed and Stochastic Petri Nets"
arch=('x86_64')
url="https://github.com/greatspn/SOURCES"
license=('GPL2')
depends=('graphviz' 'ghostscript' 'java-runtime' 'gcc-libs' 'glibc')
provides=('greatspn')
conflicts=('greatspn')
source=("${pkgname}-${pkgver}.deb::https://datacloud.di.unito.it/public.php/dav/files/MnWgcYamrHdDXZk/greatspn_3.2-linux_amd64.deb")
sha256sums=('70795c575a903c9721fff16ca9ae791b59429fc44a14fbd9bb2167b218deeb00')
options=(!strip)

package() {
  ar x "${pkgname}-${pkgver}.deb"
  
  install -d "$pkgdir/usr"
  tar -xf data.tar.* -C "$pkgdir/"
}

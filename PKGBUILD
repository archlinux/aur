# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=vcard-studio
pkgver=1.4.0
pkgrel=1
pkgdesc="A contact management application with support for vCard file format (.vcf)."
arch=('x86_64')
url="https://app.zdechov.net/vcard-studio"
license=('CC0')
makedepends=()
depends=('at-spi2-core' 'glibc' 'gdk-pixbuf2' 'glib2' 'libx11' 'cairo' 'pango' 'gtk2')
source=("https://svn.zdechov.net/vcard-studio/bin/vcard-studio_${pkgver}_amd64.deb")
sha256sums=('3574cb52556596a573d92dd2aa0bc87a618fa9afc9ff1a05953f15b348c4cee5')

prepare() {
  rm control.tar.xz
  rm debian-binary
  tar xJf data.tar.xz
}

package() {
  cp -Rfp $srcdir/usr $pkgdir/
}

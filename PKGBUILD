# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=bitaddress
pkgver=2.9.8
pkgrel=1
pkgdesc="JavaScript Client-Side Bitcoin Wallet Generator"
arch=('any')
url="https://github.com/pointbiz/bitaddress.org"
license=('MIT')
provides=('bitsquare')
source=("${pkgname}::git+https://github.com/pointbiz/bitaddress.org.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  ls ${pkgname}
#  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/$pkgname}
#
#  # Install all .deb files into /opt.
#  cp -r "$srcdir/opt" "$pkgdir"
#
#  # Symlink some files to complete install.
#  ln -s "/opt/$_binname/$_binname" "$pkgdir/usr/bin/$pkgname"
#  ln -s "/opt/$_binname/${_binname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
#  ln -s "/opt/$_binname/${_binname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

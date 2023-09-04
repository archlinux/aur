# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=latencyflex-proton-ge-custom
pkgver=0.1.1
pkgrel=2
pkgdesc="LatencyFleX symlinks for proton-ge-custom (and -bin) system installation"
arch=('any')
url="https://github.com/ishitatsuyuki/LatencyFleX"
license=('Apache2')
depends=('proton-ge-custom' 'latencyflex')

package() {
  # Create directories
  mkdir -p "$pkgdir/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib64/wine/x86_64-unix"
  mkdir -p "$pkgdir/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib64/wine/x86_64-windows"
  # Create symlinks
  ln -s "/usr/lib/wine/x86_64-unix/latencyflex_layer.so" "$pkgdir/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib64/wine/x86_64-unix"
  ln -s "/usr/lib/wine/x86_64-windows/latencyflex_layer.dll" "$pkgdir/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib64/wine/x86_64-windows"
  ln -s "/usr/lib/wine/x86_64-windows/latencyflex_layer.dll.a" "$pkgdir/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib64/wine/x86_64-windows"
  ln -s "/usr/lib/wine/x86_64-windows/latencyflex_wine.dll" "$pkgdir/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib64/wine/x86_64-windows"
  ln -s "/usr/lib/wine/x86_64-windows/latencyflex_wine.dll.a" "$pkgdir/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/lib64/wine/x86_64-windows"
}

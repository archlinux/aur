# Maintainer: aetherised <aetherised@gmail.com>

pkgname=addmag
pkgver=0.2.1
pkgrel=2
pkgdesc="Opens torrents and magnet links using a remote Transmission daemon"
arch=('any')
url="https://github.com/aetherised/addmag"
license=('MIT')
depends=('transmission-cli' 'bash' 'libnotify')
source=(
  'addmag'
  'addmag.desktop'
  'LICENSE'
  'README.md'
)
package() {
  install -Dvm755 "addmag" "${pkgdir}/usr/bin/addmag"
  install -Dvm644 "addmag.desktop" "${pkgdir}/usr/share/applications/addmag.desktop"
  install -Dvm644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
  install -Dvm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -dv "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
md5sums=('9fd4986bc3d4cc0d4dc1e5913eb5b2de'
         'd29606b143c5d8c80d3d68664e6fc50a'
         '648ebc0775a7579d1f66bbf4b2381b83'
         '6b40219cffa0a70428eb925cb240bb73')

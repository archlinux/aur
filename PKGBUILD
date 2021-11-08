# Maintainer: aetherised <aetherised@gmail.com>

pkgname=addmag
pkgver=0.2.0
pkgrel=1
pkgdesc="Opens magnet links using a remote Transmission daemon"
arch=('any')
url="https://github.com/aetherised/addmag"
license=('MIT')
depends=('transmission-cli' 'bash')
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
md5sums=('14f98b59c71487c92b6b5d49cc2db79d'
         '921ef9cd57fe1e0f6e8cb3cd7ce41029'
         '648ebc0775a7579d1f66bbf4b2381b83'
         '0398bc2eabdc6bf328ca160dfd2074ad')

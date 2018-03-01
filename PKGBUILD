pkgname=ganache
pkgver=1.0.2
_pkgver=1.0.2
pkgrel=1
pkgdesc='A local Ethereum blockchain'
url='http://truffleframework.com/ganache/'
arch=('any')
license=('MIT')
source=("https://github.com/trufflesuite/ganache/releases/download/v${_pkgver}/ganache-${_pkgver}-x86_64.AppImage"
"appimagekit-Ganache.desktop"
)
sha256sums=('c92b1e39e882c533ed150770f77755291f31a6f1383767e53800b63115341e37'
SKIP
)
noextract=('ganache-${_pkgver}-x86_64.AppImage')
provides=('ganache')
options=('!strip')

package() {
  install -D -m 644 "${srcdir}/ganache-${_pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/ganache"
  install -D -m 644 "${srcdir}/appimagekit-Ganache.desktop" "${pkgdir}/usr/share/applications/appimagekit-Ganache.desktop"
  chmod +x "${pkgdir}/usr/bin/ganache"
}


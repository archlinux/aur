# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.1.2
pkgrel=1
pkgdesc="Use any linux distribution inside your terminal."
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/89luca89/distrobox"
license=('GPL3')
depends=('podman')
source=("${url}/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  ./install -p "${pkgdir}/usr/bin"
}

sha256sums=('2b3fb9fd7d52458b9898b529fbb9c9ac67a0523eebbf554ac71f2bc2fc3c74bd')

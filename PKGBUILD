# Contributor: Thomas Quillan <tjquillan@gmail.com>
pkgname=igdm-bin
pkgver=3.0.3
pkgrel=1
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64')
url="https://github.com/ifedapoolarewaju/igdm"
license=('MIT')
depends=('gconf' 'glibc' 'gtk3' 'nss')
provides=('igdm')
conflicts=('igdm')
source=("https://raw.githubusercontent.com/ifedapoolarewaju/igdm/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/ifedapoolarewaju/igdm/releases/download/v${pkgver}/IGdm_${pkgver}_amd64.deb")
sha256sums=('cfe59b21a32217b32573315adbcc0f3621aeaa8dec634e54eb30a0cf260867cc')
sha256sums_x86_64=('d46664f683edcd91ec10db807b7496691c30a85308a32451706bdad1aaa5a024')

package() {
    tar xf "data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}"/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

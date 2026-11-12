# Maintainer: ezhkov <alexcez94@gmail.com>
pkgname=voltius-bin
_pkgname=voltius
pkgver=0.69.0
pkgrel=1
pkgdesc="Local-first SSH/SFTP/Serial client with E2EE sync, plugins, and no account required (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/VoltiusApp/voltius"
license=('AGPL3')
provides=('voltius')
conflicts=('voltius')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsecret' 'hicolor-icon-theme')
makedepends=('dpkg')
source_x86_64=("$pkgname-$pkgver.deb::https://github.com/VoltiusApp/voltius/releases/download/v$pkgver/Voltius_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver.deb::https://github.com/VoltiusApp/voltius/releases/download/v$pkgver/Voltius_${pkgver}_arm64.deb")
sha256sums_x86_64=('25a4cc2e51e139993c3a6370797c7f671749992e4ccb396aec4c1ad53e597e97')
sha256sums_aarch64=('25a4cc2e51e139993c3a6370797c7f671749992e4ccb396aec4c1ad53e597e97')

package() {
  dpkg-deb -x "$pkgname-$pkgver.deb" "$pkgdir"
}

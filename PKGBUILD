# Maintainer: ezhkov <alexcez94@gmail.com>
pkgname=voltius-bin
_pkgname=voltius
pkgver=0.39.0
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
sha256sums_x86_64=('a70bb1201a9f5fa7937a4f4fd71a7b9c99b9c0276b958155001710e762fe6cfb')
sha256sums_aarch64=('a70bb1201a9f5fa7937a4f4fd71a7b9c99b9c0276b958155001710e762fe6cfb')

package() {
  dpkg-deb -x "$pkgname-$pkgver.deb" "$pkgdir"
}

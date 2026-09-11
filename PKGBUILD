# Maintainer: ezhkov <alexcez94@gmail.com>
pkgname=voltius-bin
_pkgname=voltius
pkgver=0.33.3
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
sha256sums_x86_64=('86ccfe0d82abb5e9d7cbc7c73d804981df5363fb966cb16f09c66e38e0f2e21b')
sha256sums_aarch64=('86ccfe0d82abb5e9d7cbc7c73d804981df5363fb966cb16f09c66e38e0f2e21b')

package() {
  dpkg-deb -x "$pkgname-$pkgver.deb" "$pkgdir"
}

# Maintainer: ezhkov <alexcez94@gmail.com>
pkgname=voltius-bin
_pkgname=voltius
pkgver=0.31.0
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
sha256sums_x86_64=('119cf5b6357c79be60324b135e6db0afdeb338c0bafeafe543ee8a0eeb11f0e6')
sha256sums_aarch64=('119cf5b6357c79be60324b135e6db0afdeb338c0bafeafe543ee8a0eeb11f0e6')

package() {
  dpkg-deb -x "$pkgname-$pkgver.deb" "$pkgdir"
}

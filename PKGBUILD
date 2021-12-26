# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.9.8
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kopia/kopia/'
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_armv7l.deb")
sha256sums_x86_64=('3dc27de17c6d0dd781f3150a03f3f74eb026ff2cdcbf5c01e106ed7588aa8327')
sha256sums_aarch64=('6be4a2a1ae740ee4b13424ff90eede1a35f8aa63e95498a9029461f0e3ed9e7e')
sha256sums_armv7h=('668101af805612bb6de6962af4c01114ec8ff021771d023f1b20225227dc2deb')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

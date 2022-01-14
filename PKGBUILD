# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.10.1
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
sha256sums_x86_64=('28be02d3db2285986ae7cb65bd54349257e14e6333e573c2150a0f2d60c6775c')
sha256sums_aarch64=('33564d08c0fdcb5814cd2437a7b505ae8483536dd38ee8d90bc966a84e1db4a3')
sha256sums_armv7h=('5779815d412b22f4a327735b0384ee99e8082ef6cf33f9d6b88fbc624c9a637a')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.10.0
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
sha256sums_x86_64=('919bb1495c2012b27d6c97285df0ba1f92ba1f2b7d1e85f3cbcd95b2a90292ae')
sha256sums_aarch64=('7450b79046d0df2163d7efe3fc2326609b3d96111dea4731d733208f50631ab9')
sha256sums_armv7h=('380dfa7baa66983126e5c3ea45e97e77d8ee527e8be78c633b363711eb5560ee')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}

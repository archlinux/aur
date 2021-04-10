# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=kopia-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.8.0
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kopia/kopia/'
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/kopia/kopia/releases/download/v$_pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/kopia/kopia/releases/download/v$_pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.deb")
source_armv7h=("https://github.com/kopia/kopia/releases/download/v$_pkgver/${pkgname%-bin}_${pkgver}_linux_armhf.deb")
sha256sums_x86_64=('6d40f2d5ebbbe1aafb0c0085dcb263a8dd5b225833b410f5f26f581148d2fc4e')
sha256sums_aarch64=('50dc6b0d59e5f9a2aab3c983bb57e8e1ba0d68444e03a7595853cd169dd8cd54')
sha256sums_armv7h=('c745fb4d9a2d21003a0688a827b15e870f48fa1f8120d25a48d917f20c85b96b')

package() {
    tar -xf data.tar.gz -C "${pkgdir}"
}

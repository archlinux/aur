# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=kopia-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.8.0~beta3
_pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kopia/kopia/'
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/kopia/kopia/releases/download/v$_pkgver/${pkgname%-bin}_${_pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/kopia/kopia/releases/download/v$_pkgver/${pkgname%-bin}_${_pkgver}_linux_arm64.deb")
source_armv7h=("https://github.com/kopia/kopia/releases/download/v$_pkgver/${pkgname%-bin}_${_pkgver}_linux_armhf.deb")
sha256sums_x86_64=('f9af94513163dbdbe6e4ededc274f4947adbdf022f10534042b1f3d6e7ad0d18')
sha256sums_aarch64=('785d8ef4d7c90097caebfe67cb5f588fd641ded309b829e55c7b68adef0df40f')
sha256sums_armv7h=('7133c6605cc82e77aadfa4e9dfebd812f86fe391b59f5816f1db6c7d575e00b7')

package() {
    tar -xf data.tar.gz -C "${pkgdir}"
}

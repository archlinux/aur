# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=kopia-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.8.0~beta4
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
sha256sums_x86_64=('d9f17b4aa81a6411038ce9311e5efe1ea337536257d63f6dd128f2bbf5778fab')
sha256sums_aarch64=('5915b02806e6278ceb58483eb4936832b9ecc822c96e9cba5cd2dee893b011e4')
sha256sums_armv7h=('f7eb83bedcf810dc019c5464ce3f4b692b11d94597788b3fb364fe7e7ccfff62')

package() {
    tar -xf data.tar.gz -C "${pkgdir}"
}

# Maintainer: Filip Parag <filip@parag.rs>

pkgname=mergetb-cli-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="Command-line tool used to interact and manage a Merge testbed and experiments"
arch=('x86_64' 'i686' 'aarch64')
conflicts=()
provides=()
url="https://gitlab.com/mergetb/portal/cli/"
license=()
depends=()
source_x86_64=("mrg_${pkgver}_amd64.tar.gz::https://gitlab.com/mergetb/portal/cli/-/releases/v${pkgver}/downloads/mrg_${pkgver}_linux_amd64.tar.gz")
source_i686=("mrg_${pkgver}_i386.tar.gz::https://gitlab.com/mergetb/portal/cli/-/releases/v${pkgver}/downloads/mrg_${pkgver}_linux_386.tar.gz")
source_aarch64=("mrg_${pkgver}_arm64.tar.gz::https://gitlab.com/mergetb/portal/cli/-/releases/v${pkgver}/downloads/mrg_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('41a0ffae205a19fef19ffb670d434d85286f21a017cdc83563a15a3202f3aeaf')
sha256sums_i686=('ef340aa0ec82f519590a4ed3d7980ab45a5db99f7559715bdde8da08211f7681')
sha256sums_aarch64=('634a49e54e7ae43d2525fb3e3f33fcb42b022f29f8b1411cf81d34321854a21c')

package()
{
    install -Dm755 "${srcdir}/mrg" "${pkgdir}/usr/bin/mrg"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/mrg/README.md"
}

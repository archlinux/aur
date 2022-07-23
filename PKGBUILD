# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.0.3
pkgrel=1
pkgdesc="A TUI based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'dbus')
provides=('bluetuith')
conflicts=('bluetuith')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_x86_64=("84b7e64842a5a40871f2593478e68afb8cdf96fb4b6f94960a2fbaac248c64e7")
sha256sums_i686=("d2809db2162cde596b2f5831f719f39d5cb60444f202157cfd093c2fc731fc03")
sha256sums_arm=("1d377eaf1ea9a5d8ce396792e5ef2ce34c8e919db425f02919a493f76cdcb9bd")
sha256sums_aarch64=("72ca6da8680e03a8202a183d5534e42ab7053251f3becbef190227287ced4c3e")
sha256sums_armv6h=("1c7018a9ec8d45fe711fdfa949d542669384a585623b3cd274ab473f26cefde4")
sha256sums_armv7h=("277d2df2ee41b484322c9ff09056ede357f2dee2fc844c2ee07184969f33f005")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}

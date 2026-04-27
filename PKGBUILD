# Maintainer: xifan <xifan2333@gmail.com>
# NOTE: This is an unofficial, community-maintained package.

pkgname=kiro-account-manager-bin
_pkgname=kiro-account-manager
pkgver=1.8.4
pkgrel=1
pkgdesc="Kiro IDE account manager - multi-account switching and quota monitoring (Unofficial Community Package)"
arch=('x86_64')
url="https://github.com/hj01857655/kiro-account-manager"
license=('LicenseRef-CC-BY-NC-SA-4.0')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('libappindicator-gtk3: for system tray icon support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("KiroAccountManager_1.8.4_amd64.deb::https://github.com/hj01857655/kiro-account-manager/releases/download/v1.8.4/KiroAccountManager_1.8.4_amd64.deb")
sha256sums_x86_64=('8c0c0f790c89f0b228c4533796aab0343017b26d23daa38a5bcd4d259d27d278')

package() {
	bsdtar -xf "${srcdir}/KiroAccountManager_${pkgver}_amd64.deb"
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
}

# Maintainer: xifan <xifan2333@gmail.com>
# NOTE: This is an unofficial, community-maintained package.

pkgname=kiro-account-manager-bin
_pkgname=kiro-account-manager
pkgver=1.9.301
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
source_x86_64=("KiroAccountManager_1.9.301_amd64.deb::https://github.com/hj01857655/kiro-account-manager/releases/download/v1.9.301/KiroAccountManager_1.9.301_amd64.deb")
sha256sums_x86_64=('a3ad65a2e391289ad859accbb533026901c5090c2fadd7b7aa90352103c775bf')

package() {
	bsdtar -xf "${srcdir}/KiroAccountManager_${pkgver}_amd64.deb"
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
}

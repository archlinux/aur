# Maintainer: Orang Studio <https://github.com/Orang-Studio>
pkgname=orangtask-bin
_pkgname=orangtask
pkgver=2
pkgrel=1
pkgdesc="Native desktop client for OrangTask (prebuilt binary)"
arch=('x86_64')
url="https://task.oranges.lt"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-websockets' 'qtkeychain-qt6'
         'layer-shell-qt' 'hicolor-icon-theme')
optdepends=('krunner: search tasks from KRunner'
            'kwallet: store sign-in tokens in KWallet')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname-v${pkgver}-linux-x86_64.tar.gz::https://github.com/Orang-Studio/OrangTask/releases/download/v${pkgver}/orangtask-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('c63e9c64c29cf2f2ec2a7aea4cfe3b70b931b140b9eddd6a850762b55248fc79')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

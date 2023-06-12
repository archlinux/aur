# Maintainer: Andrew Ryan <dnrops@outlook.com>
#

pkgname=wechat_app
pkgver=0.1.1
pkgrel=1
pkgdesc="Easy way to install wechat in archlinux"
url="https://dnrops.gitee.io"
license=("MIT")
arch=("x86_64")
depends=(deepin-wine6-stable deepin-wine-helper)
provides=("wechat_app")
conflicts=("wechat_app")
source=("https://gitcode.net/dnrops/atom_bin/-/raw/master/wechat/deepin-wine-wechat-3.7.6.44-1-x86_64.pkg.tar.zst")
sha256sums=('6748c27aeddd5078220d83f4c588b1ffb47d70e692fb5af6836491e8cfa02f91')

package() {
    cd "$srcdir"
    sudo pacman -U "${srcdir}/deepin-wine-wechat-3.7.6.44-1-x86_64.pkg.tar.zst" --noconfirm
}

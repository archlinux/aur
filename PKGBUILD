
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=com.xuexiqiangguo.webclient.deepin
pkgver=1.0.1
pkgrel=1
pkgdesc="提供海量、免费的图文和音视频学习资源，探索“有组织、有管理、有指导、有服务”学习，让学习更多样、更个性、更智能、更便捷。"
arch=(x86_64)
url="www.xuexi.cn"
license=('custom')
depends=(
qt5-webchannel
bash
dtkwidget
glibc
gcc-libs
qt5-webengine
qt5-webkit
qt5-declarative
qt5-location
libglvnd
qt5-base
qt5-x11extras
)
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/x/xuexiqiangguo/com.xuexiqiangguo.webclient.deepin_1.0.1_amd64.deb"
        )
sha256sums=('3a5f307d6cb2e0723051590fbf830248b1c1a1acba8107d028b169cf95744387')

package() {
tar -xvpf data.tar.* -C $pkgdir
echo "run /opt/apps/com.xuexiqiangguo.webclient.deepin/files/bin/com.xuexiqiangguo.webclient.deepin.sh"
}

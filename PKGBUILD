# Maintainer: Sakura1943 <1436700265@qq.com>
pkgname=hexo-deployer-with-theme-typography
pkgver=1.1
pkgrel=1
pkgdesc="Hexo deployment tool with typography theme"
arch=(x86_64)
url="https://gitlab.com/Sakura1943/hexo-deployer-with-theme-typography"
license=('GPL')
depends=('vim' 'nano' 'git' 'wget' 'curl' 'tar' 'gzip' 'zip' 'nodejs-lts-erbium')
provides=(hexo-deployer-with-theme-typography=$pkgver)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.yaoyz.cn/hexo//hexo.sh")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

package() {
           chmod u+x ${srcdir}/hexo.sh
           sh ${srcdir}/hexo.sh
}

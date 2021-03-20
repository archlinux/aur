# Maintainer: sakura1943 <1436700265@qq.com>
pkgname=hexo-with-theme-typography
pkgver=1.0.1
pkgrel=1
pkgdesc="hexo部署脚本-带typography主题"
arch=(x86_64)
url="https://mirrors.yaoyz.cn/hexo/hexo.sh"
license=('GPL')
depends=('nodejs-lts-erbium' 'npm' 'git' 'wget' 'curl' 'tar' 'gzip' 'zip')
provides=(hexo-with-theme-typography=$pkgver)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.yaoyz.cn/hexo/hexo.sh")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

package() {
                  chmod +x hexo.sh
                  sh hexo.sh
}

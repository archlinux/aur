 # Maintainer: Shen ZhongLi <szl921818@gmail.com>
#mindmaster 中文版

pkgname=mindmaster-cn
pkgver=7.0
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster")
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
source_x86_64=("https://www.edrawsoft.cn/2download/mindmaster-7-amd64-cn.deb")
sha256sums_x86_64=('5d13d5c962514ff0ff79f5278b3de693ac65fff052d20fcea2ca54f6a6689d80')

package() {	
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.xz"
    
    mkdir -p ${pkgdir}/usr/bin
    
    ln -f -s /opt/MindMaster-7/MindMaster "${pkgdir}/usr/bin/mindmaster"
}

# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawmax-cn
pkgver=10.5.0
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("edrawmax")
pkgdesc="强大的办公绘图、工程绘图、图文编辑、彩页设计软件"
license=('Commercial')
url="https://www.edrawsoft.cn/edrawmax/"
source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/edrawmax-10-5-cn.deb")
sha256sums_x86_64=('SKIP')

package() {	
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.xz"
    
    mkdir -pv ${pkgdir}/usr/bin
    mkdir -pv ${pkgdir}/usr/share/icons
    mkdir -pv ${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes
    mkdir -pv ${pkgdir}/usr/share/mime/packages
    
    ln -f -s /opt/EdrawMax-10/EdrawMax "${pkgdir}/usr/bin/EdrawMax"
    
    ln -f -s /opt/EdrawMax-10/edrawmax.png "${pkgdir}/usr/share/icons/edrawmax.png"
    
    ln -f -s /opt/EdrawMax-10/eddx.svg "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/eddx.svg"
    
    ln -f -s /opt/EdrawMax-10/edrawmax.xml "${pkgdir}/usr/share/mime/packages/edrawmax.xml"
        
}

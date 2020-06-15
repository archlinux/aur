#Maintainer: h0cheung <unknow>
#Maintainer: WhiredPlanck <unknow>

pkgbase=yozo-office-2019
pkgname=('yozo-office-2019-templates')
_pkgver=8.0.1331.101ZH.S1
pkgver=8.0.1331.101ZH.S1
pkgrel=1
pkgdesc="永中办公默认模板文件 | Templates files provided by Yozo Office"
url="https://www.yozosoft.com/product-officelinux.html"
options=('!emptydirs'
         '!strip')
license=("custom")
arch=('x86_64') 

source_x86_64=("http://www.yozosoft.com/portal-download/fileManager/PRODUCT/yozo-office_${pkgver}_amd64.deb")
md5sums_x86_64=('cf22531071e607019c02a1a046f70e5c')

package_yozo-office-2019-templates() {
    cd "${srcdir}"
    bsdtar -xpf data.tar.xz
    install -d "${pkgdir}/opt/Yozosoft/Yozo_Office"
    mv opt/Yozosoft/Yozo_Office/Templates "${pkgdir}/opt/Yozosoft/Yozo_Office"
    rm -rf etc/skel
    chmod 755 usr/bin
    chmod 755 usr/lib
    chmod 755 usr/lib64
    chmod 755 opt
    install=${pkgname}.install
}

pkgname=yozo-office
_pkgver=7.0.2439.101ZH.S1
pkgver=7.0.2439.101ZH.S1
pkgrel=2
pkgdesc="Yozo Office - An M$ Office Compatible Office Suit"
url="http://www.yozosoft.com/"
depends=('libxtst' 'libxt')
optdepends=('ttf-ms-fonts: Arial, Times, Courier etc.'
			'ttf-ms-win10-zh_cn: SimSun, SimHei, MSYH, Tahoma etc.')
options=('!strip')
license=("unknown")
arch=('i686' 'x86_64') 
install=yozo-office.install

source_x86_64=('http://download.yozosoft.com/free/zh/2018/yozo-office_7.0.2439.101ZH.S1_amd64.deb')
md5sums_x86_64=('SKIP')

package() {
cd "$srcdir"
tar -xvf data.tar.xz
mv usr etc opt "$pkgdir"
rm -rf "${pkgdir}/usr/share/mime"
targetP="${pkgdir}/opt/Yozosoft/Yozo_Office"
unpackP="${targetP}/Jre/bin/unpack200"
libP="${targetP}/Jre/lib"
}
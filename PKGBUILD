# Maintainer: zhullyb < zhullyb [at] outook dot com >
# Maintainer: sukanka < su975853527 [at] gmail dot com >
pkgname=aliyunpan-liupan1890
url="https://github.com/liupan1890/aliyunpan"
pkgrel=4
pkgver=2.12.14
_build_id=04222746
pkgdesc="阿里云盘小白羊版 阿里云盘PC版"
arch=("any")
license=("None")
_electron=electron12
depends=(${_electron} 'aria2')
optdepends=('mpv: media preview support')
source=("https://download.copr.fedorainfracloud.org/results/zhullyb/zhullyb/fedora-35-x86_64/${_build_id}-aliyunpan-liupan1890-bin/aliyunpan-liupan1890-bin-${pkgver}-1.x86_64.rpm")
sha256sums=('6f046e3f4f3f116996b2cfb195234489c1b7fa9b137929818c34bb8193a85a5d')

package(){
	cp -pr ${srcdir}/usr ${pkgdir}
}

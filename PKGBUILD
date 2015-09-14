# Maintainer: Vanitas <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>
pkgbase=sogou
pkgname=sogou
pkgver=1.2.0.0056
pkgrel=1
pkgdesc="Sogou Pinyin for Linux"
arch=('x86_64' 'i686')
url="http://pinyin.sogou.com/linux/"
license=('custom')
depends=('fcitx-sogoupinyin')

if [ "${CARCH}" = "i686" ]; then
    _LIB_DIR=i386-linux-gnu
    _ARCH=i386
    _time=1432524151

else
    _LIB_DIR=x86_64-linux-gnu
    _ARCH=amd64
    _time=1432523940
fi

source=("http://7xizf7.com1.z0.glb.clouddn.com/fcitx-qimpanel.real"
	    "http://7xizf7.com1.z0.glb.clouddn.com/fcitx-qimpanel"
			"http://7xizf7.com1.z0.glb.clouddn.com/libcurl.so.4")
md5sums=(
         'b55df1dffa61fb1af40199a8e1b2244b'
         '62b2b974c475bab9f6cf6d5ee83b984a'
         '9a88e363ea255a66be7791952e73542b')
package(){
    cd ${srcdir}

	sudo cp fcitx-qimpanel.real /usr/bin
	sudo cp fcitx-qimpanel  /usr/bin
	sudo cp libcurl.so.4  /usr/share/fcitx-sogoupinyin/
}
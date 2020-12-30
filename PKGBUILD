pkgname=wechat-uos
pkgver=2.0.0
pkgrel=2
pkgdesc="UOS专业版微信魔改版"
arch=('x86_64')
depends=(gtk2 libxss gconf nss)
license=('custom')
source=('file://com.qq.weixin_2.0.0_amd64.deb' 'uos-lsb' 'uos-release' 'wechat-uos')
md5sums=('5b8c60c9f94fd874df749abdd1dccec6'
         '22fba1df4190124f76bd8b6eb400787a'
         '83cc604a6c8ceedcfb66bb732f8c030f'
         'a7d7323cd865cc44fee09adb52963a78')
package() {
    tar xpf data.tar.xz -C $pkgdir
    install -Dm644 uos-lsb uos-release -t "$pkgdir"/opt/apps/com.qq.weixin/craps/
    install -Dm755 wechat-uos -t "$pkgdir"/usr/bin/
}

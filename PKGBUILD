# Maintainer: DuckSoft <realducksoft@gmail.com>
pkgname=wechat-uos
pkgver=2.0.0
pkgrel=6
pkgdesc="UOS专业版微信 (迫真魔改版)"
arch=('x86_64')
depends=(gtk2 gtk3 libxss gconf nss lsb-release bubblewrap)
license=('custom')
source=('https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.weixin/com.qq.weixin_2.0.0_amd64.deb' 'uos-lsb' 'uos-release' 'wechat-uos')
md5sums=('5b8c60c9f94fd874df749abdd1dccec6'
         '22fba1df4190124f76bd8b6eb400787a'
         '83cc604a6c8ceedcfb66bb732f8c030f'
         '069a824b6e757436401c26251fbffc49')
package() {
    tar xpf data.tar.xz -C $pkgdir
    install -Dm644 -t "$pkgdir"/opt/apps/com.qq.weixin/craps/ \
        uos-lsb \
        uos-release
    install -Dm755 wechat-uos -t "$pkgdir"/usr/bin/
}

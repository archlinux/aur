# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara5-micro
pkgver=5.181
pkgrel=1
pkgdesc="A Java EE application server, derived from GlassFish Open Source Edition. (Micro Edition)"
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname" "payara51")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("payara-${pkgver}-micro.zip::https://info.payara.fish/cs/c/?cta_guid=21e00628-5d9e-400a-9805-1fc99fe0de87&placement_guid=0c1037e0-adaf-4401-b888-05088602db6a&portal_id=334594&redirect_url=APefjpE_uK4aYmUfSbouXcqyPeKesliLSxqzwJIvL1ZO5ZcuNrB1CVmFm8jKOPQ7Nzx9DJRdKkh_m73mmssZeyNtJin9Lx_n9voGC4Qy6HK6WZPmkRg6BUcvLUcwNbXp6TFIAXv62C8IcIaInIhxPptyI4k_LwW9stxb4RV9_TztI0LQy86uqaxylMkFpbGUEKThy05I5uj_lByBYRdffpktE4wfWw_YZmT4DjV7CW8-Wl8kyEZ9Almr44vo1DazXyMPntZLOOfl&hsutk=620a9ed62186b8571bcc43e5e4075f89&canon=https%3A%2F%2Fwww.payara.fish%2Fdownloads&click=457f94b8-1cc5-4529-ac81-59c081b09534&utm_referrer=https%3A%2F%2Fwww.payara.fish%2Fabout&__hstc=229474563.620a9ed62186b8571bcc43e5e4075f89.1527986372648.1527986372648.1527986372648.1&__hssc=229474563.3.1527986372648&__hsfp=794664957"
        "payara5-micro.service")

sha256sums=('d1b9fee97fa01df802dbdb169ecbdfc7f4dad59792daace81ec6f7573b01a8cc'
            'be71a959519aa009dcee2f1f6422acb47710099651d6c778391ea736cbc22873')

sha512sums=('690255fc6cf1eb807a70dbe04aa430107f854025c59c2857dac61e0113fefd9316fd07e5962c3d5f9223c2ef09a48a8ca3be93125aac738cdc83e5702c5f3dbf'
            '3449a64d3c3dcee6e035b45198deb077520c7fc6b963fcf7468430f15514ddabc68ae2f2f8c20ce2a55d58bbb6203b34bacf543fc5e31b4df2642666c26aa3bb')

package() {
    mkdir -p $pkgdir/opt/$pkgname
    cp -a META-INF MICRO-INF fish $pkgdir/opt/$pkgname
    install -D $srcdir/payara5-micro.service $pkgdir/usr/lib/systemd/system/payara5-micro.service
}
# vim:set ts=2 sw=2 et:

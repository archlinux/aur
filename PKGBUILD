# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara5-micro
pkgver=5.182
pkgrel=1
pkgdesc="A Java EE application server, derived from GlassFish Open Source Edition. (Micro Edition)"
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname" "payara51")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("payara-${pkgver}-micro.zip::https://info.payara.fish/cs/c/?cta_guid=21e00628-5d9e-400a-9805-1fc99fe0de87&placement_guid=0c1037e0-adaf-4401-b888-05088602db6a&portal_id=334594&redirect_url=APefjpHl6OFpYkrA2fSOjKKox_15up4bGrXmRTDxqXeDriYTCemsa3QOKpI_m61vAcWvPDB2WzeDtbkELlkcCK2U-LXCELFwojuT6JFInAF2cXDzV0-rpSPdTU_w8-Ycwr1sKW_uKjIcpgsr_htpC3sHqrmSVdrJibTLG-jEf99YsxEQFRdHKHChrj6HuI9EdPT4y6Xf7BXVMXMNBsasdG_SVutZDL8Z3lMSVMKPrXuAcAhiNOxhK9z2-UYVBbobNXx-W1ozIaGh&hsutk=ce9c20bff94221fd231baf88a9f6dba6&canon=https%3A%2F%2Fwww.payara.fish%2Fdownloads&click=28b80d6f-ac3e-4ac1-b64f-2d0100a482c9&utm_referrer=https%3A%2F%2Fwww.payara.fish%2F&__hstc=229474563.ce9c20bff94221fd231baf88a9f6dba6.1530483205899.1530483205899.1530483205899.1&__hssc=229474563.2.1530483205900&__hsfp=439309316"
        "payara5-micro.service")

sha256sums=('ea4f3fd745dad9a219a25dd83d56f035ae7f2de427548802e008977c9893e969'
            'be71a959519aa009dcee2f1f6422acb47710099651d6c778391ea736cbc22873')

sha512sums=('ede2528dfdd9e7879cd3001469ac3b66b92db698aff1ce81c27aa98409e26114c75104dd1146800904619a26c3edadb5f4ecfd559763c2edcc1b19bc99f49dd1'
            '3449a64d3c3dcee6e035b45198deb077520c7fc6b963fcf7468430f15514ddabc68ae2f2f8c20ce2a55d58bbb6203b34bacf543fc5e31b4df2642666c26aa3bb')

package() {
    mkdir -p $pkgdir/opt/$pkgname
    cp -a META-INF MICRO-INF fish $pkgdir/opt/$pkgname
    install -D $srcdir/payara5-micro.service $pkgdir/usr/lib/systemd/system/payara5-micro.service
}
# vim:set ts=2 sw=2 et:

# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara51
pkgver=5.181
pkgrel=1
pkgdesc="A Java EE application server, derived from GlassFish Open Source Edition. (Full Version)"
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("payara-$pkgver.zip::https://info.payara.fish/cs/c/?cta_guid=de4a19f2-46e5-4f92-88ae-36300d4edcc2&placement_guid=6c4914a9-26de-4da5-b0fe-cd9f01ed1bea&portal_id=334594&redirect_url=APefjpGbKkPVgtCu26s680z7kPbJsydj1-zT6W1aCP0cc4rx2qYvSMnm8ssxiz57Gdc9-ytULkcx-Ktw1xe1I6MvFL1H_tAJUepYfRzaT7R2EHndeHpG5Umjg-w3bu6GbBdxIAAw3-KGoB18DyIseL1fE8Vx1shsLLj2Cp4QPtMWr78rwlJAGW0rU3LmthW61AjYmvl2Ay_2yiSxI6-QsNHv3T1ib3stZFqSTQb2mv9bYRC7c1Iqvpf11vf3RHfGF8N35xkw4fZO&hsutk=620a9ed62186b8571bcc43e5e4075f89&canon=https%3A%2F%2Fwww.payara.fish%2Fdownloads&click=6d7d81ae-d10e-455f-999a-ee346d8672eb&utm_referrer=https%3A%2F%2Fwww.payara.fish%2Fabout&__hstc=229474563.620a9ed62186b8571bcc43e5e4075f89.1527986372648.1527986372648.1527986372648.1&__hssc=229474563.3.1527986372648&__hsfp=794664957"
        "payara51.service")

sha256sums=('b2e96f1ad5deb2e8dcd854944dde86225d58de5f1326824b17f1b6a58a31bc7f'
            '6d88ef600ae4a7440d8215985bc186c04a10850bc9513017e143da4028ac80af')

sha512sums=('22dca87340fbc882a1c5636c3a9a907ebe67de25076cadf1b3c2ffc4414bbe0390c89ffa0ff0fc7dff1c4a5caa24da0c3f1202abe96be27642d7f86015eeacf1'
            '33c3e61d4fa769dea99a1f69678fa1517cdcb6a76d091e1b85e6e819bd797432df156bf2d7a6a13b98f15f7f2e8beb703d1951f65a25846e50fc647c45277b82')

package() {
    mkdir -p $pkgdir/opt
    cp -a payara5 $pkgdir/opt/
    install -D $srcdir/payara51.service $pkgdir/usr/lib/systemd/system/payara51.service
}
# vim:set ts=2 sw=2 et:

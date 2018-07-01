# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara51
pkgver=5.182
pkgrel=1
pkgdesc="A Java EE application server, derived from GlassFish Open Source Edition. (Full Version)"
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
#conflicts=("$pkgname")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("payara-$pkgver.zip::https://info.payara.fish/cs/c/?cta_guid=de4a19f2-46e5-4f92-88ae-36300d4edcc2&placement_guid=6c4914a9-26de-4da5-b0fe-cd9f01ed1bea&portal_id=334594&redirect_url=APefjpGXAUxOdOhrTzs5pFyK2LapD9rqsX9bRdYUHr8SkeS9-Euij6jLeoKJ-EI6UXP9sjUcWmH3c51EEcTPp4Se7epqjtbWIu-RqJKETh4F0WQaceuCYctDrHFf4GuBITjQeXhKF-ePfiC2F42zJEvKSRC6-50UdEoNe7uVVcFjV0Nr_yp0bkKsKx2QcM1mIAdpijAy1fDNZTKMvAm0aC-cLV7lvB8PYPaU9fGvgLs50LkkXtKPM_mZ7gXqTeQYAS43HAqH4MPr&hsutk=ce9c20bff94221fd231baf88a9f6dba6&canon=https%3A%2F%2Fwww.payara.fish%2Fdownloads&click=aea9db7f-2396-4dd6-a4cb-773b8cc795a1&utm_referrer=https%3A%2F%2Fwww.payara.fish%2F&__hstc=229474563.ce9c20bff94221fd231baf88a9f6dba6.1530483205899.1530483205899.1530483205899.1&__hssc=229474563.2.1530483205900&__hsfp=439309316"
        "payara51.service")

sha256sums=('07386f5b93482ae80020e5eb45af313f2563ccbd84756df950eb65f42977186e'
            '6d88ef600ae4a7440d8215985bc186c04a10850bc9513017e143da4028ac80af')

sha512sums=('163c81de2ffc1c59731d963b0967da6c6d48f0549913f7375c00735a40ea56bf6b07eba2270d3b2fad9e3d1adca7f41e2f18a29d1c2618fefb9a49a7a34d77ba'
            '33c3e61d4fa769dea99a1f69678fa1517cdcb6a76d091e1b85e6e819bd797432df156bf2d7a6a13b98f15f7f2e8beb703d1951f65a25846e50fc647c45277b82')

package() {
    mkdir -p $pkgdir/opt
    cp -a payara5 $pkgdir/opt/
    install -D $srcdir/payara51.service $pkgdir/usr/lib/systemd/system/payara51.service
}
# vim:set ts=2 sw=2 et:

# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=payara
pkgver=4.1.1.171.0.1
pkgrel=1
pkgdesc="A Java EE application server, drived from GlassFish Open Source Edition."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("java-environment>=7")
arch=("any")
options=(!strip)
source=("$pkgname-$pkgver.zip::http://info.payara.fish/cs/c/?cta_guid=b9609f35-f630-492f-b3c0-238fc55f489b&placement_guid=7cca6202-06a3-4c29-aee0-ca58af60528a&portal_id=334594&redirect_url=APefjpENG7E61H6HVxPSoG60xjmGh7PzsXF6qnt-h-lqlkHNX5ysMqWSJgx1xa6ctBxQVuaAvWttGRlGLCED8HRqLu8wxAmW4H4h8aEX8oV9Bp-RZ6HiV0c&hsutk=c7a00000-1d71-1814-19b0-015a617177b7&canon=http%3A%2F%2Fwww.payara.fish%2Fall_downloads&utm_referrer=http%3A%2F%2Fwww.payara.fish%2Fdownloads%3Futm_campaign%3DPayara+Downloads%26utm_source%3Dhs_email%26utm_medium%3Demail%26utm_content%3D43048596%26_hsenc%3Dp2ANqtz-8igP-XyxRBWylPBuJmncYsoaesVZhiUWBSShFyBuOPHKZR9eP36fzyUPV8j5AGHoaD7VfeYpxoewYPrX3yT_JXfZuhHw%26_hsmi%3D43048596"
        "payara.service")

md5sums=('19918ca14c164e38a3cf90dfc3e68f43'
         'a0cc30982527ddf863e3f2f37233071b')

package() {
    mkdir -p $pkgdir/opt
    mv payara41 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}

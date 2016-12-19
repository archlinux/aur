# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=payara
pkgver=4.1.1.164
pkgrel=1
pkgdesc="A Java EE application server, drived from GlassFish Open Source Edition."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("java-environment>=7")
arch=("any")
options=(!strip)
source=("$pkgname-$pkgver.zip::http://info.payara.fish/cs/c/?cta_guid=3462e195-f07d-44a2-8815-23bdbf456583&placement_guid=908761da-2736-4afd-b6e5-023e5a101b91&portal_id=334594&redirect_url=APefjpH9TAZv5p9ePHwZhUSsPpGr2xy2KH7My2k3QDBJj7gYIJpG4rafzfCGE2IX0knubfjNzNOypZMTF48sU8pNz5cDUcOpHGTol_t_afvtEq0BjZ0RJf0&hsutk=&canon=http%3A%2F%2Fwww.payara.fish%2Fall_downloads"
        "payara.service")

md5sums=('d3c198b8cab4f5c0931b13511279c717'
         'a0cc30982527ddf863e3f2f37233071b')

package() {
    mkdir -p $pkgdir/opt
    mv payara41 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}

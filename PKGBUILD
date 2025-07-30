# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=enola
pkgname=enola-bin
pkgver=0.4.0
pkgrel=3
arch=("x86_64")
pkgdesc="CLI tool to hunt down social media accounts by username across social networks"
url="https://github.com/TheYahya/enola"
provides=("$_projectname")
conflicts=("$_projectname")
license=("MIT")
source=("$_projectname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_projectname}_${pkgver}_linux_amd64.tar.gz"
        "$_projectname-LICENSE::https://raw.githubusercontent.com/TheYahya/$_projectname/refs/heads/main/LICENSE")
b2sums=("a18cb58877021b19e9f59b431cdd03c562d93b6db3a3d38c77bc4d08e528ce14de8172cc0d88fe8bba8cbdf664a8c2616fc1b633e79e5ed1ddf90bce9e6ad006"
        "073b1ffbfe079ba523db6b876fe769136ff16a50aea016e3b1760d08b160b136aeef95948ac937ca4347bcbf290f42641c3330834c80dd826bee20d215fb0118")

package() {
    install -Dm 0755 enola "$pkgdir/usr/bin/enola"
    install -Dm 0644 $_projectname-LICENSE "$pkgdir/usr/share/licenses/$_projectname/LICENSE"
}

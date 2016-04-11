pkgname=asp.net-bin
_name="dnx-coreclr-linux-x64.1.0.0-rc1-update1"
pkgver=1.0.0rc1
pkgrel=1
pkgdesc="ASP.NET 5"
arch=(i686 x86_64)
license=('MIT')
url="https://docs.asp.net/en/latest/getting-started/installing-on-linux.html#install-using-prebuild-binaries"
depends=('icu52')
provides=('asp.net')
options=('!strip')
source=("https://go.microsoft.com/fwlink/?LinkId=703941")

build() {
  cd "$_name"
}

package() {
#cd "$name"
install -d "$pkgdir/usr/bin"
install -d "$pkgdir/usr/lib/asp.net"
cp -ra "$_name" "$pkgdir/usr/lib/asp.net/"

#TODO: find out how to best create something in /usr/bin so that dnu --runtime active can be resolved
#echo '#!/usr/bin/bash
#cd /usr/lib/asp.net/'$_name/bin'
#./dnu $@' > "$pkgdir/usr/bin/dnu"
#echo '#!/usr/bin/bash
#cd /usr/lib/asp.net/'$_name/bin'
#./dnx $@' > "$pkgdir/usr/bin/dnx"
#chmod a+x "$pkgdir/usr/bin/"*

#ln -s /usr/lib/asp.net/bin/dnu "$pkgdir/usr/bin"
#ln -s /usr/lib/asp.net/bin/dnx "$pkgdir/usr/bin"

}
md5sums=('200646b706984af5e1ec4e2687ffad2a')

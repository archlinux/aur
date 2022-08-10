# Maintainer: Yakumo Saki <yakumo at ziomatrix dot org>
pkgname=zabbix-getter-bin
pkgver=0.9.4
pkgrel=1
epoch=
pkgdesc="Simple tool to get latest value from zabbix"
arch=("x86_64")
url="https://github.com/yakumo-saki/zabbix-getter/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/yakumo-saki/zabbix-getter/releases/download/v${pkgver}/zabbix-getter_v${pkgver}_linux_amd64.tar.gz")
noextract=()
md5sums=("2d3576509cf0a25b50723a2c9e81f877")
validpgpkeys=()
# TO VERSION UP 
# 1. Edit PKGBUILD(this file) pkgver and md5sums
#    md5sum can calculate by `md5sum target-filename.tar.gz`
# 2. build by `makepkg -s`
# 3. create .SRCINFO by `makepkg --printsrcinfo > .SRCINFO`
# 4. git commit and git push
package() {
	_real_pkgname=zabbix-getter
	# cd $srcdir/${_real_pkgname}_v${pkgver}_linux_amd64
        ls -lh
	mkdir -p $pkgdir/usr/bin
	cp zabbix-getter $pkgdir/usr/bin
	chmod +x $pkgdir/usr/bin/zabbix-getter
	install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

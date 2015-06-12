# Maintainer: Erdal Mutlu <erdal at sisiya dot org>
pkgname=sisiya-remote-checks
pkgver=0.6.31
pkgrel=1
epoch=
pkgdesc="The SisIYA remote checks."
arch=('any')
url="http://www.sisiya.org"
license=('GPL2')
groups=()
depends=('perl')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(
	'etc/sisiya/sisiya-remote-checks/SisIYA_Remote_Config.pm' 
	'etc/sisiya/sisiya-remote-checks/SisIYA_Remote_Config_local.conf'
	'etc/sisiya/sisiya-remote-checks/conf.d/airport_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/apc_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/dbserver_SISIYACheckDB.properties.example'
	'etc/sisiya/sisiya-remote-checks/conf.d/dbs_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/dns_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/ftp_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/hpilo2_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/https_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/http_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/imap_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/ping_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/pop3_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/printer_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/qnap_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/sensor_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/SISIYACheckDB.properties'
	'etc/sisiya/sisiya-remote-checks/conf.d/smb_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/smtp_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/ssh_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/switch_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/telekutu_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/telnet_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/ups_cs121_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/ups_netagent_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/ups_systems.xml'
	'etc/sisiya/sisiya-remote-checks/conf.d/vmware_systems.xml'
	)
options=()
install=
changelog=
#source=("$pkgname-$pkgver.tar.gz")
source=("http://sourceforge.net/projects/sisiya/files/sisiya/$pkgver/pacman/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('9ba965d081d548c0801d12aa24427d7e') #generate with 'makepkg -g'

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

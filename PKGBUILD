# Maintainer: Erdal Mutlu <erdal at sisiya dot org>
pkgname=sisiya-client-checks
pkgver=__VERSION__
pkgrel=__RELEASE__
epoch=
pkgdesc="The SisIYA client programs and checks."
arch=('any')
url="http://www.sisiya.org"
license=('GPL2')
groups=()
depends=('perl' 'sysstat')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(
	'etc/sisiya/sisiya-client-checks/SisIYA_Config.pm' 
	'etc/sisiya/sisiya-client-checks/SisIYA_Config_local.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_baan_edi.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_baan_jobs_status.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_baan_slm.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_baan_users.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_battery.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_dmesg.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_filesystem.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_hpasm_cpu.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_hpasm_fans.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_hpasm_powersupply.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_hpasm_ram.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_hpasm_temperature.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_isuptodate.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_listening_socket.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_lpstat.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_mailq.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_mysql_table_status.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_ntpstat.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_oracle_hitratios.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_oracle_tablespace.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_process_count.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_progs.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_raid_hpacu.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_smart.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_softraid.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_ssh_attack.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_swap.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_system.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_temperature.conf' 
	'etc/sisiya/sisiya-client-checks/conf.d/sisiya_users.conf' 
	)
options=()
install=
changelog=
#source=("$pkgname-$pkgver.tar.gz")
source=("http://sourceforge.net/projects/sisiya/files/sisiya/$pkgver/pacman/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('__MD5SUM__') #generate with 'makepkg -g'

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

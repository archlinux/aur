# Maintainer: artoo <artoo@manjaro.org>

_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"

pkgbase=openrc-misc
pkgname=('cpupower-openrc'
		'connman-openrc'
		'fcron-openrc'
		'fuse-openrc'
		'metalog-openrc'
		'rsyslog-openrc'
		'sane-openrc'
		'syslog-ng-openrc'
		'lirc-utils-openrc'
		'lm_sensors-openrc'
		'ntp-openrc'
		'cups-openrc'
		'haveged-openrc'
		'salt-openrc'
		'mpd-openrc'
		'hdparm-openrc'
		'bitlbee-openrc'
		'thermald-openrc'
		'xe-guest-utilities-openrc'
		'virtualbox-guest-utils-openrc'
		'zfs-openrc'
		'clamav-openrc'
		'networkmanager-openrc'
		'boinc-openrc'
		'at-openrc'
		'libvirt-openrc')
pkgver=20150613
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-misc')
conflicts=('openrc'
		'openrc-git'
		'openrc-arch-services-git'
		'initscripts'
		'systemd-sysvcompat')
source=("fcron.initd::${_gentoo_uri}/sys-process/fcron/files/fcron.init.3"
		"rsyslog.confd::${_gentoo_uri}/app-admin/rsyslog/files/8-stable/rsyslog.confd"
		"rsyslog.initd::${_gentoo_uri}/app-admin/rsyslog/files/8-stable/rsyslog.initd"
		"saned.confd::${_gentoo_uri}/media-gfx/sane-backends/files/saned.confd"
		"saned.initd::${_gentoo_uri}/media-gfx/sane-backends/files/saned.initd"
		"fuse.initd::${_gentoo_uri}/sys-fs/fuse/files/fuse.init"
		"metalog.confd::${_gentoo_uri}/app-admin/metalog/files/metalog.confd"
		"metalog.initd::${_gentoo_uri}/app-admin/metalog/files/metalog.initd"
		"syslog-ng.confd::${_gentoo_uri}/app-admin/syslog-ng/files/3.6/syslog-ng.confd"
		"syslog-ng.initd::${_gentoo_uri}/app-admin/syslog-ng/files/3.6/syslog-ng.rc6"
		"lircd.confd::${_gentoo_uri}/app-misc/lirc/files/lircd.conf.4"
		"irexec.confd::${_gentoo_uri}/app-misc/lirc/files/irexec-confd"
		"lircd.initd::${_gentoo_uri}/app-misc/lirc/files/lircd-0.8.6-r2"
		"irexec.initd::${_gentoo_uri}/app-misc/lirc/files/irexec-initd-0.8.6-r2"
		"lircmd.initd::${_gentoo_uri}/app-misc/lirc/files/lircmd"
		"cpupower.confd::${_gentoo_uri}/sys-power/cpupower/files/conf.d-r2"
		"cpupower.initd::${_gentoo_uri}/sys-power/cpupower/files/init.d-r4"
		#"sensord.confd::${_gentoo_uri}/sys-apps/lm_sensors/files/sensord-conf.d"
		"sensord.initd::${_gentoo_uri}/sys-apps/lm_sensors/files/sensord-4-init.d"
		"fancontrol.initd::${_gentoo_uri}/sys-apps/lm_sensors/files/fancontrol-init.d-2"
		"lm_sensors.initd::${_gentoo_uri}/sys-apps/lm_sensors/files/lm_sensors-3-init.d"
		"ntpd.confd::${_gentoo_uri}/net-misc/ntp/files/ntpd.confd"
		"ntp-client.confd::${_gentoo_uri}/net-misc/ntp/files/ntp-client.confd"
		"sntp.confd::${_gentoo_uri}/net-misc/ntp/files/sntp.confd"
		"ntpd.initd::${_gentoo_uri}/net-misc/ntp/files/ntpd.rc-r1"
		"ntp-client.initd::${_gentoo_uri}/net-misc/ntp/files/ntp-client.rc"
		"sntp.initd::${_gentoo_uri}/net-misc/ntp/files/sntp.rc"
		"cupsd.initd::${_gentoo_uri}/net-print/cups/files/cupsd.init.d-r1"
		"connman.confd::${_gentoo_uri}/net-misc/connman/files/connman.confd"
		"connman.initd::${_gentoo_uri}/net-misc/connman/files/connman.initd2"
		"haveged.confd::${_gentoo_uri}/sys-apps/haveged/files/haveged-conf.d"
		"haveged.initd::${_gentoo_uri}/sys-apps/haveged/files/haveged-init.d.3"
		"salt-master.confd::${_gentoo_uri}/app-admin/salt/files/master-confd-1"
		"salt-master.initd::${_gentoo_uri}/app-admin/salt/files/master-initd-4"
		"salt-minion.confd::${_gentoo_uri}/app-admin/salt/files/minion-confd-1"
		"salt-minion.initd::${_gentoo_uri}/app-admin/salt/files/minion-initd-4"
		"salt-syncdic.confd::${_gentoo_uri}/app-admin/salt/files/syndic-confd-1"
		"salt-syncdic.initd::${_gentoo_uri}/app-admin/salt/files/syndic-initd-4"
		"salt-api.confd::${_gentoo_uri}/app-admin/salt/files/api-confd-1"
		"salt-api.initd::${_gentoo_uri}/app-admin/salt/files/api-initd-4"
		"mpd.initd::${_gentoo_uri}/media-sound/mpd/files/mpd2.init"
		"hdparm.confd::${_gentoo_uri}/sys-apps/hdparm/files/hdparm-conf.d.3"
		"hdparm.initd::${_gentoo_uri}/sys-apps/hdparm/files/hdparm-init-8"
		"bitlbee.confd::${_gentoo_uri}/net-im/bitlbee/files/bitlbee.confd"
		"bitlbee.initd::${_gentoo_uri}/net-im/bitlbee/files/bitlbee.initd"
		"xe-daemon.initd::${_gentoo_uri}/app-emulation/xe-guest-utilities/files/xe-daemon.initd"
		"vboxservice.initd::${_gentoo_uri}/app-emulation/virtualbox-guest-additions/files/virtualbox-guest-additions-8.initd"
		"clamd.confd::${_gentoo_uri}/app-antivirus/clamav/files/clamd.conf-r1"
		"clamd.initd::${_gentoo_uri}/app-antivirus/clamav/files/clamd.initd-r6"
		"NetworkManager.confd::${_gentoo_uri}/net-misc/networkmanager/files/conf.d.NetworkManager"
		"NetworkManager.initd::${_gentoo_uri}/net-misc/networkmanager/files/init.d.NetworkManager"
		"10-openrc-status::${_gentoo_uri}/net-misc/networkmanager/files/10-openrc-status-r4"
		"boinc.confd::${_gentoo_uri}/sci-misc/boinc/files/boinc.conf"
		"boinc.initd::${_gentoo_uri}/sci-misc/boinc/files/boinc.init"
		"atd.confd::${_gentoo_uri}/sys-process/at/files/atd.confd"
		"atd.initd::${_gentoo_uri}/sys-process/at/files/atd.rc8"
		"libvirtd.confd::${_gentoo_uri}/app-emulation/libvirt/files/libvirtd.confd-r4"
		"libvirtd.initd::${_gentoo_uri}/app-emulation/libvirt/files/libvirtd.init-r14"
		"virtlockd.initd::${_gentoo_uri}/app-emulation/libvirt/files/virtlockd.init-r1"
		"zfs.initd"
		"thermald.initd")
sha256sums=('ceada7a1c9e8b62cff506bc94a1813706c7de1ed23daf9c3450ad549df4fafb7'
            'f0b15a0334f6177a6cf23cb9b169302c75745dc30857f24a7d11892feb6b1ee4'
            '204c66d2b7d4d20115acc7499708cf538538fe1c100281ad55f909508041fb19'
            '197e44ba1f438a18f5f7d9f5858feb19c1ece4286d82a5e63caf9be5b964aa76'
            '4dd4e7fa07bf2ab2d4f5753156f5df0ad2277523f6755b0eab3d2db3480989e2'
            '22a22c914d2a4f0fb5fc8495f4b7efcd1819efde548c9033ca612c181cd29eda'
            'ec9f05b386a06a4b2d5398cc0c33f34eba3f5e74ad46ae203d682f8ebc593f99'
            '906c31e0817517dc6c141a7a10565140ea272d3c958a065f520a0ecb6f81912f'
            'b29325498ee3b1f3d63672efcd1e93f0745eecdb9f4bb05fed82a2f085399484'
            'aa027dac0d145bc342728864cd432a0cf3c25dd6cb66880e7b70df1a9d5a66cf'
            'd36ff77fa193a065d25e373723e03f1a9471205151b82c73a6574cce4f095962'
            'c404ad3b624004cab25bd3a89593cdeb0abbc25771d6e52caf2f37cb4f7b2b79'
            '1b1f2970cc81a6053fcb6c0ead786436b6423c67170087dde283e54f32ae16e5'
            '5e5a31fbd93294a6e210499a880fcab371b23706824c9d60d827b0187d7bade4'
            'd47f22a33a83c14a4a0c333d6a445c40e550c491899fb0c6d323e23fe1eac7b7'
            '9ab6f022d2b2948660decf5e383984e6ddb9e9e5e6e2761c3031378ddd87e947'
            '25f2a1665c88dc5227698bdedc2098d6e37d12d8b966f00e2a180c95a33cc8b4'
            '4bd482a54decc5a51aee60e19ae31b0182d5857b112754247f04c0829b159b07'
            '36d489296c31736f8015b0ce27052b3f1555b7fe6335120c0477b044b8e4fb8d'
            '9b018f9f7a0975988387858823fe59a5cd8af6413d8c3170db0e24aac6021ec3'
            '40803821f498267f6567436eedc18201b5ae4b5390d6872fb15a94200c2ac06f'
            'c7dc517cdb5ee10e2a07ccea15ec47ba0b7aff8ac1469204c8d7faf71bcae2c5'
            '97282007801cb9c0e3b431e2930dec3bb8ce8869f63f7e02d903846e96734684'
            '22a4b5e4c934ea8ba66764441b0bb60d31d23c147c8b64a4a035947327bfc3ec'
            '2e4a42dd64b7c6dacfcfefdab8dc1e7c45d7a0966ef8b928583d18393362c719'
            '8fbd405ad951e7ad046e4408abb98f4066077113187198767d52f28d7228bae4'
            '4705b68372090ee7db69da1ad35131551ed1ba99032db2486ff6c31d2170ce6b'
            '767a160c1b3392f0a12d3908a937548a2f604a9a121e744c309ee6f478420b02'
            'f0a561f124cac3791fba6ee7ef5bc3ea46bd7535edf9e864689b0d9cfa65d332'
            '3b53f4aabf937766b5aa806561e9b97ab2be49ac25d76ae97f4fca4ab7a42e33'
            '365e9cbde2564a0430d8d1c0f8bc367db2bb32937ebf61649196f0e6a1ab5363'
            '9f3f47a7af4d349a7c525455616139b5019d3b7d0290398ba8c50ab91a62d089'
            'c5eed64899811966220d04e4b9849ba77d2d111f34dc16f03960cf1ff5ec02da'
            '286148f5391d42c04a62a13cc125fa2130b5821e50da913c5a20d3a913e5f2d1'
            '06415d7f958210a4dd1490db5796b0d3c08392a81547f290776d9164dde786ae'
            '286148f5391d42c04a62a13cc125fa2130b5821e50da913c5a20d3a913e5f2d1'
            '7c3fe247d36f47e998e70e0715e6dc58df54e9b9bd5cead577884bb74461809e'
            '9f3f47a7af4d349a7c525455616139b5019d3b7d0290398ba8c50ab91a62d089'
            '78940f949714d654a80426871f4679b44466ae38e87a4d681f3f0ad353f7d607'
            '3591473024005cdb15f13809c7675fbb964dc1b13e7658a01e12e34c7e751897'
            '37c95ff723fa578e9039613d09dbf790d99113a318c065422986c744519214e9'
            '434beee81ba04c96fcd03e6b37a4578c2c25af2c1007368469c48dd37523d56e'
            '105afc0382fc5adc03ed644dba4e78817015a55432349f259a286ac3c1b06628'
            '2eaef8071b34c1a3d55271d283b31e25e081791e48a6a55eb394912e4954ba48'
            '24cbcf298b869e4451b08aeba0e3e4948aa7faaac649f18e8f600ae5fb86a8fb'
            '605e7fe4dea401547957db63e45f3f75ae2da3544b0ff1f3279fcf07217d5aac'
            '28ebd47810b0568fc7692218867d6804a1df70290681462f5555e230ca817732'
            'c00bb921afe65e31a9ac4bbcfc97e4c9afa7ad77604c2dcb7eedc152fec5bbd8'
            '4594573f01fe5e04b6dde4525796acf909158591bdcefd662ec23fe0d1c3e1bd'
            '5f368362ef5c6deed538f20dc582d6da3c86871bd42297fa78536c0312021843'
            'f8ed424818b866a0bf882c569f4484e8b1485ce7ac8c472f060fd877f2dcfe65'
            '286f5f11e54a73b41ebf1e35aae1db4c2c3e249a3bfce755ced84c8c1b361cc9'
            'd15f25a8e53e1d94abd1f30eda1e49be497ebbfcd167facc40b7f46128e01d5c'
            '92350108a385cc66dffab8c9fc9cc1c85ca1abf36d0ffb007a4e1e55291e0179'
            '0f7c55e125d9d16f30fd9d2335485cac0b64a9452128d564e9318290703d8229'
            'c2ca5d9a2d4ed433e91bd215c2ca678109cc981072897a497955e36760dc3b9f'
            'ed8514d347d3a8a0b243cfc25a85dedb1e595f1e29e874bcadd14ef5f5d03e58'
            'd156cf6a2b00d8d81529e63231fd49b2599838f6c79740fed6c443840e57ece8'
            '7321272190ea9846ab7e19b034649c1cd711d4f94a6bdcaaaec2f683bb822e7d'
            '4bbb4e610d2d6bb22d83aa2980dca052a23b90fa6985c8245601b716dec986f4')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-e 's|/usr/sbin|/usr/bin|g' \
		-i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_bitlbee-openrc() {
	pkgdesc="OpenRC bitlbee init script"
	depends=('openrc-core' 'bitlbee')
	backup=('etc/conf.d/bitlbee')
	install=bitlbee.install

	_inst_confd 'bitlbee'
	_inst_initd 'bitlbee'

	sed -e 's|need logger net|need net\n	use logger|' \
		-i "${pkgdir}/etc/init.d/bitlbee"
}

package_cpupower-openrc() {
	pkgdesc="OpenRC cpupower init script"
	depends=('openrc-core' 'cpupower')
	backup=('etc/conf.d/cpupower')
	install=cpupower.install

	_inst_confd 'cpupower'
	_inst_initd 'cpupower'
}

package_connman-openrc() {
	pkgdesc="OpenRC connman init script"
	depends=('openrc-core' 'connman')
	backup=('etc/conf.d/connman')
	install=connman.install

	_inst_confd 'connman'
	_inst_initd 'connman'
}

package_cups-openrc() {
	pkgdesc="OpenRC cups init script"
	depends=('cups' 'dbus-openrc')
	optdepends=('avahi-openrc: avahi initscripts')
	install=cups.install

	_inst_initd 'cupsd'

	sed -e 's|lp:lpadmin|daemon:sys|' \
		-e 's|@neededservices@|need dbus avahi-daemon|' \
		-i "${pkgdir}/etc/init.d/cupsd"
}

package_fcron-openrc() {
	pkgdesc="OpenRC fcron init script"
	depends=('openrc-core' 'fcron')
	groups=('openrc-misc')
	provides=('openrc-cron')
	conflicts=('cronie'
		'cronie-openrc'
		'openrc'
		'openrc-git'
		'openrc-arch-services-git'
		'initscripts'
		'systemd-sysvcompat')
	install=fcron.install

	_inst_initd 'fcron'

    sed -e 's|/usr/libexec|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/fcron"
}

package_ntp-openrc() {
	pkgdesc="OpenRC ntp init script"
	depends=('openrc-core' 'ntp')
	optdepends=('bind-openrc: bind initscript')
	provides=('openrc-timed')
	conflicts=('openntpd'
			'openntpd-openrc'
			'openrc'
			'openrc-git'
			'openrc-arch-services-git'
			'initscripts'
			'systemd-sysvcompat')
	backup=('etc/conf.d/ntpd'
		'etc/conf.d/ntp-client'
		'etc/init.d/sntp')
	install=ntp.install

	_inst_confd 'ntpd'
	_inst_initd 'ntpd'

	_inst_confd 'ntp-client'
	_inst_initd 'ntp-client'

	_inst_confd 'sntp'
	_inst_initd 'sntp'
}

package_rsyslog-openrc() {
	pkgdesc="OpenRC rsyslog init script"
	depends=('openrc-core' 'rsyslog')
	backup=('etc/conf.d/rsyslog')
	install=rsyslog.install

	_inst_confd 'rsyslog'
	_inst_initd 'rsyslog'
}

package_sane-openrc() {
	pkgdesc="OpenRC sane init script"
	depends=('openrc-core' 'sane')
	backup=('etc/conf.d/saned')
	install=sane.install

	_inst_confd 'saned'
	_inst_initd 'saned'

    sed -e 's|/run/saned/saned.pid|/run/saned.pid|' \
		-i ${pkgdir}/etc/init.d/saned
}

package_fuse-openrc(){
	pkgdesc="OpenRC fuse init script"
	depends=('openrc-core' 'fuse')
	install=fuse.install

	_inst_initd 'fuse'
}

package_metalog-openrc() {
	pkgdesc="OpenRC metalog init script"
	depends=('openrc-core' 'metalog')
	backup=('etc/conf.d/metalog')
	install=metalog.install

	_inst_confd 'metalog'
	_inst_initd 'metalog'
}

package_syslog-ng-openrc() {
	pkgdesc="OpenRC syslog-ng init script"
	depends=('openrc-core' 'syslog-ng')
	backup=('etc/conf.d/syslog-ng')
	install=syslog-ng.install

	_inst_confd 'syslog-ng'
	_inst_initd 'syslog-ng'
}

package_lm_sensors-openrc() {
	pkgdesc="OpenRC lm_sensors init script"
	depends=('openrc-core' 'lm_sensors')
	#backup=('etc/conf.d/sensord')
	install=lm_sensors.install

	_inst_initd 'sensord'
	_inst_initd 'fancontrol'
	_inst_initd 'lm_sensors'
}

package_lirc-utils-openrc() {
	pkgdesc="OpenRC lirc-utils init script"
	depends=('openrc-core' 'lirc-utils')
	backup=('etc/conf.d/lircd'
		'etc/conf.d/irexec')
	install=lirc-utils.install

	_inst_confd 'lircd'
	_inst_initd 'lircd'

	_inst_confd 'irexec'
	_inst_initd 'irexec'

	_inst_initd 'lircmd'
}

package_haveged-openrc() {
	pkgdesc="OpenRC haveged init script"
	depends=('openrc-core' 'haveged')
	backup=('etc/conf.d/haveged')
	install=haveged.install

	_inst_confd 'haveged'
	_inst_initd 'haveged'
}

package_salt-openrc() {
	pkgdesc="OpenRC salt init scripts"
	depends=('openrc-core' 'salt')
	backup=('etc/conf.d/salt-master'
		'etc/conf.d/salt-minion'
		'etc/conf.d/salt-syncdic'
		'etc/conf.d/salt-api')
	install=salt.install

	_inst_confd 'salt-master'
	_inst_initd 'salt-master'

	_inst_confd 'salt-minion'
	_inst_initd 'salt-minion'

	_inst_confd 'salt-syncdic'
	_inst_initd 'salt-syncdic'

	_inst_confd 'salt-api'
	_inst_initd 'salt-api'
}

package_mpd-openrc(){
	pkgdesc="OpenRC fuse init script"
	depends=('openrc-core' 'mpd')
	install=mpd.install

	_inst_initd 'mpd'
}

package_hdparm-openrc() {
	pkgdesc="OpenRC hdparm init script"
	depends=('openrc-core' 'hdparm')
	backup=('etc/conf.d/hdparm')
	install=hdparm.install

	_inst_confd 'hdparm'
	_inst_initd 'hdparm'
}

package_thermald-openrc() {
	pkgdesc="OpenRC thermald init script"
	depends=('dbus-openrc' 'thermald')
	install=thermald.install

	_inst_initd 'thermald'
}

package_xe-guest-utilities-openrc() {
	pkgdesc="OpenRC xe-guest-utilities init script"
	depends=('openrc-core' 'xe-guest-utilities')
	install=xe-guest-utilities.install

	_inst_initd 'xe-daemon'
}

package_virtualbox-guest-utils-openrc() {
	pkgdesc="OpenRC virtualbox-guest-utils init script"
	depends=('openrc-core' 'virtualbox-guest-utils')
	install=virtualbox-guest-additions.install

	_inst_initd 'vboxservice'

	sed -e 's|vboxguest-service|VBoxService|' \
		-e 's|/sbin/modprobe|/usr/bin/modprobe|g' \
		-i "${pkgdir}/etc/init.d/vboxservice"
}

package_zfs-openrc() {
	pkgdesc="OpenRC zfs init script"
	depends=('openrc-core' 'zfs-utils')
	install=zfs.install

	_inst_initd 'zfs'
}

package_clamav-openrc() {
	pkgdesc="OpenRC clamav init script"
	depends=('openrc-core' 'clamav')
	backup=('etc/conf.d/clamd')
	install=clamav.install

	_inst_confd 'clamd'
	_inst_initd 'clamd'
}

package_networkmanager-openrc() {
	pkgdesc="OpenRC networkmanager init script"
	depends=('openrc-core' 'networkmanager-consolekit')
	backup=('etc/conf.d/NetworkManager')
	install=networkmanager.install

	_inst_confd 'NetworkManager'
	_inst_initd 'NetworkManager'

	install -Dm755 "${srcdir}/10-openrc-status" "${pkgdir}/etc/NetworkManager/dispatcher.d/10-openrc-status"

	sed -e 's|@EPREFIX@/sbin|/usr/bin|' \
		-e 's|@EPREFIX@/usr/sbin|/usr/bin|' \
		-i "${pkgdir}/etc/NetworkManager/dispatcher.d/10-openrc-status"
}

package_boinc-openrc() {
	pkgdesc="OpenRC boinc init script"
	depends=('boinc')
	backup=('etc/conf.d/boinc')
	install=boinc.install

	_inst_confd 'boinc'
	_inst_initd 'boinc'
}

package_at-openrc() {
	pkgdesc="OpenRC at init script"
	depends=('at')
	backup=('etc/conf.d/atd')
	install=at.install

	_inst_confd 'atd'
	_inst_initd 'atd'

	sed -e "${_runpath}" \
		-i "${pkgdir}/etc/conf.d/atd"
}

package_libvirt-openrc() {
	pkgdesc="OpenRC libvirt init script"
	depends=('libvirt')
	backup=('etc/conf.d/libvirtd')
	install=libvirt.install

	_inst_confd 'libvirtd'
	_inst_initd 'libvirtd'
	_inst_initd 'virtlockd'
}

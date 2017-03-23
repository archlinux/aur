# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>

_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g')
_prefix=true

$_prefix && _sed_args+=(-e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|g')

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
        'boinc-openrc'
        'at-openrc'
        'libvirt-openrc'
        'laptop-mode-tools-openrc')
pkgver=20170309
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-misc')
conflicts=('systemd-sysvcompat')
source=("fcron.initd::${_url}/sys-process/fcron/files/fcron.init.3"
        "rsyslog.confd::${_url}/app-admin/rsyslog/files/8-stable/rsyslog.confd-r1"
        "rsyslog.initd::${_url}/app-admin/rsyslog/files/8-stable/rsyslog.initd-r1"
        "saned.confd::${_url}/media-gfx/sane-backends/files/saned.confd"
        "saned.initd::${_url}/media-gfx/sane-backends/files/saned.initd"
        "fuse.initd::${_url}/sys-fs/fuse/files/fuse.init"
        "metalog.confd::${_url}/app-admin/metalog/files/metalog.confd"
        "metalog.initd::${_url}/app-admin/metalog/files/metalog.initd"
        "syslog-ng.confd::${_url}/app-admin/syslog-ng/files/3.7/syslog-ng.confd"
        "syslog-ng.initd::${_url}/app-admin/syslog-ng/files/3.7/syslog-ng.rc6"
        "lircd.confd::${_url}/app-misc/lirc/files/lircd.conf.4"
        "irexec.confd::${_url}/app-misc/lirc/files/irexec-confd"
        "lircd.initd::${_url}/app-misc/lirc/files/lircd-0.8.6-r2"
        "irexec.initd::${_url}/app-misc/lirc/files/irexec-initd-0.8.6-r2"
        "lircmd.initd::${_url}/app-misc/lirc/files/lircmd"
        "cpupower.confd::${_url}/sys-power/cpupower/files/conf.d-r2"
        "cpupower.initd::${_url}/sys-power/cpupower/files/init.d-r4"
        #"sensord.confd::${_url}/sys-apps/lm_sensors/files/sensord-conf.d"
        "sensord.initd::${_url}/sys-apps/lm_sensors/files/sensord-4-init.d"
        "fancontrol.initd::${_url}/sys-apps/lm_sensors/files/fancontrol-init.d-2"
        "lm_sensors.initd::${_url}/sys-apps/lm_sensors/files/lm_sensors-3-init.d"
        "ntpd.confd::${_url}/net-misc/ntp/files/ntpd.confd"
        "ntp-client.confd::${_url}/net-misc/ntp/files/ntp-client.confd"
        "sntp.confd::${_url}/net-misc/ntp/files/sntp.confd"
        "ntpd.initd::${_url}/net-misc/ntp/files/ntpd.rc-r1"
        "ntp-client.initd::${_url}/net-misc/ntp/files/ntp-client.rc"
        "sntp.initd::${_url}/net-misc/ntp/files/sntp.rc"
        "cupsd.initd::${_url}/net-print/cups/files/cupsd.init.d-r2"
        "connman.confd::${_url}/net-misc/connman/files/connman.confd"
        "connman.initd::${_url}/net-misc/connman/files/connman.initd2"
        "haveged.confd::${_url}/sys-apps/haveged/files/haveged-conf.d"
        "haveged.initd::${_url}/sys-apps/haveged/files/haveged-init.d.3"
        "salt-master.confd::${_url}/app-admin/salt/files/master-confd-1"
        "salt-master.initd::${_url}/app-admin/salt/files/master-initd-4"
        "salt-minion.confd::${_url}/app-admin/salt/files/minion-confd-1"
        "salt-minion.initd::${_url}/app-admin/salt/files/minion-initd-4"
        "salt-syncdic.confd::${_url}/app-admin/salt/files/syndic-confd-1"
        "salt-syncdic.initd::${_url}/app-admin/salt/files/syndic-initd-4"
        "salt-api.confd::${_url}/app-admin/salt/files/api-confd-1"
        "salt-api.initd::${_url}/app-admin/salt/files/api-initd-4"
        "mpd.initd::${_url}/media-sound/mpd/files/mpd2.init"
        "hdparm.confd::${_url}/sys-apps/hdparm/files/hdparm-conf.d.3"
        "hdparm.initd::${_url}/sys-apps/hdparm/files/hdparm-init-8"
        "bitlbee.confd::${_url}/net-im/bitlbee/files/bitlbee.confd-r1"
        "bitlbee.initd::${_url}/net-im/bitlbee/files/bitlbee.initd-r1"
        "xe-daemon.initd::${_url}/app-emulation/xe-guest-utilities/files/xe-daemon.initd"
        "vboxservice.initd::${_url}/app-emulation/virtualbox-guest-additions/files/virtualbox-guest-additions-8.initd"
        "clamd.confd::${_url}/app-antivirus/clamav/files/clamd.conf-r1"
        "clamd.initd::${_url}/app-antivirus/clamav/files/clamd.initd-r6"
        "boinc.confd::${_url}/sci-misc/boinc/files/boinc.conf"
        "boinc.initd::${_url}/sci-misc/boinc/files/boinc.init"
        "atd.confd::${_url}/sys-process/at/files/atd.confd"
        "atd.initd::${_url}/sys-process/at/files/atd.rc8"
        "libvirtd.confd::${_url}/app-emulation/libvirt/files/libvirtd.confd-r5"
        "libvirtd.initd::${_url}/app-emulation/libvirt/files/libvirtd.init-r16"
        "virtlockd.initd::${_url}/app-emulation/libvirt/files/virtlockd.init-r1"
        "virtlogd.initd::${_url}/app-emulation/libvirt/files/virtlogd.init-r1"
        "libvirt-guests.confd::${_url}/app-emulation/libvirt/files/libvirt-guests.confd"
        "libvirt-guests.initd::${_url}/app-emulation/libvirt/files/libvirt-guests.init-r2"
        "laptop_mode.initd::${_url}/app-laptop/laptop-mode-tools/files/laptop_mode.init-1.4"
        "zfs.initd"
        "thermald.initd")
sha256sums=('af951e342ea3e96fb5294c54bdf226b0e733df8b96e8af9e4c1a836c0361ceca'
            '0be3575df8010523de6b37e98c417192e8ec481292ca9fb47c8d2211795e03a6'
            '93044cc5fc344cd90d17cbb5cebee3c60ebf674e53c8b9efc6e758d53912d343'
            '197e44ba1f438a18f5f7d9f5858feb19c1ece4286d82a5e63caf9be5b964aa76'
            '80e12e65ec5abf2e57da9fdf58e681845029ccab65206cd56a4bc06e2abefb0a'
            '66ce65e2459fef26bb1711d706a23643a9af7a80e03ee6be836a377310b00682'
            'dd9d30a6c22dca6d072a9c63e1494d3d0a26709a5f045ce5985642933fe24efc'
            '78e372a0c04c36e590a66d0750083fcb6302159eaae06a81c19a379e6115087e'
            'b29325498ee3b1f3d63672efcd1e93f0745eecdb9f4bb05fed82a2f085399484'
            '5c4ad3406fc885555883de0537614034de181d783bcb1e864bff6299ac6c1356'
            'd36ff77fa193a065d25e373723e03f1a9471205151b82c73a6574cce4f095962'
            'c404ad3b624004cab25bd3a89593cdeb0abbc25771d6e52caf2f37cb4f7b2b79'
            'ec592af12a7b7bbe1be1b9a4ff72fcf1fda6cf0e4511120e5a85e2a4ef08b213'
            '1eb5123f9876dff17367e78940a7442de6b5cae55e0eb4969f5985cc78261a03'
            '47a9b3500c51c147ac64a8c0cc0dda3945522269e26c513399d89efbbb3c7098'
            '9ab6f022d2b2948660decf5e383984e6ddb9e9e5e6e2761c3031378ddd87e947'
            'c8c092fa80da7c312430389ae06ff7874d651d8e7b6c28236ee5c8d8d3557d9d'
            'c95bdbce67efb57d60cf0b7248091e09d7f52c19eb13874944babe6bb84b12f1'
            '3ce872b305dafa2957eb082239dedb57a880b1395bf9377e916143a04086cbcc'
            '24026e19e7862b02fe5e6d0bb9998dd5420c30c64045bdfc94d7578b1cb822ea'
            '40803821f498267f6567436eedc18201b5ae4b5390d6872fb15a94200c2ac06f'
            'c7dc517cdb5ee10e2a07ccea15ec47ba0b7aff8ac1469204c8d7faf71bcae2c5'
            '97282007801cb9c0e3b431e2930dec3bb8ce8869f63f7e02d903846e96734684'
            'cdccb5f0009d1498be90a3f423158d7a3c603a1398f8993ae6fb828224a7cdaa'
            '49f6634a258d4a91dc12c3b6bf9014b05a39cfe121ad52f826721ab791a28aa3'
            'd1ba585272e6158a942d536d508a2979a1ca17316d4b97766d78bad4e9a6a7b8'
            '54b86ec2d7086004cde4e8b69aa49b7334718cad42a4426382f56269bb0f5a78'
            '767a160c1b3392f0a12d3908a937548a2f604a9a121e744c309ee6f478420b02'
            '4c018df1b53b142a2e26c456b0bf6cc7039fb3851bc5f567e59654117930a78b'
            'e796a353534e8ec36b84a29ab4cbd738ebd18098efca5ed8d92b267a99dc58f6'
            '5ee06c49764ecc4aaa9a88a222ef7838dbc065d049279693a37bebd0431855de'
            '9f3f47a7af4d349a7c525455616139b5019d3b7d0290398ba8c50ab91a62d089'
            '7064f21c734313e9d9d32b77eaecf3eeb6de714eff6dcafeb79c25303e675bf9'
            '286148f5391d42c04a62a13cc125fa2130b5821e50da913c5a20d3a913e5f2d1'
            'ebe8d0fecde60b427d01022eb38a437be1ead33cd24d4afdb266ff922ab87850'
            '286148f5391d42c04a62a13cc125fa2130b5821e50da913c5a20d3a913e5f2d1'
            '86c1af171c7b13018f089fab6d045feabd72455f9453720ef36ae2011b9cb976'
            '9f3f47a7af4d349a7c525455616139b5019d3b7d0290398ba8c50ab91a62d089'
            'e673f359ff7fbb012d9eb5d6c3db841668e3692b15b07faeb6352feb5cfbb2b1'
            '6ca354f8b8c4b0e8595f7dbda1058fd471a6b538469ea10e7caf8e7f263f621a'
            '37c95ff723fa578e9039613d09dbf790d99113a318c065422986c744519214e9'
            '05b264cadc84984f773cd555af322b41fdb13da7cb2ca60d8a7d590ddf4d5e5f'
            'cab8b8cb8709f27a5fa9f1cfce4b58db24f5cd38b8e6badb91dac0809e6ca8de'
            '4b8654dffd57243079223a1cc236edf5e47309515270fde2d18123e41cd3c29f'
            'c65e8f0354364f32e87bee2922979cb09ea680ad6baae48a910a10d39b850987'
            '6be7c321b362054aefef183f0c4b8404ea64d4232154756ddc79de1fca067952'
            '28ebd47810b0568fc7692218867d6804a1df70290681462f5555e230ca817732'
            '7b502b8ca6672ee85d67e6c2e210118b05cee8170ebab4308df192f0f8064de3'
            'ed42b285adc35b8d2d5e5aeac934e63e36e67e99036978d05e48deccaf3042b8'
            '29bf651763a7c9e25ca2ce927d6e798abb9aec03dff2279862465bc27c574224'
            'ece01506efa6d73d7cbe9bc1da6eb1afc4d63451ab1fccf5051178b6e937d68e'
            '115f3be9cfd306251909ca7fc2dbc55ca71f6f38a3ebb62d9a428a9eddcd8ffb'
            '4f7fba7e64533868119c0f3355aa22932e163b208397323dc2cd96daadcc4079'
            '1f875e12cc6ecb1b434bfea774893b84f6602072da0218b654d2ecf79cf2d36d'
            '23ddea66fb2d85c17c382daa07abfabe7fa57d62406d2ca5df0c755f5dcc3834'
            '1647c11779fd874bdc115234bae0f0f65278084541473d2825aa9864ad49f939'
            'd5f85bb8c1d2010347f23badc422e98046b97a0066254739b5829fce07837d63'
            'f78ced5ebe644522c6ce102b3f6bcf932686243a50629559f988548c570cad3a'
            '6bb07bd94b50ad559c3cd23b57dbb928ff0449d356d973ba281baa232435d9c6'
            '7321272190ea9846ab7e19b034649c1cd711d4f94a6bdcaaaec2f683bb822e7d'
            '4bbb4e610d2d6bb22d83aa2980dca052a23b90fa6985c8245601b716dec986f4')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed ${_sed_args[@]} -i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_bitlbee-openrc() {
	pkgdesc="OpenRC bitlbee init script"
	depends=('openrc' 'bitlbee')
	backup=('etc/conf.d/bitlbee')

	_inst_confd 'bitlbee'
	_inst_initd 'bitlbee'

	sed -e 's|need logger net|need net\n	use logger|' \
		-i "${pkgdir}/etc/init.d/bitlbee"
}

package_cpupower-openrc() {
	pkgdesc="OpenRC cpupower init script"
	depends=('openrc' 'cpupower')
	backup=('etc/conf.d/cpupower')

	_inst_confd 'cpupower'
	_inst_initd 'cpupower'
}

package_connman-openrc() {
	pkgdesc="OpenRC connman init script"
	depends=('openrc' 'connman')
	backup=('etc/conf.d/connman')

	_inst_confd 'connman'
	_inst_initd 'connman'
}

package_cups-openrc() {
	pkgdesc="OpenRC cups init script"
	depends=('cups' 'dbus-openrc')
	optdepends=('avahi-openrc: avahi initscript')

	_inst_initd 'cupsd'

	sed -e 's|lp:lpadmin|daemon:sys|' \
		-e 's|@neededservices@|need dbus avahi-daemon|' \
		-i "${pkgdir}/etc/init.d/cupsd"
}

package_fcron-openrc() {
	pkgdesc="OpenRC fcron init script"
	depends=('openrc' 'fcron')
	groups=('openrc-misc')
	provides=('openrc-cron')
	conflicts=('cronie'
		'cronie-openrc'
		'systemd-sysvcompat')

	_inst_initd 'fcron'

    sed -e 's|/usr/libexec|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/fcron"
}

package_ntp-openrc() {
	pkgdesc="OpenRC ntp init script"
	depends=('openrc' 'ntp')
	optdepends=('bind-openrc: bind initscript')
	provides=('openrc-timed')
	conflicts=('openntpd'
                'openntpd-openrc'
                'systemd-sysvcompat')
	backup=('etc/conf.d/ntpd'
		'etc/conf.d/ntp-client'
		'etc/init.d/sntp')

        for f in ntpd ntp-client sntp;do
            _inst_confd $f
            _inst_initd $f
        done
}

package_rsyslog-openrc() {
	pkgdesc="OpenRC rsyslog init script"
	depends=('openrc' 'rsyslog')
	backup=('etc/conf.d/rsyslog')

	_inst_confd 'rsyslog'
	_inst_initd 'rsyslog'
}

package_sane-openrc() {
	pkgdesc="OpenRC sane init script"
	depends=('openrc' 'sane')
	backup=('etc/conf.d/saned')

	_inst_confd 'saned'
	_inst_initd 'saned'

    sed -e 's|/run/saned/saned.pid|/run/saned.pid|' \
		-i ${pkgdir}/etc/init.d/saned
}

package_fuse-openrc(){
	pkgdesc="OpenRC fuse init script"
	depends=('openrc' 'fuse')

	_inst_initd 'fuse'
}

package_metalog-openrc() {
	pkgdesc="OpenRC metalog init script"
	depends=('openrc' 'metalog')
	backup=('etc/conf.d/metalog')

	_inst_confd 'metalog'
	_inst_initd 'metalog'
}

package_syslog-ng-openrc() {
	pkgdesc="OpenRC syslog-ng init script"
	depends=('openrc' 'syslog-ng')
	backup=('etc/conf.d/syslog-ng')

	_inst_confd 'syslog-ng'
	_inst_initd 'syslog-ng'
}

package_lm_sensors-openrc() {
	pkgdesc="OpenRC lm_sensors init script"
	depends=('openrc' 'lm_sensors')
	#backup=('etc/conf.d/sensord')

	_inst_initd 'sensord'
	_inst_initd 'fancontrol'
	_inst_initd 'lm_sensors'
}

package_lirc-utils-openrc() {
	pkgdesc="OpenRC lirc-utils init script"
	depends=('openrc' 'lirc-utils')
	backup=('etc/conf.d/lircd'
		'etc/conf.d/irexec')


	for f in lircd irexec;do
            _inst_confd $f
            _inst_initd $f
	done

	_inst_initd 'lircmd'
}

package_haveged-openrc() {
	pkgdesc="OpenRC haveged init script"
	depends=('openrc' 'haveged')
	backup=('etc/conf.d/haveged')

	_inst_confd 'haveged'
	_inst_initd 'haveged'
}

package_salt-openrc() {
	pkgdesc="OpenRC salt init scripts"
	depends=('openrc' 'salt')
	backup=('etc/conf.d/salt-master'
		'etc/conf.d/salt-minion'
		'etc/conf.d/salt-syncdic'
		'etc/conf.d/salt-api')

        for f in salt-master salt-minion salt-syncdic salt-api;do
            _inst_confd $f
            _inst_initd $f
        done
}

package_mpd-openrc(){
	pkgdesc="OpenRC fuse init script"
	depends=('openrc' 'mpd')

	_inst_initd 'mpd'
}

package_hdparm-openrc() {
	pkgdesc="OpenRC hdparm init script"
	depends=('openrc' 'hdparm')
	backup=('etc/conf.d/hdparm')

	_inst_confd 'hdparm'
	_inst_initd 'hdparm'
}

package_thermald-openrc() {
	pkgdesc="OpenRC thermald init script"
	depends=('dbus-openrc' 'thermald')

	_inst_initd 'thermald'
}

package_xe-guest-utilities-openrc() {
	pkgdesc="OpenRC xe-guest-utilities init script"
	depends=('openrc' 'xe-guest-utilities')

	_inst_initd 'xe-daemon'
}

package_virtualbox-guest-utils-openrc() {
	pkgdesc="OpenRC virtualbox-guest-utils init script"
	depends=('openrc' 'virtualbox-guest-utils')

	_inst_initd 'vboxservice'

	sed -e 's|vboxguest-service|VBoxService|' \
		-e 's|/sbin/modprobe|/usr/bin/modprobe|g' \
		-i "${pkgdir}/etc/init.d/vboxservice"
}

package_zfs-openrc() {
	pkgdesc="OpenRC zfs init script"
	depends=('openrc' 'zfs-utils')

	_inst_initd 'zfs'
}

package_clamav-openrc() {
	pkgdesc="OpenRC clamav init script"
	depends=('openrc' 'clamav')
	backup=('etc/conf.d/clamd')

	_inst_confd 'clamd'
	_inst_initd 'clamd'
}

package_boinc-openrc() {
	pkgdesc="OpenRC boinc init script"
	depends=('openrc' 'boinc')
	backup=('etc/conf.d/boinc')

	_inst_confd 'boinc'
	_inst_initd 'boinc'
}

package_at-openrc() {
	pkgdesc="OpenRC at init script"
	depends=('openrc' 'at')
	backup=('etc/conf.d/atd')

	_inst_confd 'atd'
	_inst_initd 'atd'

	sed -e 's|/var/run|/run|g' \
		-i "${pkgdir}/etc/conf.d/atd"
}

package_libvirt-openrc() {
	pkgdesc="OpenRC libvirt init script"
	depends=('openrc' 'libvirt')
	backup=('etc/conf.d/libvirtd')

	_inst_confd 'libvirtd'
	_inst_initd 'libvirtd'
	_inst_initd 'virtlockd'
	_inst_initd 'virtlogd'

	_inst_confd 'libvirt-guests'
	_inst_initd 'libvirt-guests'

	sed -e "s/USE_FLAG_FIREWALLD/need firewalld/" \
		-e "s/USE_FLAG_AVAHI/use avahi-daemon/" \
		-e "s/USE_FLAG_ISCSI/use iscsid/" \
		-e "s/USE_FLAG_RBD/use ceph/" \
		-i "${pkgdir}/etc/init.d/libvirtd"
}

package_laptop-mode-tools-openrc() {
	pkgdesc="OpenRC laptop-mode init script"
	depends=('openrc' 'laptop-mode-tools')
	groups=('openrc-misc' 'openrc-mobile')

	_inst_initd 'laptop_mode'
}

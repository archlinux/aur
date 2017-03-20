# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>

_apver=2.4.18-r1
_aprel=20160303

_dev_url="http://dev.gentoo.org/~polynomial-c/dist/apache"
_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

pkgbase=openrc-net
pkgname=('autofs-openrc'
        'apache-openrc'
        'bind-openrc'
        'cyrus-sasl-openrc'
        'dhcp-openrc'
        'hostapd-openrc'
        'iptables-openrc'
        'krb5-openrc'
        'lighttpd-openrc'
        'nfs-utils-openrc'
        'openldap-openrc'
        'openslp-openrc'
        'openssh-openrc'
        'openntpd-openrc'
        'openvpn-openrc'
        'polipo-openrc'
        'postfix-openrc'
        'privoxy-openrc'
        'quota-tools-openrc'
        'rpcbind-openrc'
        'rsync-openrc'
        'samba-openrc'
        'squid-openrc'
        'transmission-openrc'
        'ufw-openrc'
        'vsftpd-openrc'
        'xinetd-openrc'
        'ypbind-mt-openrc'
        'ypserv-openrc'
        'tor-openrc'
        'wicd-openrc'
        'syncthing-openrc'
        'nginx-openrc'
        'vnstat-openrc'
        'snort-openrc'
        'unbound-openrc')
pkgver=20170309
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-net')
conflicts=('systemd-sysvcompat')
source=("${_dev_url}/gentoo-apache-${_apver}-${_aprel}.tar.bz2"
        "named.confd::${_url}/net-dns/bind/files/named.confd-r7"
        "named.initd::${_url}/net-dns/bind/files/named.init-r13"
        "saslauthd.initd::${_url}/dev-libs/cyrus-sasl/files/saslauthd2.rc7"
        "dhcpd.confd::${_url}/net-misc/dhcp/files/dhcpd.conf2"
        "dhcrelay.confd::${_url}/net-misc/dhcp/files/dhcrelay.conf"
        "dhcrelay6.confd::${_url}/net-misc/dhcp/files/dhcrelay6.conf"
        "dhcpd.initd::${_url}/net-misc/dhcp/files/dhcpd.init5"
        "dhcrelay.initd::${_url}/net-misc/dhcp/files/dhcrelay.init3"
        "hostapd.confd::${_url}/net-wireless/hostapd/files/hostapd-conf.d"
        "hostapd.initd::${_url}/net-wireless/hostapd/files/hostapd-init.d"
        "iptables.confd::${_url}/net-firewall/iptables/files/iptables-1.4.13.confd"
        "ip6tables.confd::${_url}/net-firewall/iptables/files/ip6tables-1.4.13.confd"
        "iptables.initd::${_url}/net-firewall/iptables/files/iptables-1.4.13-r1.init"
        "krb5kadmind.initd::${_url}/app-crypt/mit-krb5/files/mit-krb5kadmind.initd-r2"
        "krb5kdc.initd::${_url}/app-crypt/mit-krb5/files/mit-krb5kdc.initd-r2"
        "krb5kpropd.initd::${_url}/app-crypt/mit-krb5/files/mit-krb5kpropd.initd-r2"
        "lighttpd.confd::${_url}/www-servers/lighttpd/files/lighttpd.confd"
        "lighttpd.initd::${_url}/www-servers/lighttpd/files/lighttpd.initd"
        "nfs.confd::${_url}/net-fs/nfs-utils/files/nfs.confd"
        "nfs.initd::${_url}/net-fs/nfs-utils/files/nfs.initd"
        "nfsclient.confd::${_url}/net-fs/nfs-utils/files/nfsclient.confd"
        "nfsclient.initd::${_url}/net-fs/nfs-utils/files/nfsclient.initd"
        "rpc.idmapd.initd::${_url}/net-fs/nfs-utils/files/rpc.idmapd.initd"
        "rpc.pipefs.initd::${_url}/net-fs/nfs-utils/files/rpc.pipefs.initd"
        "rpc.gssd.initd::${_url}/net-fs/nfs-utils/files/rpc.gssd.initd"
        "rpc.svcgssd.initd::${_url}/net-fs/nfs-utils/files/rpc.svcgssd.initd"
        "rpc.statd.initd::${_url}/net-fs/nfs-utils/files/rpc.statd.initd"
        "slapd.confd::${_url}/net-nds/openldap/files/slapd-confd-2.4.28-r1"
        "slapd.initd::${_url}/net-nds/openldap/files/slapd-initd-2.4.40-r2"
        "slpd.initd::${_url}/net-libs/openslp/files/slpd-init"
        "sshd.confd::${_url}/net-misc/openssh/files/sshd.confd"
        "sshd.initd::${_url}/net-misc/openssh/files/sshd.rc6.4"
        "polipo.initd::${_url}/net-proxy/polipo/files/polipo.initd-5"
        "postfix.initd::${_url}/mail-mta/postfix/files/postfix.rc6.2.7"
        "privoxy.initd::${_url}/net-proxy/privoxy/files/privoxy.initd-3"
        "quota.confd::${_url}/sys-fs/quota/files/quota.confd"
        "quota.initd::${_url}/sys-fs/quota/files/quota.rc7"
        "rpc.rquotad.initd::${_url}/sys-fs/quota/files/rpc.rquotad.initd"
#         "rpcbind.confd::${_url}/net-nds/rpcbind/files/rpcbind.confd"
        "rpcbind.initd::${_url}/net-nds/rpcbind/files/rpcbind.initd"
        "rsyncd.confd::${_url}/net-misc/rsync/files/rsyncd.conf.d"
        "rsyncd.initd::${_url}/net-misc/rsync/files/rsyncd.init.d-r1"
        "smb.confd::${_url}/net-fs/samba/files/4.4/samba4.confd"
        "smb.initd::${_url}/net-fs/samba/files/4.4/samba4.initd-r1"
        "squid.confd::${_url}/net-proxy/squid/files/squid.confd-r1"
        "squid.initd::${_url}/net-proxy/squid/files/squid.initd-r4"
        "transmission-daemon.confd::${_url}/net-p2p/transmission/files/transmission-daemon.confd.4"
        "transmission-daemon.initd::${_url}/net-p2p/transmission/files/transmission-daemon.initd.10"
        "ufw.confd::${_url}/net-firewall/ufw/files/ufw.confd"
        "ufw.initd::${_url}/net-firewall/ufw/files/ufw-2.initd"
        "${_url}/net-ftp/vsftpd/files/vsftpd-checkconfig.sh"
        "vsftpd.initd::${_url}/net-ftp/vsftpd/files/vsftpd.init"
        "xinetd.confd::${_url}/sys-apps/xinetd/files/xinetd.confd"
        "xinetd.initd::${_url}/sys-apps/xinetd/files/xinetd.rc6"
        "ypbind.confd::${_url}/net-nds/ypbind/files/ypbind.confd-r1"
        "ypbind.initd::${_url}/net-nds/ypbind/files/ypbind.initd"
        "ypserv.confd::${_url}/net-nds/ypserv/files/ypserv.confd"
        "rpc.yppasswdd.confd::${_url}/net-nds/ypserv/files/rpc.yppasswdd.confd"
        "rpc.ypxfrd.confd::${_url}/net-nds/ypserv/files/rpc.ypxfrd.confd"
        "ypserv.initd::${_url}/net-nds/ypserv/files/ypserv"
        "rpc.yppasswdd.initd::${_url}/net-nds/ypserv/files/rpc.yppasswdd-r1"
        "rpc.ypxfrd.initd::${_url}/net-nds/ypserv/files/rpc.ypxfrd-2.23"
        "autofs.initd::${_url}/net-fs/autofs/files/autofs5.initd"
        "openvpn.confd::${_url}/net-misc/openvpn/files/openvpn-2.1.conf"
        "openvpn.initd::${_url}/net-misc/openvpn/files/openvpn-2.1.init"
        "ntpd.confd::${_url}/net-misc/openntpd/files/openntpd.conf.d-20080406-r6"
        "ntpd.initd::${_url}/net-misc/openntpd/files/openntpd.init.d-20080406-r6"
        "tor.confd::${_url}/net-misc/tor/files/tor.confd"
        "tor.initd::${_url}/net-misc/tor/files/tor.initd-r8"
        "nginx.confd::${_url}/www-servers/nginx/files/nginx.confd"
        "nginx.initd::${_url}/www-servers/nginx/files/nginx.initd-r4"
        "vnstatd.confd::${_url}/net-analyzer/vnstat/files/vnstatd.confd"
        "vnstatd.initd::${_url}/net-analyzer/vnstat/files/vnstatd.initd-r1"
        "wicd.initd"
        "syncthing.confd"
        "syncthing.initd"
        "snort.confd::${_url}/net-analyzer/snort/files/snort.confd.2"
        "snort.initd::${_url}/net-analyzer/snort/files/snort.rc12"
        "unbound.confd::${_url}/net-dns/unbound/files/unbound.confd"
        "unbound.initd::${_url}/net-dns/unbound/files/unbound.initd")
sha256sums=('d81e32d876594b48a7ff6d9123bf776c5bea5453eddd2fe40f4a9b79c11537aa'
            '3cf1ab72446cb9417de916e4cd732f2056fb74d2c6f03da6741b7bae8c415448'
            'a1a25bd66fa2edac593e77c5469e110466b7d8dc1bfa3f72a49c7117196986a4'
            'dea35c48fdc94e475b427cb47ff47b914a66311afbd2d8397a833a60e4c1a7a4'
            'e8a413e9102948b336f60041fc3cade33125faf56d8319ee65d9f3c63199a8e7'
            'a157630c3bdc9565cca8240ee1e6539fc9cbc1e4642c40e0965e3609d1021bac'
            '099f668e1ad42ed9446b15675032a1186715d1fe9e4a1b24dfb787e68495d2b6'
            '974fcd6c3c7d49cf350a53df56c0f73fc64fa14d1516d50dee1316e577ab6450'
            '87082ebc37a969d2b7e658f155f96990c57ecb60c5fc23edee25afa9d247bd68'
            '916f4b14095ee4ec8a510391c883e9f01868e18d79a3d5cbeb13a104a793d45d'
            '3678565083106e698ca30c305c4561152a2b043fe894b8b773b28a0bb273411e'
            '7e2341211ca14997b7a8a1f930f94db855291af597c568f680f80031c20d45b6'
            '2938fe4206514d9868047bd8f888a699fa2097ca69edab176453436d4259abaa'
            '2c9dcf73db7740350d41504633671e95287a349838acd5faa6d3b27418c9d6d0'
            '0b3b5bcfdb5010d20e3d4457f4128a4fb9f2d91261bfcf489601b1c714f9d815'
            '30572eeec9013fbfb6170f2b0bd1016582d2664268e4019fa8e2edd41e52919d'
            'bf8539b70561d9eb495f55141a5295a8c2e8246af4d1990af94e98be952dcdf9'
            '0be7c9c04ce508cbefb3e913951d83c5ed7f0e01fe5aebcf3a5071f30ef3dbc2'
            'aceed021f24b817347fdf216ccc61e7f34cb8fd831a377c2fbbf1230873498e2'
            'c652a4fe8a43dc68a818345db2b3acc560663b5b6c969324d4f23afb0fb96a94'
            '247456e845e70badb44d9155b68e5f76d502361769e4332a9d1bd6345f85fbfa'
            'e8842fca856eae598fb8fe15ed8d3cef13e61851217be66b8cc4087af8cee8ad'
            '56973f5c8196b4227114d94a1d3c8c95518be5a02c6b5dc97da243d0b6086843'
            'dc21ce6ba28f45eb450d5d0dbe7e5ea706b1547c8bece4ddb6836a5433427bd6'
            '04102bff9b13d2e7c4e30603e7c98fe412d5f6c907a37dcea95f420f153c29ae'
            '83c318a7502718a3e1693869297b95db1c32270b37d45b26b2bc151ec06f3c08'
            '272905335a7c82034c6bac007bd4477aae21d8ce49e82355c48301db771ba77e'
            '6f3d93442db0c17436547a16155e0d61dd5cd17f49fd3a642a9a5de833411d51'
            '5bca003ec3b67c7c78519aede1d82002579006ccfecce8f87b559df719f82e92'
            'bcd84fca8efc1eec3aea489f238b51ce7226ffcdb1562044e48106897bc5a6fc'
            '903fdfdd8a5b482af011fc12f9050a9afceac09e4eed9e9cd4fa58240ab61349'
            '29c6d57ac3ec6018cadc6ba6cd9b90c9ed46e20049b970fdcc68ee2481a2ee41'
            '43a483014bf177f9238e54a7b8210d5a76830beb67c18999409e543fd744c9e4'
            '81c0bf86e26770ae9e522fcce86ab05528d37ce8ad3ce1bcf17250bbd0285a6a'
            '34cb4ef8067b9001005931c30ab87be41f47c20ef1185a3afbc86d3d6f01996e'
            '7a2e3996dd9dd02307b11ffb2dca8915490283820a6b6c124d808a38badcc505'
            '00d1dfb3b893db5d6a213a4edda622c7d64dcafa40b3019f15e070c164286632'
            '2a4dc1f695a881d0715e6220dad54b3690d98bf26b618b0fe6cb4ab26823e047'
            'ef7eec0fd1921f786580169628c9cc7af82c73d0b2cf420fba0e87f8fd428651'
            'da992f87b5043e22dfd340b4a5440b76dce29cc14d3ef7b0ce586726fe4b220b'
            'de758791b16b89a648c01867af7f51bc9bd44e40cbe868e439b753ff5d9572e5'
            'fc6240c77448d36cf3255e6c264737a6ce69424b5b62d0986eb322c4d8a1a85b'
            '53755809cc27fdbaf98752cd3da45b5c2bda62dd46fcc37570c6e237f7954ffa'
            'd40c512760bc0cc56629429219e1eadbcee23aa12ec5b3145f679ed644d0912c'
            '507d8f26bdb7227c39ed0641429d32972513e4240bf59a20b076e8019201b20d'
            '8a1369aab5cef61d19ea61c373819bd4eeabd2ba4c70f831e5009891993f3a4f'
            '9065bcf729309aebd48ae2214a461d162924462fb2db51f33aed40dd0c3b4f25'
            '8925e7b2f59de7c116778fa9a498e8209358117b08870a9208fe37c8b2f01ee5'
            '069aa7382b40aecebf26ef53f3f4c49890314e0357925c84b3c15f1d0b913be0'
            '7d668989a96d47cb5a9f71ae2e6000b469be6d1786f9cf3809b28461d42308ea'
            '2de7c7c1edfe3ae0480e22d988a564db3bb873050929ebb6e8361d7a1288ddda'
            '46dba1df0fb5d575d6d37ed54aa887d9a5fa8853bc46b2b0bd18f9fab2a27640'
            'e401e2cf7c0180a170d3dc3e91d7e98002bae7b013df72813b7bcf89b864fb3a'
            '6934fee5e3997d7e152c26d0c1a8f8d2f7563287fcc1ae934e4552d523c39329'
            '79f6c6ed4875f00fe702f69e9a6180a032d5a47f3e58e892e6ba0e2746b6fec8'
            'fad2c4c9927edd6a3b7479dba733f67c5cfef399de133c1b4a69ac0526692dbd'
            '4edd475ca95d31cfcea20a8e6268024f8128423bc7ae67edb535e6811c64668e'
            'e46afe737bfc57aa31be1a441615fcc112e1ebf41d631c1929e00b81baca119d'
            'bd1f245a362f85319e83965e8b825e66e686a4a0bf185ab8ec51fd335bc873c2'
            '24d4bfd2d938b3b89ae89067e1249631f2a05a81a95772c82861700039f69ab4'
            '870931c5a97510aa266b2df3c1b29fb314e7174cd59fd8b0541ce123ec7c24f3'
            'a0a1d437d66636ebb186e7249e8a7aacbff909dde544bd95eaf16f9956708ce1'
            '5ee23ee05da536fb67456c034e757841b27bc8528d93d2bc835e7427fe77d05e'
            '330149a83684ddabe413d134d4c8efad4c88b18c2ab67165014deff5f7fffad2'
            '89f69bcd627868830c421bc6270f08a1c3edf1a1e5fbdedf33c7a7d530bdfccf'
            '40803821f498267f6567436eedc18201b5ae4b5390d6872fb15a94200c2ac06f'
            'cdccb5f0009d1498be90a3f423158d7a3c603a1398f8993ae6fb828224a7cdaa'
            '41d780f291847e19f632428bbf27c3f289414afd237546d2974da1b75384c25c'
            'b637006715ab1cb0b321dc9e703b1dcaf61878c13134669eabebe4b422da96d3'
            '29677faab40d1fff740d743614788fd73c8c2d4167c3bd64d3e8bd4b0eb90d2b'
            'a28354a71c1d9d9f681835a1afe73ca538aca81c4a28d0166b66344854cca235'
            '2cd5b91f86bc26aca85166a50de89faaccbf1ea8f219efb48b50b7ed0f3fe377'
            '631738731bf78a6d0c00c5180c2b3a75b96fffb596d8c9e04dbb0cd24fcc4fec'
            '66b2b53b077ddc2d5eb1d81faa99fa0f4f0db01520900ba948001e539bfe02d8'
            'eb4a4315916fe3f8688c1da5bb5c249a1f402e61617452288d5b0668078c955c'
            '63708b1a7b61ae791df64bb4cefa01dc12236f96bb67fe6d0b2c513e11c81f3e'
            '337378f098e0cd59fb5c28a26b5b74b32168cf48596064469e6a5ba04fe3a36f'
            'ec06f884dd3ed3b8d20fd848769ab1dece4de1605d8fbde11c27665ce9952291'
            '7da812ef83f8f8b9351363525ab6bebd5348faed76d0ae424dcbd7cb6a830dfd'
            'fe18b49ea3c50bf17343581599953dac1cc190d1ea9aab1e69eab0b295420c76')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed -e 's|/var/run|/run|g' \
        -i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_apache-openrc() {
	pkgdesc="OpenRC apache init script"
	depends=('openrc' 'apache')
	backup=('etc/conf.d/httpd')

	install -Dm644 "${srcdir}/gentoo-apache-${_apver}/init/apache2.confd" "${pkgdir}/etc/conf.d/httpd"
	install -Dm755 "${srcdir}/gentoo-apache-${_apver}/init/apache2.initd" "${pkgdir}/etc/init.d/httpd"

	sed -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
            -e 's|/usr/sbin/apache2|/usr/bin/apachectl|' \
            -e 's|/etc/apache2/httpd.conf|/etc/httpd/conf/httpd.conf|' \
            -e 's/! test -f/test -f/' \
            -e 's|/usr/lib/apache2|/usr/lib/httpd|' \
            -e 's|apache2.pid|httpd/httpd.pid|' \
            -e 's|apache2 >/dev/null|httpd >/dev/null|' \
            -e 's|/run/apache_ssl_mutex|/run/httpd|' \
            -i "${pkgdir}/etc/init.d/httpd"

	sed -e 's|/etc/apache2/httpd.conf|/etc/httpd/conf/httpd.conf|' \
            -e 's|/usr/lib/apache2|/usr/lib/httpd|' \
            -e 's|apache2.pid|httpd/httpd.pid|' \
            -e 's|apache2|httpd|g' \
            -i "${pkgdir}/etc/conf.d/httpd"
}

package_autofs-openrc() {
	pkgdesc="OpenRC autofs init script"
	depends=('openrc' 'autofs')

	_inst_initd 'autofs'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/autofs"
}

package_bind-openrc() {
	pkgdesc="OpenRC bind init script"
	depends=('openrc' 'bind')
	backup=('etc/conf.d/named')

	_inst_confd 'named'
	_inst_initd 'named'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -e 's|/etc/bind/named.conf|/etc/named.conf|g' \
            -i "${pkgdir}/etc/init.d/named"
}

package_cyrus-sasl-openrc() {
	pkgdesc="OpenRC cyrus-sasl init script"
	depends=('openrc' 'cyrus-sasl')

	_inst_initd 'saslauthd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/saslauthd"
}

package_dhcp-openrc() {
	pkgdesc="OpenRC dhcp init script"
	depends=('openrc' 'dhcp')
	optdepends=('openldap-openrc: openldap initscript'
			'bind-openrc: bind initscript')
	backup=('etc/conf.d/dhcpd'
			'etc/conf.d/dhcrelay'
			'etc/conf.d/dhcrelay6')
	install=dhcp.install

        for f in dhcpd dhcrelay;do
            _inst_confd $f
            _inst_initd $f
        done
#
	_inst_confd 'dhcrelay6'
# 	_inst_initd 'dhcrelay6'

	install -Dm755 "${srcdir}/dhcrelay.initd" "${pkgdir}/etc/init.d/dhcrelay6"

	for f in ${pkgdir}/etc/init.d/*;do
            sed -e 's|/usr/sbin|/usr/bin|g' \
                -e 's|#@slapd@|ldap slapd|' \
                -i $f
	done
}

package_hostapd-openrc() {
	pkgdesc="OpenRC hostapd init script"
	depends=('openrc' 'hostapd')
	backup=('etc/conf.d/hostapd')

	_inst_confd 'hostapd'
	_inst_initd 'hostapd'

	sed -e 's|/usr/sbin|/usr/bin|g' -i "${pkgdir}/etc/init.d/hostapd"
}

package_iptables-openrc() {
	pkgdesc="OpenRC iptables init script"
	depends=('openrc' 'iptables')
	backup=('etc/conf.d/iptables'
		'etc/conf.d/ip6tables')

	_inst_confd 'iptables'
	_inst_initd 'iptables'

	_inst_confd 'ip6tables'
# 	_inst_initd 'iptables'

	install -Dm755 "${srcdir}/iptables.initd" "${pkgdir}/etc/init.d/ip6tables"

	for f in ${pkgdir}/etc/init.d/*;do
            sed -e 's|/sbin|/usr/bin|g' -i $f
	done
}

package_krb5-openrc() {
	pkgdesc="OpenRC krb5 init script"
	depends=('openrc' 'krb5')

        for f in krb5kadmind krb5kdc krb5kpropd;do
            _inst_initd $f
        done

	for f in ${pkgdir}/etc/init.d/*;do
            sed -e 's|/usr/sbin|/usr/bin|g' \
                -e 's|mit-krb5kdc|krb5kdc|g' \
                -e 's|mit-krb5kadmind|krb5kadmind|g' \
                -i $f
	done
}

package_lighttpd-openrc() {
	pkgdesc="OpenRC lighttpd init script"
	depends=('openrc' 'lighttpd')
	backup=('etc/conf.d/lighttpd')
	install=lighttpd.install

	_inst_confd 'lighttpd'
	_inst_initd 'lighttpd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -e 's/lighttpd:lighttpd/http:http/' \
            -i "${pkgdir}/etc/init.d/lighttpd"
}

package_rpcbind-openrc() {
	pkgdesc="OpenRC rpcbind init script"
	depends=('openrc' 'rpcbind')
# 	backup=('etc/conf.d/rpcbind')

# 	_inst_confd 'rpcbind'
	_inst_initd 'rpcbind'

	sed -e 's|/sbin|/usr/bin|g' \
            -e 's|RPCBIND_OPTS|RPCBIND_ARGS|' \
            -i "${pkgdir}/etc/init.d/rpcbind"
}

package_nfs-utils-openrc() {
	pkgdesc="OpenRC nfs-utils init script"
	depends=('nfs-utils' 'rpcbind-openrc' 'device-mapper-openrc')
	optdepends=('ypbind-openrc: ypbind initscript'
		'quota-tools-openrc: quota-tools initscript'
		'bind-openrc: bind initscript')
	backup=('etc/conf.d/nfs'
		'etc/conf.d/nfsclient')

        for f in nfs nfsclient;do
            _inst_confd $f
            _inst_initd $f
        done

        for f in rpc.gssd rpc.idmapd rpc.pipefs rpc.statd rpc.svcgssd;do
            _inst_initd $f
        done

	for f in ${pkgdir}/etc/init.d/*;do
            sed -e 's|/usr/sbin|/usr/bin|g' -i $f
	done
}

package_openntpd-openrc() {
	pkgdesc="OpenRC openntpd init script"
	depends=('openrc' 'openntpd')
	groups=('openrc-net')
	provides=('openrc-timed')
	conflicts=('ntp'
		'ntp-openrc'
		'systemd-sysvcompat')
	backup=('etc/conf.d/ntpd')

	_inst_confd 'ntpd'
	_inst_initd 'ntpd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/ntpd"
}

package_openldap-openrc() {
	pkgdesc="OpenRC openldap init script"
	depends=('openrc' 'openldap')
	backup=('etc/conf.d/slapd')

	_inst_confd 'slapd'
	_inst_initd 'slapd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -e 's|/usr/lib/openldap/slapd|/usr/lib/slapd|g' \
            -i "${pkgdir}/etc/init.d/slapd"
}

package_openslp-openrc() {
	pkgdesc="OpenRC openslp init script"
	depends=('openrc' 'openslp')

	_inst_initd 'slpd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/slpd"
}

package_openssh-openrc() {
	pkgdesc="OpenRC openssh init script"
	depends=('openrc' 'openssh')
	optdepends=('bind-openrc: bind initscript')
	backup=('etc/conf.d/sshd')

	_inst_confd 'sshd'
	_inst_initd 'sshd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/conf.d/sshd"

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/sshd"
}

package_openvpn-openrc() {
	pkgdesc="OpenRC openvpn init script"
	depends=('openrc' 'openvpn')
	backup=('etc/conf.d/openvpn')

	_inst_confd 'openvpn'
	_inst_initd 'openvpn'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/openvpn"
}

package_polipo-openrc() {
	pkgdesc="OpenRC polipo init script"
	depends=('openrc' 'polipo')

	_inst_initd 'polipo'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/polipo"
}

package_postfix-openrc() {
	pkgdesc="OpenRC postfix init script"
	depends=('openrc' 'postfix')
	optdepends=('bind-openrc: bind initscript'
		'ypbind-openrc: ypbind initscript'
		'cyrus-sasl-openrc: cyrus-sasl initscript')

	_inst_initd 'postfix'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/postfix"
}

package_privoxy-openrc() {
	pkgdesc="OpenRC privoxy init script"
	depends=('openrc' 'privoxy')

	_inst_initd 'privoxy'

	sed -e "${_shebang}" \
            -e 's|/usr/sbin|/usr/bin|g' \
            -e "${_runpath}" \
            -i "${pkgdir}/etc/init.d/privoxy"
}

package_quota-tools-openrc() {
	pkgdesc="OpenRC quota-tools init script"
	depends=('quota-tools' 'rpcbind-openrc')
	optdepends=('ypbind-openrc: ypbind initscript')
	backup=('etc/conf.d/quota')

	_inst_confd 'quota'
	_inst_initd 'quota'
	_inst_initd 'rpc.rquotad'

	for f in ${pkgdir}/etc/init.d/*;do
            sed -e 's|/usr/sbin|/usr/bin|g' -i $f
	done
}

package_rsync-openrc() {
	pkgdesc="OpenRC rsync init script"
	depends=('openrc' 'rsync')
	backup=('etc/conf.d/rsyncd')

	_inst_confd 'rsyncd'
	_inst_initd 'rsyncd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/rsyncd"
}

package_samba-openrc() {
	pkgdesc="OpenRC samba init script"
	depends=('openrc' 'samba')
	backup=('etc/conf.d/smb')

	_inst_confd 'smb'
	_inst_initd 'smb'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -e 's/="samba"/="smb"/' \
            -i "${pkgdir}/etc/conf.d/smb"

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -e 's/##samba/##smb/' \
            -e 's|"samba"|"smb"|' \
            -i "${pkgdir}/etc/init.d/smb"
}

package_squid-openrc() {
	pkgdesc="OpenRC squid init script"
	depends=('openrc' 'squid')
	optdepends=('bind-openrc: bind initscript')
	backup=('etc/conf.d/squid')

	_inst_confd 'squid'
	_inst_initd 'squid'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -e 's|chown squid|chown proxy|' \
            -e 's|squid:squid|proxy:proxy|' \
            -i "${pkgdir}/etc/init.d/squid"
}

package_transmission-openrc() {
	pkgdesc="OpenRC transmission init script"
	depends=('openrc' 'transmission-cli')
	backup=('etc/conf.d/transmission-daemon')

	_inst_confd 'transmission-daemon'
	_inst_initd 'transmission-daemon'
}

package_ufw-openrc() {
	pkgdesc="OpenRC ufw init script"
	depends=('openrc' 'ufw')
	backup=('etc/conf.d/ufw')

	_inst_confd 'ufw'
	_inst_initd 'ufw'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -e 's|/usr/share/ufw/ufw-init-functions|/usr/lib/ufw/ufw-init-functions|g' \
            -i "${pkgdir}/etc/init.d/ufw"
}

package_vsftpd-openrc() {
	pkgdesc="OpenRC vsftpd init script"
	depends=('openrc' 'vsftpd')
	optdepends=('bind-openrc: bind initscript')

	_inst_initd 'vsftpd'

	install -Dm755 "${srcdir}/vsftpd-checkconfig.sh" "${pkgdir}/usr/lib/vsftpd-checkconfig.sh"

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -e 's|/usr/libexec/|/usr/lib/|g' \
            -e 's|/etc/vsftpd/|/etc/|g' \
            -i "${pkgdir}/etc/init.d/vsftpd"

	sed -e 's|/etc/vsftpd/|/etc/|g' \
            -i "${pkgdir}/usr/lib/vsftpd-checkconfig.sh"
}

package_xinetd-openrc() {
	pkgdesc="OpenRC xinetd init script"
	depends=('openrc' 'xinetd')
	backup=('etc/conf.d/xinetd')

	_inst_confd 'xinetd'
	_inst_initd 'xinetd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/xinetd"
}

package_ypbind-mt-openrc() {
	pkgdesc="OpenRC ypbind-mt init script"
	depends=('ypbind-mt' 'rpcbind-openrc' 'openslp-openrc')
	optdepends=('ypserv-openrc: ypserv initscript')
	backup=('etc/conf.d/ypbind')

	_inst_confd 'ypbind'
	_inst_initd 'ypbind'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/ypbind"
}

package_ypserv-openrc() {
	pkgdesc="OpenRC ypserv init script"
	depends=('openrc' 'ypserv')
	backup=('etc/conf.d/rpc.yppasswdd'
		'etc/conf.d/rpc.ypxfrd'
		'etc/conf.d/ypserv')

        for f in ypserv rpc.yppasswdd rpc.ypxfrd;do
            _inst_confd $f
            _inst_initd $f
        done

	for f in ${pkgdir}/etc/init.d/*;do
            sed -e 's|/usr/sbin|/usr/bin|g' -i $f
	done
}

package_tor-openrc() {
	pkgdesc="OpenRC tor init script"
	depends=('openrc' 'tor')
	backup=('etc/conf.d/tor')
	install=tor.install

	_inst_confd 'tor'
	_inst_initd 'tor'
}

package_wicd-openrc() {
	pkgdesc="OpenRC wicd script"
	depends=('openrc' 'wicd')

	_inst_initd 'wicd'
}

package_syncthing-openrc() {
	pkgdesc="OpenRC syncthing init script"
	depends=('openrc' 'syncthing')
	backup=('etc/conf.d/syncthing')

	_inst_confd 'syncthing'
	_inst_initd 'syncthing'
}

package_nginx-openrc() {
	pkgdesc="OpenRC nginx init script"
	depends=('openrc' 'nginx')
	backup=('etc/conf.d/nginx')

	_inst_confd 'nginx'
	_inst_initd 'nginx'

	sed -e 's|/usr/sbin|/usr/bin|g' \
            -i "${pkgdir}/etc/init.d/nginx"
}

package_vnstat-openrc() {
	pkgdesc="OpenRC vnstat init script"
	depends=('openrc' 'vnstat')
	backup=('etc/conf.d/vnstatd')

	_inst_confd 'vnstatd'
	_inst_initd 'vnstatd'
}

package_snort-openrc() {
	pkgdesc="OpenRC snort init script"
	depends=('openrc' 'snort')
	optdepends=('mysql-openrc: mysql initscript'
		'postgresql-openrc: postgresql initscript')
	backup=('etc/conf.d/snort')

	_inst_confd 'snort'
	_inst_initd 'snort'
}

package_unbound-openrc() {
	pkgdesc="OpenRC unbound init script"
	depends=('openrc' 'unbound')
	backup=('etc/conf.d/unbound')

	_inst_confd 'unbound'
	_inst_initd 'unbound'
}

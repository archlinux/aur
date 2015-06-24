# Maintainer: artoo <artoo@manjaro.org>

_apver=2.4.10-r1
_aprel=20140731

_dev_uri="http://dev.gentoo.org/~polynomial-c/dist/apache"
_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"

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
		'nginx-openrc')
pkgver=20150613
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-net')
conflicts=('openrc'
		'openrc-git'
		'openrc-arch-services-git'
		'initscripts'
		'systemd-sysvcompat')
source=("${_dev_uri}/gentoo-apache-${_apver}-${_aprel}.tar.bz2"
		"named.confd::${_gentoo_uri}/net-dns/bind/files/named.confd-r7"
		"named.initd::${_gentoo_uri}/net-dns/bind/files/named.init-r13"
		"saslauthd.initd::${_gentoo_uri}/dev-libs/cyrus-sasl/files/saslauthd2.rc7"
		"dhcpd.confd::${_gentoo_uri}/net-misc/dhcp/files/dhcpd.conf2"
		"dhcrelay.confd::${_gentoo_uri}/net-misc/dhcp/files/dhcrelay.conf"
		"dhcrelay6.confd::${_gentoo_uri}/net-misc/dhcp/files/dhcrelay6.conf"
		"dhcpd.initd::${_gentoo_uri}/net-misc/dhcp/files/dhcpd.init5"
		"dhcrelay.initd::${_gentoo_uri}/net-misc/dhcp/files/dhcrelay.init3"
		"hostapd.confd::${_gentoo_uri}/net-wireless/hostapd/files/hostapd-conf.d"
		"hostapd.initd::${_gentoo_uri}/net-wireless/hostapd/files/hostapd-init.d"
		"iptables.confd::${_gentoo_uri}/net-firewall/iptables/files/iptables-1.4.13.confd"
		"ip6tables.confd::${_gentoo_uri}/net-firewall/iptables/files/ip6tables-1.4.13.confd"
		"iptables.initd::${_gentoo_uri}/net-firewall/iptables/files/iptables-1.4.13-r1.init"
		"krb5kadmind.initd::${_gentoo_uri}/app-crypt/mit-krb5/files/mit-krb5kadmind.initd-r1"
		"krb5kdc.initd::${_gentoo_uri}/app-crypt/mit-krb5/files/mit-krb5kdc.initd-r1"
		"krb5kpropd.initd::${_gentoo_uri}/app-crypt/mit-krb5/files/mit-krb5kpropd.initd-r1"
		"lighttpd.confd::${_gentoo_uri}/www-servers/lighttpd/files/lighttpd.confd"
		"lighttpd.initd::${_gentoo_uri}/www-servers/lighttpd/files/lighttpd.initd"
		"nfs.confd::${_gentoo_uri}/net-fs/nfs-utils/files/nfs.confd"
		"nfs.initd::${_gentoo_uri}/net-fs/nfs-utils/files/nfs.initd"
		"nfsclient.confd::${_gentoo_uri}/net-fs/nfs-utils/files/nfsclient.confd"
		"nfsclient.initd::${_gentoo_uri}/net-fs/nfs-utils/files/nfsclient.initd"
		"rpc.idmapd.initd::${_gentoo_uri}/net-fs/nfs-utils/files/rpc.idmapd.initd"
		"rpc.pipefs.initd::${_gentoo_uri}/net-fs/nfs-utils/files/rpc.pipefs.initd"
		"rpc.gssd.initd::${_gentoo_uri}/net-fs/nfs-utils/files/rpc.gssd.initd"
		"rpc.svcgssd.initd::${_gentoo_uri}/net-fs/nfs-utils/files/rpc.svcgssd.initd"
		"rpc.statd.initd::${_gentoo_uri}/net-fs/nfs-utils/files/rpc.statd.initd"
		"slapd.confd::${_gentoo_uri}/net-nds/openldap/files/slapd-confd-2.4.28-r1"
		"slapd.initd::${_gentoo_uri}/net-nds/openldap/files/slapd-initd-2.4.28-r1"
		"slpd.initd::${_gentoo_uri}/net-libs/openslp/files/slpd-init"
		"sshd.confd::${_gentoo_uri}/net-misc/openssh/files/sshd.confd"
		"sshd.initd::${_gentoo_uri}/net-misc/openssh/files/sshd.rc6.4"
		"polipo.initd::${_gentoo_uri}/net-proxy/polipo/files/polipo.initd"
		"postfix.initd::${_gentoo_uri}/mail-mta/postfix/files/postfix.rc6.2.7"
		"privoxy.initd::${_gentoo_uri}/net-proxy/privoxy/files/privoxy.initd"
		"quota.confd::${_gentoo_uri}/sys-fs/quota/files/quota.confd"
		"quota.initd::${_gentoo_uri}/sys-fs/quota/files/quota.rc7"
		"rpc.rquotad.initd::${_gentoo_uri}/sys-fs/quota/files/rpc.rquotad.initd"
		"rpcbind.initd::${_gentoo_uri}/net-nds/rpcbind/files/rpcbind.initd"
		"rsyncd.confd::${_gentoo_uri}/net-misc/rsync/files/rsyncd.conf.d"
		"rsyncd.initd::${_gentoo_uri}/net-misc/rsync/files/rsyncd.init.d-r1"
		"smb.confd::${_gentoo_uri}/net-fs/samba/files/4.1/samba4.confd"
		"smb.initd::${_gentoo_uri}/net-fs/samba/files/4.1/samba4.initd-r1"
		"squid.confd::${_gentoo_uri}/net-proxy/squid/files/squid.confd-r1"
		"squid.initd::${_gentoo_uri}/net-proxy/squid/files/squid.initd-r4"
		"transmission-daemon.confd::${_gentoo_uri}/net-p2p/transmission/files/transmission-daemon.confd.4"
		"transmission-daemon.initd::${_gentoo_uri}/net-p2p/transmission/files/transmission-daemon.initd.9"
		"ufw.confd::${_gentoo_uri}/net-firewall/ufw/files/ufw.confd"
		"ufw.initd::${_gentoo_uri}/net-firewall/ufw/files/ufw-2.initd"
		"${_gentoo_uri}/net-ftp/vsftpd/files/vsftpd-checkconfig.sh"
		"vsftpd.initd::${_gentoo_uri}/net-ftp/vsftpd/files/vsftpd.init"
		"xinetd.confd::${_gentoo_uri}/sys-apps/xinetd/files/xinetd.confd"
		"xinetd.initd::${_gentoo_uri}/sys-apps/xinetd/files/xinetd.rc6"
		"ypbind.confd::${_gentoo_uri}/net-nds/ypbind/files/ypbind.confd-r1"
		"ypbind.initd::${_gentoo_uri}/net-nds/ypbind/files/ypbind.initd"
		"ypserv.confd::${_gentoo_uri}/net-nds/ypserv/files/ypserv.confd"
		"rpc.yppasswdd.confd::${_gentoo_uri}/net-nds/ypserv/files/rpc.yppasswdd.confd"
		"rpc.ypxfrd.confd::${_gentoo_uri}/net-nds/ypserv/files/rpc.ypxfrd.confd"
		"ypserv.initd::${_gentoo_uri}/net-nds/ypserv/files/ypserv"
		"rpc.yppasswdd.initd::${_gentoo_uri}/net-nds/ypserv/files/rpc.yppasswdd-r1"
		"rpc.ypxfrd.initd::${_gentoo_uri}/net-nds/ypserv/files/rpc.ypxfrd-2.23"
		"autofs.initd::${_gentoo_uri}/net-fs/autofs/files/autofs5.initd"
		"openvpn.confd::${_gentoo_uri}/net-misc/openvpn/files/openvpn-2.1.conf"
		"openvpn.initd::${_gentoo_uri}/net-misc/openvpn/files/openvpn-2.1.init"
		"ntpd.confd::${_gentoo_uri}/net-misc/openntpd/files/openntpd.conf.d-20080406-r6"
		"ntpd.initd::${_gentoo_uri}/net-misc/openntpd/files/openntpd.init.d-20080406-r6"
		"tor.confd::${_gentoo_uri}/net-misc/tor/files/tor.confd"
		"tor.initd::${_gentoo_uri}/net-misc/tor/files/tor.initd-r7"
		"nginx.initd::${_gentoo_uri}/www-servers/nginx/files/nginx.initd-r2"
		"wicd.initd"
		"syncthing.confd"
		"syncthing.initd")
sha256sums=('8e093a18582c3a20283ed1c09de9acc6832a80b1d5a02962599db0535d38af19'
            '3cf1ab72446cb9417de916e4cd732f2056fb74d2c6f03da6741b7bae8c415448'
            '55024fe0e2b491b5cb490a9f575bad3096d446f20f8d52778d778fd26a415d52'
            'a095def10c3b7e6894a6d782c70cbe176c7b53f36386dcc4b1e5bc75424e29f0'
            'e8a413e9102948b336f60041fc3cade33125faf56d8319ee65d9f3c63199a8e7'
            'a157630c3bdc9565cca8240ee1e6539fc9cbc1e4642c40e0965e3609d1021bac'
            '099f668e1ad42ed9446b15675032a1186715d1fe9e4a1b24dfb787e68495d2b6'
            'b5811c6adf10d6210e5685b4e999f0449ac492379d055226eeb140f00d9b8702'
            '204aaf81d51dc119cee1d1ff3ae3dd50af666af2f8b2a363fd1bf442d4dcee00'
            '916f4b14095ee4ec8a510391c883e9f01868e18d79a3d5cbeb13a104a793d45d'
            'b9701b9ea509638ee1ed74bec38a22e6bd7358763497ce53c146d2faf9e97a61'
            '7e2341211ca14997b7a8a1f930f94db855291af597c568f680f80031c20d45b6'
            '2938fe4206514d9868047bd8f888a699fa2097ca69edab176453436d4259abaa'
            '13047698e03079b754957e1e548ce7505dfb2c73c9a31f87e061140603ab0e44'
            '3e55c79f19aaa6ef6b64a621c03dbb2eac3ad923916dc803f4c1bfe48ce89fbb'
            '709309dea043aa306c2fcf0960e0993a6db540c220de64cf92d6b85f1cca23c5'
            'c374ea05d7e9f15e10c8f9dbd0cad6548e0f92aef7de33e5dbc27222e9407e7b'
            'bb6e6721f33e6582a91025f3500e159a599fb856d699e9394093e1018c7925e0'
            'b1515472c32927039b38f6c3a797cbc54a5a300b5d6fa54df9550174afa2b7f8'
            'c652a4fe8a43dc68a818345db2b3acc560663b5b6c969324d4f23afb0fb96a94'
            '1e77bc6fb2ceb266f724818898bd42bec47512a5a7ede6660e0565ea1c58d619'
            'e8842fca856eae598fb8fe15ed8d3cef13e61851217be66b8cc4087af8cee8ad'
            '122ade9931af8f64696375c9c66d00f64a90949616e00e9a00a7264c50c2e8a7'
            '3ce65326859c43983dad25ad2d4731488c488037796e39b6b5eda336e8bf81ef'
            'ebee63e81fb952474c34b745913e8774b29c9cc65180d363a33d991e478aea2d'
            '00d9c29280a83e8458c33139d04a9b38c6fdba9d7cb9b420ca83bf6b10e6435d'
            'f1c460d8b0e91e54a551397d755135d05a3728d81de596535bf8bda074455677'
            'a5731b8f681111421277c6c1c43b3e1d303790d9f8aebd977a895b0ed7a73bc3'
            '5bca003ec3b67c7c78519aede1d82002579006ccfecce8f87b559df719f82e92'
            '1fc515a6816b8a750db513df0b3b9bf8dd8bd4c4e9051205521acadfdebeae0f'
            '7f228796e020c0779c52683f684197d50662ae890b1ae193ffa9acf157ccd143'
            '29c6d57ac3ec6018cadc6ba6cd9b90c9ed46e20049b970fdcc68ee2481a2ee41'
            '26cdcade999f3797016c8f894e27173e5ccee73cf6ec8de8ffcca468d7cd6379'
            'ff37dacce4551b6ef9866435d586b014aae5fef5b6c3ae7ba839165514644765'
            '51f4bffa535d891f94d4a20ca2a4a42cc99189f3de78cee1c8d235e4a9d1721d'
            '224496b498b4f692ae3316a95b5c7c8b6230dcd5fee0ca163956a7acde243de9'
            '00d1dfb3b893db5d6a213a4edda622c7d64dcafa40b3019f15e070c164286632'
            '00ce705b49aaa356d9d9f0be3b80a3fe2810471cbe02fd0edc66349f3ca281de'
            'c3896303d6cfebf314a3f6b8aeed0f6cb6ae421c4c0923b0121c76b3251314e5'
            '6561ae40c5899a9f7a12f1f0867bec47d47c7cc3c583574ffcecbbf6f8d8afbb'
            'de758791b16b89a648c01867af7f51bc9bd44e40cbe868e439b753ff5d9572e5'
            'baff64277f9aa62cf1eeed2284bb08c4f3078a8e6e7604e4fec228ca5fa9dd82'
            '53755809cc27fdbaf98752cd3da45b5c2bda62dd46fcc37570c6e237f7954ffa'
            '9f4eaba0b966fd30351fa66cac9a666b5ec1dc54035ddad94c61a2f43dcb2d62'
            '214a184495a3384eb452caef435256043bc51e35140a61b1f5fdff32603c8f7e'
            '3830cb94600ac658a6ff1f9f31bdbece64caf3ad23c62ae0a887d152970125f5'
            '249689688aad23d0d27ccdd08a0907fd85058d6a52ccd3467f756b07f5d059ee'
            '06d047b47befe6aaf1b1542fdd50e84ea38e0fef004b5095f6096f33fa1901a3'
            '069aa7382b40aecebf26ef53f3f4c49890314e0357925c84b3c15f1d0b913be0'
            '657b5305923b2a5de9eb96931aaaa28d6e997ace6c40793d905887798094258c'
            '2de7c7c1edfe3ae0480e22d988a564db3bb873050929ebb6e8361d7a1288ddda'
            '4297952eeeb02b5c4f2f750742614513fa6a0c8d291a9a0adcec1ec0098fcd78'
            'e401e2cf7c0180a170d3dc3e91d7e98002bae7b013df72813b7bcf89b864fb3a'
            '6aeb4ec9b8ccc062b5ee8c609830c05cee3ed790fa90d7b2d8cf82a09e317c5c'
            '79f6c6ed4875f00fe702f69e9a6180a032d5a47f3e58e892e6ba0e2746b6fec8'
            '3cdd6872fae15dc8533b3f75ac36ad59ffb946a3f1b445d688629c621cebbe34'
            '4edd475ca95d31cfcea20a8e6268024f8128423bc7ae67edb535e6811c64668e'
            'e46afe737bfc57aa31be1a441615fcc112e1ebf41d631c1929e00b81baca119d'
            'bd1f245a362f85319e83965e8b825e66e686a4a0bf185ab8ec51fd335bc873c2'
            '08db79845b497f2ec8938854ffac904aeed747d98c0820ad0be9e5aa9377512b'
            'e827778b8a8e6984b637c745c315a2e02ebc46af752651b7a70626ba545a84b6'
            'a6445dd607093fdafb013e5896f60d78223549b38c96300fe239bcf5dbf2a8de'
            'f2c44e5018719f644e194a4e8e43390bdc9926c533f79c41f0abf84879799d05'
            '330149a83684ddabe413d134d4c8efad4c88b18c2ab67165014deff5f7fffad2'
            'd1b1f8a00935d77521bceb62535350444df3470fa45f4d33c3934051a1bb595b'
            '40803821f498267f6567436eedc18201b5ae4b5390d6872fb15a94200c2ac06f'
            '22a4b5e4c934ea8ba66764441b0bb60d31d23c147c8b64a4a035947327bfc3ec'
            '41d780f291847e19f632428bbf27c3f289414afd237546d2974da1b75384c25c'
            '666b0cacc53515fb8409ada05d7e92b1de4d9a4814ba145f4982ffd164958aae'
            '9d5fca09d0161446a5cec30a0694cdc0656469403a008920a52a190051218b36'
            '66b2b53b077ddc2d5eb1d81faa99fa0f4f0db01520900ba948001e539bfe02d8'
            'eb4a4315916fe3f8688c1da5bb5c249a1f402e61617452288d5b0668078c955c'
            '63708b1a7b61ae791df64bb4cefa01dc12236f96bb67fe6d0b2c513e11c81f3e')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_apache-openrc() {
	pkgdesc="OpenRC apache init script"
	depends=('openrc-core' 'apache')
	backup=('etc/conf.d/httpd')
	install=apache.install

	install -Dm644 "${srcdir}/gentoo-apache-${_apver}/init/apache2.confd" "${pkgdir}/etc/conf.d/httpd"
	install -Dm755 "${srcdir}/gentoo-apache-${_apver}/init/apache2.initd" "${pkgdir}/etc/init.d/httpd"

	sed -e "${_shebang}" \
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
	depends=('openrc-core' 'autofs')
	install=autofs.install

	_inst_initd 'autofs'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/autofs"
}

package_bind-openrc() {
	pkgdesc="OpenRC bind init script"
	depends=('openrc-core' 'bind')
	backup=('etc/conf.d/named')
	install=bind.install

	_inst_confd 'named'
	_inst_initd 'named'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-e 's|/etc/bind/named.conf|/etc/named.conf|g' \
		-i "${pkgdir}/etc/init.d/named"
}

package_cyrus-sasl-openrc() {
	pkgdesc="OpenRC cyrus-sasl init script"
	depends=('openrc-core' 'cyrus-sasl')
	install=cyrus-sasl.install

	_inst_initd 'saslauthd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/saslauthd"
}

package_dhcp-openrc() {
	pkgdesc="OpenRC dhcp init script"
	depends=('openrc-core' 'dhcp')
	optdepends=('openldap-openrc: openldap initscript'
			'bind-openrc: bind initscript')
	backup=('etc/conf.d/dhcpd'
			'etc/conf.d/dhcrelay'
			'etc/conf.d/dhcrelay6')
	install=dhcp.install

	_inst_confd 'dhcpd'
	_inst_initd 'dhcpd'

	_inst_confd 'dhcrelay'
	_inst_initd 'dhcrelay'

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
	depends=('openrc-core' 'hostapd')
	backup=('etc/conf.d/hostapd')
	install=hostapd.install

	_inst_confd 'hostapd'
	_inst_initd 'hostapd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/hostapd"
}

package_iptables-openrc() {
	pkgdesc="OpenRC iptables init script"
	depends=('openrc-core' 'iptables')
	backup=('etc/conf.d/iptables'
		'etc/conf.d/ip6tables')
	install=iptables.install

	_inst_confd 'iptables'
	_inst_initd 'iptables'

	_inst_confd 'ip6tables'
# 	_inst_initd 'iptables'

	install -Dm755 "${srcdir}/iptables.initd" "${pkgdir}/etc/init.d/ip6tables"

	for f in ${pkgdir}/etc/init.d/*;do
		sed -e 's|/sbin|/usr/bin|g' \
			-i $f
	done
}

package_krb5-openrc() {
	pkgdesc="OpenRC krb5 init script"
	depends=('openrc-core' 'krb5')
	install=krb5.install

	_inst_initd 'krb5kadmind'
	_inst_initd 'krb5kdc'
	_inst_initd 'krb5kpropd'

	for f in ${pkgdir}/etc/init.d/*;do
		sed -e 's|/usr/sbin|/usr/bin|g' \
			-e 's|mit-krb5kdc|krb5kdc|g' \
			-e 's|mit-krb5kadmind|krb5kadmind|g' \
			-i $f
	done
}

package_lighttpd-openrc() {
	pkgdesc="OpenRC lighttpd init script"
	depends=('openrc-core' 'lighttpd')
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
	depends=('openrc-core' 'rpcbind')
	#backup=('etc/conf.d/rpcbind')
	install=rpcbind.install

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
	install=nfs-utils.install

	_inst_confd 'nfs'
	_inst_initd 'nfs'

	_inst_confd 'nfsclient'
	_inst_initd 'nfsclient'

	_inst_initd 'rpc.gssd'
	_inst_initd 'rpc.idmapd'
	_inst_initd 'rpc.pipefs'
	_inst_initd 'rpc.statd'
	_inst_initd 'rpc.svcgssd'

	for f in ${pkgdir}/etc/init.d/*;do
		sed -e 's|/usr/sbin|/usr/bin|g' \
			-i $f
	done
}

package_openntpd-openrc() {
	pkgdesc="OpenRC openntpd init script"
	depends=('openrc-core' 'openntpd')
	groups=('openrc-net')
	provides=('openrc-timed')
	conflicts=('ntp'
		'ntp-openrc'
		'openrc'
		'openrc-git'
		'openrc-arch-services-git'
		'initscripts'
		'systemd-sysvcompat')
	backup=('etc/conf.d/ntpd')
	install=openntpd.install

	_inst_confd 'ntpd'
	_inst_initd 'ntpd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/ntpd"
}

package_openldap-openrc() {
	pkgdesc="OpenRC openldap init script"
	depends=('openrc-core' 'openldap')
	backup=('etc/conf.d/slapd')
	install=openldap.install

	_inst_confd 'slapd'
	_inst_initd 'slapd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-e 's|/usr/lib/openldap/slapd|/usr/lib/slapd|g' \
		-i "${pkgdir}/etc/init.d/slapd"
}

package_openslp-openrc() {
	pkgdesc="OpenRC openslp init script"
	depends=('openrc-core' 'openslp')
	install=openslp.install

	_inst_initd 'slpd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/slpd"
}

package_openssh-openrc() {
	pkgdesc="OpenRC openssh init script"
	depends=('openrc-core' 'openssh')
	optdepends=('bind-openrc: bind initscript')
	backup=('etc/conf.d/sshd')
	install=openssh.install

	_inst_confd 'sshd'
	_inst_initd 'sshd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/conf.d/sshd"

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/sshd"
}

package_openvpn-openrc() {
	pkgdesc="OpenRC openvpn init script"
	depends=('openrc-core' 'openvpn')
	backup=('etc/conf.d/openvpn')
	install=openvpn.install

	_inst_confd 'openvpn'
	_inst_initd 'openvpn'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/openvpn"
}

package_polipo-openrc() {
	pkgdesc="OpenRC polipo init script"
	depends=('openrc-core' 'polipo')
	install=polipo.install

	_inst_initd 'polipo'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/polipo"
}

package_postfix-openrc() {
	pkgdesc="OpenRC postfix init script"
	depends=('openrc-core' 'postfix')
	optdepends=('bind-openrc: bind initscript'
		'ypbind-openrc: ypbind initscript'
		'cyrus-sasl-openrc: cyrus-sasl initscript')
	install=postfix.install

	_inst_initd 'postfix'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/postfix"
}

package_privoxy-openrc() {
	pkgdesc="OpenRC privoxy init script"
	depends=('openrc-core' 'privoxy')
	install=privoxy.install

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
	install=quota-tools.install

	_inst_confd 'quota'
	_inst_initd 'quota'
	_inst_initd 'rpc.rquotad'

	for f in ${pkgdir}/etc/init.d/*;do
		sed -e 's|/usr/sbin|/usr/bin|g' \
			-i $f
	done
}

package_rsync-openrc() {
	pkgdesc="OpenRC rsync init script"
	depends=('openrc-core' 'rsync')
	backup=('etc/conf.d/rsyncd')
	install=rsync.install

	_inst_confd 'rsyncd'
	_inst_initd 'rsyncd'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/rsyncd"
}

package_samba-openrc() {
	pkgdesc="OpenRC samba init script"
	depends=('openrc-core' 'samba')
	backup=('etc/conf.d/smb')
	install=samba.install

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
	depends=('openrc-core' 'squid')
	optdepends=('bind-openrc: bind initscript')
	backup=('etc/conf.d/squid')
	install=squid.install

	_inst_confd 'squid'
	_inst_initd 'squid'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-e 's|chown squid|chown proxy|' \
		-e 's|squid:squid|proxy:proxy|' \
		-i "${pkgdir}/etc/init.d/squid"
}

package_transmission-openrc() {
	pkgdesc="OpenRC transmission init script"
	depends=('openrc-core' 'transmission-cli')
	backup=('etc/conf.d/transmission-daemon')
	install=transmission.install

	_inst_confd 'transmission-daemon'
	_inst_initd 'transmission-daemon'
}

package_ufw-openrc() {
	pkgdesc="OpenRC ufw init script"
	depends=('openrc-core' 'ufw')
	backup=('etc/conf.d/ufw')
	install=ufw.install

	_inst_confd 'ufw'
	_inst_initd 'ufw'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-e 's|/usr/share/ufw/ufw-init-functions|/usr/lib/ufw/ufw-init-functions|g' \
		-i "${pkgdir}/etc/init.d/ufw"
}

package_vsftpd-openrc() {
	pkgdesc="OpenRC vsftpd init script"
	depends=('openrc-core' 'vsftpd')
	optdepends=('bind-openrc: bind initscript')
	install=vsftpd.install

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
	depends=('openrc-core' 'xinetd')
	backup=('etc/conf.d/xinetd')
	install=xinetd.install

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
	install=ypbind-mt.install

	_inst_confd 'ypbind'
	_inst_initd 'ypbind'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/ypbind"
}

package_ypserv-openrc() {
	pkgdesc="OpenRC ypserv init script"
	depends=('openrc-core' 'ypserv')
	backup=('etc/conf.d/rpc.yppasswdd'
		'etc/conf.d/rpc.ypxfrd'
		'etc/conf.d/ypserv')
	install=ypserv.install

	_inst_confd 'ypserv'
	_inst_initd 'ypserv'

	_inst_confd 'rpc.yppasswdd'
	_inst_initd 'rpc.yppasswdd'

	_inst_confd 'rpc.ypxfrd'
	_inst_initd 'rpc.ypxfrd'

	for f in ${pkgdir}/etc/init.d/*;do
		sed -e 's|/usr/sbin|/usr/bin|g' \
			-i $f
	done
}

package_tor-openrc() {
	pkgdesc="OpenRC tor init script"
	depends=('openrc-core' 'tor')
	backup=('etc/conf.d/tor')
	install=tor.install

	_inst_confd 'tor'
	_inst_initd 'tor'
}

package_wicd-openrc() {
	pkgdesc="OpenRC wicd script"
	depends=('openrc-core' 'wicd')
	install=wicd.install

	_inst_initd 'wicd'
}

package_syncthing-openrc() {
	pkgdesc="OpenRC syncthing init script"
	depends=('openrc-core' 'syncthing')
	backup=('etc/conf.d/syncthing')
	install=syncthing.install

	_inst_confd 'syncthing'
	_inst_initd 'syncthing'
}

package_nginx-openrc() {
	pkgdesc="OpenRC nginx init script"
	depends=('openrc-core' 'nginx')
	install=nginx.install

	_inst_initd 'nginx'

	sed -e 's|/usr/sbin|/usr/bin|g' \
		-i "${pkgdir}/etc/init.d/nginx"
}

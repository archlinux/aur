# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=neutron
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=17.1.1
pkgrel=2
pkgdesc="OpenStack Networking Service"
arch=('any')
url="https://docs.openstack.org/neutron/latest/"
license=('Apache')
depends=(
	ipset
	iptables
	ebtables
	dnsmasq
	haproxy
	sudo
	python
	python-pbr
	python-paste
	python-pastedeploy
	python-routes
	python-debtcollector
	python-decorator
	python-eventlet
	python-pecan
	python-httplib2
	python-requests
	python-jinja
	python-keystonemiddleware
	python-netaddr
	python-netifaces
	python-neutron-lib
	python-neutronclient
	python-tenacity
	python-sqlalchemy
	python-webob
	python-keystoneauth1
	python-alembic
	python-stevedore
	python-oslo-cache
	python-oslo-concurrency
	python-oslo-config
	python-oslo-context
	python-oslo-db
	python-oslo-i18n
	python-oslo-log
	python-oslo-messaging
	python-oslo-middleware
	python-oslo-policy
	python-oslo-privsep
	python-oslo-reports
	python-oslo-rootwrap
	python-oslo-serialization
	python-oslo-service
	python-oslo-upgradecheck
	python-oslo-utils
	python-oslo-versionedobjects
	python-osprofiler
	python-os-ken
	python-ovs-wrapper
	python-ovsdbapp
	python-psutil
	python-pyroute2
	python-pyopenssl
	python-novaclient
	python-openstacksdk
	python-designateclient
	python-os-xenapi
	python-os-vif
	python-futurist
	python-tooz
)
makedepends=(
	python-setuptools
	python-sphinx
	python-sphinx-feature-classification
	python-openstackdocstheme
	python-oslotest
	python-reno
)
checkdepends=(
	python-hacking
	bandit
	python-coverage
	python-fixtures
	python-flake8-import-order
	python-subunit
	python-testtools
	python-testresources
	python-testscenarios
	python-webtest
	python-oslotest
	python-stestr
	python-reno
	python-ddt
	python-astroid
	python-pylint
	python-isort
	python-pymysql
	python-bashate
)
source=(
	https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz
	0000-Finish-the-new-DB-engine-facade-migration.patch
	0001-Arch-Rootwrap-Path.patch
	openstack-neutron-dhcp-agent.service
	openstack-neutron-l3-agent.service
	openstack-neutron-linuxbridge-agent.service
	openstack-neutron-linuxbridge-cleanup.service
	openstack-neutron-metering-agent.service
	openstack-neutron-metadata-agent.service
	openstack-neutron-netns-cleanup.service
	openstack-neutron-ovs-cleanup.service
	openstack-neutron-server.service
	neutron-dist.conf
	sudoers.conf
	sysusers.conf
	tmpfiles.conf
)
md5sums=('0283ec5cf4e8b2618777978bf276e7c4'
         'd331c9e3095d6b9001fb6bbe88998c57'
         'b5f58a9fe03abe3ac0c5b90249c9870d'
         '6c4b505df881dcf0a281b9114a54254c'
         '9e1241abb06716283f2fea1f5211595d'
         '46c6be76ff13aed512e7e2df8f7b85d0'
         '6098500febe69351c9704d0c0e62b413'
         '356ac213aee3f74edd308bd4316c366b'
         '5ad1a5b58a55807eecc561048f119f45'
         '51b0cca95f4f70c0b500d3213cadc909'
         '7e65d44244ad9c165cae647637202f64'
         '7388dee422e1ace5cbe07e40584fafc7'
         'b1e073aeb87d46ba69c183d1256b4883'
         '04ca03ff0f88a3a358949559434112d4'
         'e51c63b54d8111d7cd9009ede40e5da3'
         '1fe5e7e568a0659dcc43b3ecf68b5f55')
sha256sums=('acd89f4e592a277ec77f0747060f2fdf2e7fede2e573ee23afc87d46983d0230'
            'd9792643a47dddb01c40b0313694bfd4a51d4eaf2c83d8dbc5a6e913ebe41c42'
            'e385701d170eed1cf22b69abc7175d5db71e47717a228e6fbbe68b340f0498ae'
            '8344bea72f4acf0364f1f0a8ff7db616ebead43ae326e6c87ddfb9df38d23b9b'
            '3f859b88563c0e6adab6c7b3b7920a8a6da23244bdfcdbc89470c3bcc75b1d37'
            '7fa619b78f56d9202b73ed231ab2871159e8f911e21566c0ab3c47e37d46b064'
            'b165440ca522d514668b82e219b802ce7c089f7bd837bef0eff5f1598af2ecf6'
            'a106c372706aff65076f3374003d5b41ec08e2093dbba0f2c95a7a18e85a7e52'
            '342699fa9891bba5e5adea645b9a63999cb2c4ce8aaaf7024a963b254892dbcc'
            '1a9116d10c794c0329d516dc033efdb85deedc8cb16ffada0cd8c2b8e7e6fb8e'
            '3543bc3ff6768a5ddc6970bc81aeecb892a6666f38b088bdfaf022a477ec08df'
            '6888a7a720f08cc084381ec2c70338032278620b11d1fe205925534b24573952'
            'a94957b70240d1fdbd3215ca6a04b5b3fa5f5211a6c49a634eb16306dd0a416e'
            'ac52e466878aa6e60e51c0ec5d56667ece4a7d0b64972ce65f0cc70a43ad5a2b'
            '6a3f7e9b1780e70ab4dbcc8181f0dc7d1c1e9115e835a00a618e043158d291b5'
            '7a68828a7a12383411ba49c6c1343f34c07bf2d4edd6ee2b955cb70e694a4f90')
sha512sums=('cd707d4adaa6a6b606940370606fcef61a35af0d1f1108f24891d2f88611f4f2812c061d3b7a9540d4b6df882615a9366d39273184a791a911775e7c9f4402b8'
            'dfd2fb7fdd791394722bb75eb654e2bd485e152b3713957839b02c2fbf84dcf64617dfa2942f5c1fa328cb750b1302f64a48fdabf0ec2baafbca750be856c7a4'
            '4f443b5bc7a177b620fffc4a28198a418e529071f23d24cbd8f3751304318b76a0f9ea1c5d793bf7f163dffb2024a51f11934cf4ecb777d0d9658c094a9e6d20'
            'cb15ed133af39682d4ae827645643582d3235f5051041d712933cd4c68f9c59102744c4fc48fe9abdd984a4fea6080520bd51537ecd9474f3bf01456ae358d77'
            '6aa70136ec28037913ffda90b1c22968c1333601d77d6b61332d6055fa4b6862bc2c00ee4a932a39c23b6c0fb4416db4665efc600328c8c29520757967e59a64'
            'e9e8b4ce76e61525daf49f7a4253a74ed86192aeec53e4bdd35e5920d51166b8b985f6029ee6b40a400b4ee8f63e1eb62632651310b8543ad228658a6f49d81f'
            'aad6455e06caf6a0fb68c7661a8cfc7fc0350af11e27813d3d5e707fe514aeb2088beeb5a9dd7a71fefaaeea7d7792cc431c764bb29d3351985a2f7c7c7e45ae'
            '76d5d945fdfc3c9d5d687910bc013ed42ac8cbe059f2878942e3c1d05790f6144725f1db3d037722b2d182262990b06c5ef04f3eb44947f57b9d104270fb9393'
            '288a2a8bfcd2d6a5d2998e37ea394abcf13cfc6e7fffa78b51e278000bae0b3cf44f4501c1c66b25902ef316803500ab07576d8ee4584786ac36b951bd15c9d6'
            '32cc13231a7fd104b7b0fdf85f2454f2b99d3ae7f1d8b768e3554de1badb0c3370448754252f797a44df56af3e6641e352d29637a0fec5b58561a8c3976b97f8'
            '621ccbc4dc639739bf3b768da1502aa3086d48be556a73691ee5d08595e69e68b9875e993813a6bdf8cb600f8a0444653aa4c5a616165e2d73472702384ee2a3'
            '14033dae211892668ad460b28d3573f149f4fb295b74391ebfb442281c685a1e4180f3edc5af68a291209458aba7cf2784fa33e387c66af5516dbb3225b4178a'
            '8c118b83af7eb27e829ced64da3a2a2961d063663ea1cc7b69c205019dfa2e7bb59560d4ad000fbc3ef219a2548d377ec29aabf20413ea6ce0f4c832d85ff89d'
            '7b83dc29ec88512042c3083d274b13b557b2bb17497f01f3dce02b9120f497d579df3a5d41c270a2ab75b6f7de44a4be8b70dcab3313ea1d72e5e0452042a5f2'
            '6cbafe78012219d879bbc3573509a5415ef57ebcabf4350180958188881d087c027c4a5247e483a8340016f1977a46f7d0db5928fde4d4afffe2c31fffbba884'
            '13d9f6fd366d58f33b457b38e677f3bc0cd8276de01345763f96a84fde408ae7e73212c967b863682add4e2c93b0d6642c5215b49e229226dbc94654f03189e3')

export PBR_VERSION=$pkgver

prepare(){
	for i in "${source[@]}"
	do case "${i}" in
		?*.patch)
			msg2 "Apply patch ${i}"
			patch -Np1 <"${i}"
		;;
	esac
	done
}

build(){
	cd $_pyname-$pkgver
	export PYTHONPATH="${PWD}"
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

#check(){
#	cd $_pyname-$pkgver
#	export PYTHONPATH="${PWD}"
#	stestr run
#}

_package_pkg(){
	optdepends=(
		"python-openstackclient: OpenStack CLI Client"
		"${pkgbase}-doc: Documents for ${pkgdesc}"
	)
	backup=(
		etc/neutron/dhcp_agent.ini
		etc/neutron/l3_agent.ini
		etc/neutron/metadata_agent.ini
		etc/neutron/metering_agent.ini
		etc/neutron/neutron.conf
		etc/neutron/neutron_ovn_metadata_agent.ini
		etc/neutron/policy.yaml
		etc/neutron/policy.json
		etc/neutron/api-paste.ini
		etc/neutron/rootwrap.conf
		etc/neutron/plugins/ml2/linuxbridge_agent.ini
		etc/neutron/plugins/ml2/macvtap_agent.ini
		etc/neutron/plugins/ml2/ml2_conf.ini
		etc/neutron/plugins/ml2/openvswitch_agent.ini
		etc/neutron/plugins/ml2/sriov_agent.ini
		etc/neutron/rootwrap.d/privsep.filters
		etc/neutron/rootwrap.d/openvswitch-plugin.filters
		etc/neutron/rootwrap.d/linuxbridge-plugin.filters
		etc/neutron/rootwrap.d/l3.filters
		etc/neutron/rootwrap.d/iptables-firewall.filters
		etc/neutron/rootwrap.d/ipset-firewall.filters
		etc/neutron/rootwrap.d/ebtables.filters
		etc/neutron/rootwrap.d/dibbler.filters
		etc/neutron/rootwrap.d/dhcp.filters
		etc/neutron/rootwrap.d/debug.filters
	)
	cd $_pyname-$pkgver
	export PYTHONPATH=${PWD}
	_DATADIR="$pkgdir/usr/share"
	_CONFDIR="$pkgdir/etc"
	_DOCDIR="$_DATADIR/doc"
	DATADIR="$_DATADIR/$_pyname"
	DOCDIR="$_DOCDIR/$_pyname"
	LIBDIR="$pkgdir/usr/lib"
	CONFDIR="$_CONFDIR/$_pyname"
	python setup.py install --root "$pkgdir" --optimize=1
	mv "$pkgdir"{/usr,}/etc
	for i in "${source[@]}"
	do case "${i}" in
		?*.service)install -Dm644 "$srcdir/$i" "$pkgdir/usr/lib/systemd/system/$i"
	esac
	done
	for i in etc/oslo-config-generator/*;do oslo-config-generator --config-file="$i";echo "$i";done
	for i in etc/oslo-policy-generator/*;do oslopolicy-sample-generator --config-file="$i";echo "$i";done
	install -vDm644 ${srcdir}/neutron-dist.conf -t "$DATADIR"
	install -vDm644 ${srcdir}/sudoers.conf "$pkgdir"/etc/sudoers.d/$_pyname
	install -vDm644 ${srcdir}/tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$_pyname.conf
	install -vDm644 ${srcdir}/sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$_pyname.conf
	install -vDm644 etc/neutron/plugins/ml2/* -t "$CONFDIR/plugins/ml2"
	install -vDm644 etc/neutron/rootwrap.d/* -t "$CONFDIR/rootwrap.d"
	install -vDm644 etc/*.*.sample -t "$DATADIR"
	install -vDm644 etc/*.*.sample -t "$CONFDIR"
	install -vDm644 etc/rootwrap.conf -t "$DATADIR"
	install -vDm644 etc/api-paste.ini -t "$DATADIR"
	install -vDm644 etc/rootwrap.conf -t "$CONFDIR"
	install -vDm644 etc/api-paste.ini -t "$CONFDIR"
	mkdir -vp "$CONFDIR/conf.d/"{common,neutron-{server,{dhcp,l3,metadata,metering,linuxbridge,openvswitch}-agent,{linuxbridge,netns,ovs}-cleanup}}
	echo '{}' >"$CONFDIR/policy.json"
	for i in $(find "$CONFDIR" -name '*.*.sample')
	do mv -v "$i" "${i//.sample}"
	done
	chmod 0750 "$pkgdir"/etc/sudoers.d
	chmod 0440 "$pkgdir"/etc/sudoers.d/$_pyname
}

_package_doc(){
	pkgdesc="${pkgdesc} Documents"
	depends=()
	cd $_pyname-$pkgver
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
	rm -r "${pkgdir}/usr/share/doc/${pkgname}/.doctrees"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"

# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=neutron
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=18.0.0
pkgrel=1
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
)
checkdepends=(
	python-coverage
	python-fixtures
	python-subunit
	python-testtools
	python-testresources
	python-testscenarios
	python-webtest
	python-oslotest
	python-stestr
	python-reno
	python-ddt
	python-pymysql
)
source=(
	https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz
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
md5sums=('f478f4666d422f134b8fbb55bc762584'
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
         '83b6d257b171f9cb15245b14869026af')
sha256sums=('3a6e549a2f08f474dd66697f518742e02ac90b36e7fe29edffd33cec243e43e1'
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
            'cea7556a75189c9e77d8aa1ee134a198b008d542e7bce5368db09e88b927c111')
sha512sums=('8517ea11cc6be785ac2fa4962f058daf7b8b14da47e7e9525d4575fdefe0b14acead83d5746f737c5f0b24c14ba4b725f22c522b0ed2ba4bfd1c6b421c3be6c8'
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
            '22fcdb0df1b7449e01371fdf3b5906e1a53e4a1150958ad7dd56ab59608ca71aca41bd7b5f53b5e6a0bd91878efb541e70cb73c99dd367a6c190df0bbff8a35a')

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
		etc/neutron/rootwrap.d/ipset-firewall.filters
		etc/neutron/rootwrap.d/dibbler.filters
		etc/neutron/rootwrap.d/dhcp.filters
		etc/neutron/rootwrap.d/debug.filters
		etc/sudoers.d/neutron
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

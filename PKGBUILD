# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=cinder
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=18.0.0
pkgrel=1
pkgdesc="OpenStack Block Storage"
arch=(any)
url="https://docs.openstack.org/cinder/latest/"
license=(Apache)
depends=(
	qemu
	lvm2
	python
	python-pbr
	python-decorator
	python-eventlet
	python-greenlet
	python-httplib2
	python-iso8601
	python-jsonschema
	python-keystoneauth1
	python-keystonemiddleware
	python-lxml
	python-oauth2client
	python-oslo-config
	python-oslo-concurrency
	python-oslo-context
	python-oslo-db
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
	python-oslo-i18n
	python-oslo-vmware
	python-osprofiler
	python-packaging
	python-paramiko
	python-paste
	python-pastedeploy
	python-psutil
	python-pyparsing
	python-barbicanclient
	python-glanceclient
	python-keystoneclient
	python-novaclient
	python-swiftclient
	python-pytz
	python-requests
	python-routes
	python-taskflow
	python-rtslib-fb
	python-six
	python-sqlalchemy
	python-sqlalchemy-migrate
	python-stevedore
	python-tabulate
	python-tenacity
	python-webob
	python-os-brick
	python-os-win
	python-tooz
	python-google-api-python-client
	python-castellan
	python-cryptography
	python-cursive
	python-zstd
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-reno
	python-sphinx
	python-os-api-ref
	python-sphinxcontrib-apidoc
	python-sphinx-feature-classification
)
checkdepends=(
	python-hacking
	python-flake8-import-order
	python-flake8-logging-format
	python-stestr
	python-coverage
	python-ddt
	python-fixtures
	python-oslotest
	python-pymysql
	python-psycopg2
	python-sqlalchemy-utils
	python-testtools
	bandit
	python-doc8
	python-reno
	python-pygments
)
conflicts=(python-nova)
source=(
	"https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
	sudoers.conf
	sysusers.conf
	tmpfiles.conf
	cinder-dist.conf
	openstack-cinder-api.service
	openstack-cinder-backup.service
	openstack-cinder-scheduler.service
	openstack-cinder-volume.service
	0000-fix-tests-assertItemsEqual.patch
)
md5sums=('1c9edfa61b7eef91a8163dbf124673c8'
         '081d18c05b770876e42a7d2c5d7c6369'
         'fac52361ddb959f0000f94f27cfa9a52'
         '619a108ed34a4007dcceb5736b9f9333'
         'a5e4eb0cdaef7d8bf9c132e2d17e48bf'
         'a1011c447500e77edd7179b1c28fcd3a'
         '266e5867fa92d49c7a1894242f1d5f89'
         'bdd1383229c0f41fcbe82314a54a0087'
         '0f920ebfb231a55becbae65a4cfac61f'
         '9c5f1cd2f3f859ba26f65c469c99e413')
sha256sums=('ebb6f9da205f11c27ae434d73f4ad7ccc3c8ba120de1f74e43d958a896579850'
            '2c25a5fd7f6b442d23516d63d99dfbe506f8b55d6161a31d6611511345040f5c'
            'dbd32daa64f08bb97a86ad42ea41e05bc2ca36b1c599b60bed80c3def9f79486'
            '494978135a165a725de2c55e84a5dbdbf4487348acdcbb8b94edf067cf8e403d'
            '5d212f43251bb85612df20bb02c869e08313d6c8e2d91193ce442f5cfe1a0d20'
            'ec073ef7c3723612ae6ffd2f085f55536b05dac86a848bacd81a8bfed5ce8fea'
            'dadf618111c437e2edf1231b9e8a807081f7ace7ad97041e31c105a3af020272'
            '16ddcefde9a537a4d138252d467df733b70b19d7b063a3d3db2bd6c0b5cffd13'
            'fd340cb5a437567c66293d486511e9a56fa3a33f8dd39788256923c7d36dc206'
            '630dadfa9063ed95440ee218ee8794dcd5db17ec4f8ea8bbae404d2dd88e4d24')
sha512sums=('acc1c93ab5b41747d6d4162612f8f8339d33f39a2bc49a51d3475813c7b38476232f5481ed481a3d05c872d8930f9dec490e84b905e3d493143cab9de365c536'
            'b41cb64358fca6f5c27a17052233d41a3ab42beb74bb25a614b75645feb59e70d0adddf4eeeb5e6479cc61b6e18550452237899bed2d3892d5065e424d0cd5c0'
            '73ef8c60fe8152614f20033102b1ac7cd88afafdca5104178f208647041730079d51402ea6f97893b6e0012d11354d78d5c521d81a72d6cc8295ef595b15a710'
            '7fdb14679166b82058c11452c1b1c2c8ed198ae116e6fae18d1a78be2b27ba7a6beb091d77ebfcf2f2db1934185b027fc14219dcd2261a29d8d522e10f109218'
            '14b9784a6b63a3c8048ce995a220783c6c137d447358efb24410c16104d45a76d888acac1d1afaafc2fd91edc84bc752f4787eb818cf0ca12d225a0470a6b806'
            '30c382d26003eb05ff29b6dd7563730392369e06b6db0f50b7baa13704e4a1a90260c3f4f654f92de8989d8c1ab5d7450fd96692ad54ea96d84e3227a2c72827'
            '026621bdbca5a7a7edbb446386f4da5d49df04b5def18e5bf49b0c4d757c51f26b2c92ef6146b5ad7a5a6ea05f595e3bc63cbb1363992faba9e8275c35998323'
            'a97ae6153d22a13702ea47674f5a6feb9f2200e63410e28325a0f4689300beaf68cfeceec71220763269fa4ff188a48e5c5fbbab1530e97f4632f6315c4a5a17'
            'e52b76b0c9ca1d9db4dd78d75b3404751bd5b09c52838d1b43a8218bad86a347fd1d5c4d3d0e0e502209fd0ad577b4575e3da5a624fa8270760ff550f59cee7d'
            'e199be3e1cc8e272a1f2a989778e6e440b7827068cd8fc7072a7c3d54a5cb1e41b3787e5965ecb2231dc03b20d72fc0ebed8d3243f1973c40fc51b6978f91365')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	export PYTHONPATH="${PWD}"
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pyname-$pkgver
	export PYTHONPATH="${PWD}"
	#stestr run
}

_package_pkg(){
	optdepends=(
		"python-openstackclient: OpenStack CLI Client"
		"${pkgbase}-doc: Documents for ${pkgdesc}"
		"python-3parclient: For HPE 3PAR"
		"python-krest: For Kaminario"
		"python-purestorage: For Pure Storage"
		"python-pyopenssl: For Dell EMC VMAX, IBM DS8K"
		"python-lefthandclient: For HPE Lefthand"
		"python-pywbem: For Fujitsu Eternus DX"
		"python-pyxcli: For IBM XIV"
		"python-rados: For RBD"
		"python-rbd: For RBD"
		"python-storops: For Dell EMC VNX and Unity"
		"python-infinisdk: For INFINIDAT"
		"python-capacity: For INFINIDAT"
		"python-infi-dtypes-wwn: For INFINIDAT"
		"python-infi-dtypes-iqn: For INFINIDAT"
		"python-storpool: For Storpool"
		"python-storpool-spopenstack: For Storpool"
		"python-dfs-sdk: For Datera"
	)
	backup=(
		etc/cinder/cinder.conf
		etc/cinder/api-paste.ini
		etc/cinder/cinder.conf
		etc/cinder/policy.yaml
		etc/cinder/resource_filters.json
		etc/cinder/rootwrap.conf
		etc/cinder/rootwrap.d/volume.filters
	)
	cd "$_pyname-$pkgver"
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
	install -vDm644 "$srcdir/sudoers.conf" "$pkgdir/etc/sudoers.d/$_pyname"
	install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pyname.conf"
	install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pyname.conf"
	oslo-config-generator --config-file=tools/config/cinder-config-generator.conf
	oslopolicy-sample-generator --config-file=tools/config/cinder-policy-generator.conf
	install -vDm644 "etc/$_pyname/rootwrap.conf" -t "$CONFDIR"
	install -vDm644 "etc/$_pyname/rootwrap.conf" -t "$DATADIR"
	install -vDm644 "etc/$_pyname/"*.*.sample -t "$CONFDIR"
	install -vDm644 "etc/$_pyname/"*.*.sample -t "$DATADIR"
	for i in "$CONFDIR/"*.*.sample
	do mv -v "$i" "${i//.sample}"
	done
	chmod 0750 "$pkgdir/etc/sudoers.d"
	chmod 0440 "$pkgdir/etc/sudoers.d/"*
	find "$pkgdir" -name 'README*' -exec rm -f {} \;
}

_package_doc(){
	pkgdesc="${pkgdesc} Documents"
	depends=()
	cd $_pyname-$pkgver
	DOCDIR="$pkgdir/usr/share/doc"
	mkdir -p "$DOCDIR"
	cp -r doc/build/html "$DOCDIR/${pkgname}"
	rm -r "$DOCDIR/${pkgname}/.doctrees"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"

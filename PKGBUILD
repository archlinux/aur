# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=nova
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=23.0.0
pkgrel=1
pkgdesc="Cloud computing fabric controller"
arch=(any)
url="https://docs.openstack.org/nova/latest/"
license=(Apache)
depends=(
	libffi
	libxml2
	libxslt
	openssh
	openssl
	pcre
	lsscsi
	libvirt
	libvirt-python
	qemu-headless
	novnc
	python
	python-pbr
	python-sqlalchemy
	python-decorator
	python-eventlet
	python-jinja
	python-keystonemiddleware
	python-lxml
	python-routes
	python-cryptography
	python-webob
	python-greenlet
	python-pastedeploy
	python-paste
	python-prettytable
	python-sqlalchemy-migrate
	python-netaddr
	python-netifaces
	python-paramiko
	python-iso8601
	python-jsonschema
	python-cinderclient
	python-keystoneauth1
	python-neutronclient
	python-glanceclient
	python-requests
	python-six
	python-stevedore
	python-websockify
	python-oslo-cache
	python-oslo-concurrency
	python-oslo-config
	python-oslo-context
	python-oslo-log
	python-oslo-reports
	python-oslo-serialization
	python-oslo-upgradecheck
	python-oslo-utils
	python-oslo-db
	python-oslo-rootwrap
	python-oslo-messaging
	python-oslo-policy
	python-oslo-privsep
	python-oslo-i18n
	python-oslo-service
	python-rfc3986
	python-oslo-middleware
	python-psutil
	python-oslo-versionedobjects
	python-os-brick
	python-os-resource-classes
	python-os-traits
	python-os-vif
	python-os-win
	python-castellan
	python-microversion-parse
	python-os-xenapi
	python-tooz
	python-cursive
	python-pypowervm
	python-retrying
	python-os-service-types
	python-taskflow
	python-dateutil
	python-zvmcloudconnector
	python-futurist
	python-openstacksdk
	python-pyaml
	python-pymysql
)
makedepends=(
	python-setuptools
	python-sphinx
	python-sphinxcontrib-actdiag
	python-sphinxcontrib-seqdiag
	python-sphinxcontrib-svg2pdfconverter
	python-sphinx-feature-classification
	python-os-api-ref
	python-openstackdocstheme
	python-reno
	python-whereto
	python-osprofiler
)
checkdepends=(
	python-hacking
	python-mypy
	python-coverage
	python-ddt
	python-fixtures
	python-mock
	python-psycopg2
	python-barbicanclient
	python-ironicclient
	python-requests-mock
	python-oslotest
	python-stestr
	python-osprofiler
	python-testresources
	python-testscenarios
	python-testtools
	bandit
	python-gabbi
	python-wsgi-intercept
	python-oslo-vmware
)
conflicts=(python-nova)
source=(
	"https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
	openstack-nova-api.service
	openstack-nova-compute.service
	openstack-nova-conductor.service
	openstack-nova-metadata-api.service
	openstack-nova-novncproxy.service
	openstack-nova-os-compute-api.service
	openstack-nova-scheduler.service
	sudoers.conf
	sysusers.conf
	tmpfiles.conf
)
md5sums=('049dde8907622ae7dfa15bcca42c6a05'
         '3f26a8660462ae32a683ad79ef733b79'
         'c1d03d4898525c76d02f3b291ec46e21'
         '3fa4675ec19fe27b37ee571961d54407'
         'febf170acc9605cacfc71a38c4b22825'
         '9dbc29e1a098cce899a80db4c70135af'
         '4c111886b0d64b5983d5f03b49e4dd9f'
         'de818eb31a86aaf4ae47bbf49a011a21'
         '063c88893366f685c380fae0aa678b15'
         'fdc38aa4d35b511165091aac88c6614d'
         '7e4af4b03bf0ac69b3a657b6642ae5bb')
sha256sums=('9a4143021eeb8a4b98786b613d8db44e95414b1b6b1d6e79ee5b082db63694db'
            'ccee044c78f73566662b46ae1d2837b34fa998e607a5b965dff85c5042eb21de'
            '14c3724e55fa7d094cc95c334d564c5b2276d73bbf3771de6fa2c8acaab9f71b'
            '2cd6e2275d437297d6c2706cd6c1ccc38b4d2788da21ff1c82b2ce5597235c39'
            'ef97d04c437367066261934babe31629240ec0b66929a2e32091e9fd0e13c0e7'
            'd23df8531a2d395797a21c6f1a523b0d707ae45a098ab1500025c3ed7eb23b17'
            'b4634822f93365a3a3b4133fe51698e307383936d8270a9e07a0e5cfb433db05'
            '5b6276b3480d30fc402a980e073e437fd81818cc024d1a04192bc6239177ad9d'
            'a8101096ca72a2f70d003c54b3339d16697315380795d657134cf9c02388a49f'
            'ed64bd90f87a3c41ed57e8fea77055d9df85ed6229bd3f75d74627c42322eb4c'
            '46ac6ef1d5b31996e3cfb4ec3647acbdc056efd01a91ff0d757f5fd8f4f8637d')
sha512sums=('7c7bda93742a7975011094956b9cd3e8b8660c7bed51a83dbd3fb371f1a336de67efa7abfd5f0858e1580bbcac05d9390afeb56ccad002fe6d6e4cfd71c31d8f'
            'bcd6c94e9d882528b4883fa947822e6dbea6ca8b438815556471f54f8f5bd8b413f0906d4cc210a85891fef09846972689d7d4c25ed1ae8a582fd413c22c4820'
            'df839698bf257be1de5ed667c1c8f3c53c9384e549edc79b0988edae366ea6c10aff96ca9bbfb272852f5dd2348fbf1ea95c610ef261a771e8e6ca42b3448abc'
            'e091ac769761211bcd7e864802f762c34012e9f539b5b629a70a69bfc784023500ad64486fa9b0a896204b9f7c5daf2a48547d341b7bc6efd78512f3c7541574'
            '6d7d0b51b138304eb0809c79be88e8bdc6890cd24c16ef5f88fe7620b4cdf9bf7143407964cdca94536a17714a0f605aa12557243b02b7fbea104592107bc053'
            '093d8db5544b7baf1522098d73ffa55f36bd3a75c49db5643027bcea999aad32b9b97840bf979fd42f5fa2609a0e5b0a5188bf3c43f8298fcca88205d461dc3b'
            '46faac9c58576a6c658a177ab0d567aa8945ce0ca170ac639f4565dc23c694b93e532da51d7a220a5fa964d6334af008b0bb1c5fd49dc2a6cd74d0e17ed8c46d'
            '3e0671510a19f700f75d5d0efc98ae49a1616984f0abbadf19c0f9732bce6700b5fde436933a90906426877a2c52fcdb1c0b643f97781df8169808847388e850'
            'b2351829821824724106663a64e1237c01cec99ea5c503e92611fcceb32a1c10e85c59fee020a75e05748a8a82d89e08edaeb8f62a52843673dd59e5cfb4f6c4'
            '77a3849f4604fdb4293dbaf7341f9dab62b6e2df82eeab5baa728ed5ae9b3d0ac73f4fd924aee2271d6696ba5c26a50ff21f2a2a452515b8a4a2c12e9fd6a7e9'
            '1ba67c1ef08878dd25db648f80a1aefe73f07e283b18132ec18814176e2e27b67dbc264d0904bcb3df06d4fcc7f2945bd23306e7742a19a6ddb945b3627cb0f6')

export PBR_VERSION=$pkgver

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
		etc/nova/api-paste.ini
		etc/nova/logging_sample.conf
		etc/nova/nova.conf
		etc/nova/policy.yaml
		etc/nova/rootwrap.conf
		etc/nova/rootwrap.d/compute.filters
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
	install -vDm644 "$srcdir/sudoers.conf" "$pkgdir/etc/sudoers.d/$_pyname"
	install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pyname.conf"
	install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pyname.conf"
	oslo-config-generator --config-file=etc/nova/nova-config-generator.conf
	oslopolicy-sample-generator --config-file=etc/nova/nova-policy-generator.conf
	install -vDm644 "etc/$_pyname/rootwrap.conf" -t "$CONFDIR"
	install -vDm644 "etc/$_pyname/rootwrap.conf" -t "$DATADIR"
	install -vDm644 "etc/$_pyname/api-paste.ini" -t "$CONFDIR"
	install -vDm644 "etc/$_pyname/api-paste.ini" -t "$DATADIR"
	install -vDm644 "etc/$_pyname/logging_sample.conf" -t "$CONFDIR"
	install -vDm644 "etc/$_pyname/logging_sample.conf" -t "$DATADIR"
	install -vDm644 "etc/$_pyname/rootwrap.d/compute.filters" -t "$CONFDIR/rootwrap.d"
	install -vDm644 "etc/$_pyname/"*.*.sample -t "$CONFDIR"
	install -vDm644 "etc/$_pyname/"*.*.sample -t "$DATADIR"
	for i in "$CONFDIR/"*.*.sample
	do mv -v "$i" "${i//.sample}"
	done
	chmod 0750 "$pkgdir/etc/sudoers.d"
	chmod 0440 "$pkgdir/etc/sudoers.d/"*
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

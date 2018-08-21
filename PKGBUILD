# Maintainer : Michael Manley <mmanley@nasutek.com>
# Maintainer : Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

pkgname=asterisk-cisco-gvsip
pkgver=13.21.1
pkgrel=1
pkgdesc="A complete PBX solution. Includes the Cisco Presence patch for use with Cisco IP Phones. Also includes Google Voice SIP Patches"
provides=('asterisk')
conflicts=('asterisk')
arch=('i686' 'x86_64')
backup=('etc/asterisk/acl.conf'
	'etc/asterisk/adsi.conf'
	'etc/asterisk/agents.conf'
	'etc/asterisk/alarmreceiver.conf'
	'etc/asterisk/alsa.conf'
	'etc/asterisk/amd.conf'
	'etc/asterisk/app_mysql.conf'
	'etc/asterisk/app_skel.conf'
	'etc/asterisk/ari.conf'
	'etc/asterisk/asterisk.adsi'
	'etc/asterisk/asterisk.conf'
	'etc/asterisk/calendar.conf'
	'etc/asterisk/ccss.conf'
	'etc/asterisk/cdr.conf'
	'etc/asterisk/cdr_adaptive_odbc.conf'
	'etc/asterisk/cdr_custom.conf'
	'etc/asterisk/cdr_manager.conf'
	'etc/asterisk/cdr_mysql.conf'
	'etc/asterisk/cdr_odbc.conf'
	'etc/asterisk/cdr_pgsql.conf'
	'etc/asterisk/cdr_sqlite3_custom.conf'
	'etc/asterisk/cdr_syslog.conf'
	'etc/asterisk/cdr_tds.conf'
	'etc/asterisk/cel.conf'
	'etc/asterisk/cel_custom.conf'
	'etc/asterisk/cel_odbc.conf'
	'etc/asterisk/cel_pgsql.conf'
	'etc/asterisk/cel_sqlite3_custom.conf'
	'etc/asterisk/cel_tds.conf'
	'etc/asterisk/chan_dahdi.conf'
	'etc/asterisk/chan_mobile.conf'
	'etc/asterisk/cli.conf'
	'etc/asterisk/cli_aliases.conf'
	'etc/asterisk/cli_permissions.conf'
	'etc/asterisk/codecs.conf'
	'etc/asterisk/confbridge.conf'
	'etc/asterisk/config_test.conf'
	'etc/asterisk/console.conf'
	'etc/asterisk/dbsep.conf'
	'etc/asterisk/dnsmgr.conf'
	'etc/asterisk/dsp.conf'
	'etc/asterisk/dundi.conf'
	'etc/asterisk/enum.conf'
	'etc/asterisk/extconfig.conf'
	'etc/asterisk/extensions.ael'
	'etc/asterisk/extensions.conf'
	'etc/asterisk/extensions.lua'
	'etc/asterisk/extensions_minivm.conf'
	'etc/asterisk/features.conf'
	'etc/asterisk/festival.conf'
	'etc/asterisk/followme.conf'
	'etc/asterisk/func_odbc.conf'
	'etc/asterisk/hep.conf'
	'etc/asterisk/http.conf'
	'etc/asterisk/iax.conf'
	'etc/asterisk/iaxprov.conf'
	'etc/asterisk/indications.conf'
	'etc/asterisk/logger.conf'
	'etc/asterisk/manager.conf'
	'etc/asterisk/meetme.conf'
	'etc/asterisk/mgcp.conf'
	'etc/asterisk/minivm.conf'
	'etc/asterisk/misdn.conf'
	'etc/asterisk/modules.conf'
	'etc/asterisk/motif.conf'
	'etc/asterisk/musiconhold.conf'
	'etc/asterisk/muted.conf'
	'etc/asterisk/ooh323.conf'
	'etc/asterisk/osp.conf'
	'etc/asterisk/oss.conf'
	'etc/asterisk/phone.conf'
	'etc/asterisk/phoneprov.conf'
	'etc/asterisk/pjsip.conf'
	'etc/asterisk/pjsip_notify.conf'
	'etc/asterisk/pjsip_wizard.conf'
	'etc/asterisk/queuerules.conf'
	'etc/asterisk/queues.conf'
	'etc/asterisk/res_config_mysql.conf'
	'etc/asterisk/res_config_sqlite.conf'
	'etc/asterisk/res_config_sqlite3.conf'
	'etc/asterisk/res_corosync.conf'
	'etc/asterisk/res_curl.conf'
	'etc/asterisk/res_fax.conf'
	'etc/asterisk/res_ldap.conf'
	'etc/asterisk/res_odbc.conf'
	'etc/asterisk/res_parking.conf'
	'etc/asterisk/res_pgsql.conf'
	'etc/asterisk/res_pktccops.conf'
	'etc/asterisk/res_snmp.conf'
	'etc/asterisk/res_stun_monitor.conf'
	'etc/asterisk/rtp.conf'
	'etc/asterisk/say.conf'
	'etc/asterisk/sip.conf'
	'etc/asterisk/sip_notify.conf'
	'etc/asterisk/skinny.conf'
	'etc/asterisk/sla.conf'
	'etc/asterisk/smdi.conf'
	'etc/asterisk/sorcery.conf'
	'etc/asterisk/ss7.timers'
	'etc/asterisk/stasis.conf'
	'etc/asterisk/statsd.conf'
	'etc/asterisk/telcordia-1.adsi'
	'etc/asterisk/test_sorcery.conf'
	'etc/asterisk/udptl.conf'
	'etc/asterisk/unistim.conf'
	'etc/asterisk/users.conf'
	'etc/asterisk/voicemail.conf'
	'etc/asterisk/vpb.conf'
	'etc/asterisk/xmpp.conf')
url="http://www.asterisk.org"
license=('GPL')
depends=('alsa-lib' 'speex' 'popt' 'libvorbis' 'curl' 'libxml2' 'jansson' 'libxslt' 'openssl')
makedepends=('sqlite3' 'gsm')
optdepends=('lua51' 'libsrtp' 'postgresql' 'unixodbc' 'iksemel' 'dahdi')
source=(http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-${pkgver}.tar.gz \
	https://issues.asterisk.org/jira/secure/attachment/57644/cisco-usecallmanager-13.21.1.patch \
	https://issues.asterisk.org/jira/secure/attachment/55770/DialTemplate.xml \
	https://issues.asterisk.org/jira/secure/attachment/55771/FeaturePolicy.xml \
	https://issues.asterisk.org/jira/secure/attachment/57258/SEPMAC.cnf.xml \
	https://issues.asterisk.org/jira/secure/attachment/55769/SoftKeys.xml \
	https://issues.asterisk.org/jira/secure/attachment/55772/AppDialRules.xml \
	asterisk.service \
	asterisk.logrotated \
    gvsip.patch \
	asterisk.tmpfile)
install=asterisk.install
sha256sums=('013f61155bb53c14c8244d8d4779df931fa4a139895d7a420db99c5f339024df'
            '3355f7abc9af1e63ae4fbf405407ba417955078caf5cbcb292c71ebd421d4720'
            '10795bc3b2fb28b79b3ab74bbd8f33b667e3bf4b1c87ccfb2aae168f9b07a17c'
            'da5a87717517b37d0554369235e0bdb86700bd696c1a70db5a47d9f4711b44db'
            'ecff1e7807003beb3198f95859fa3c1b57d618940872d1c8638e65f5a49afce4'
            'f75707ccd176ae1223f80a1c02fdebafbd0bce3e5ec12667e6e061b0427bb075'
            'c1243a3459b0d43020f9644fa2a2a6c9003a7bd51927715d626dc4060c234818'
            '94acb6e68424195a12fd9d406b3fb586f264a550e75801f6e020a86e800dd42c'
            'caa24cfec5c6b4f8cea385269e39557362acad7e2a552994c3bc24080e3bdd4e'
            '0d4faa71894338d9c522c3b722214b10854de1836f0c634d4776cbeac63468c0'
            '673c0c55bce8068c297f9cdd389402c2d5d5a25e2cf84732cb071198bd6fa78a')

prepare() {
  cd ${srcdir}/asterisk-${pkgver}
  patch -p1 -i "${srcdir}/cisco-usecallmanager-${pkgver}.patch"
  patch -p1 -i "${srcdir}/gvsip.patch"
}

build() {
  cd ${srcdir}/asterisk-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --with-pjproject-bundled --with-ssl
  make
}

package(){
  cd ${srcdir}/asterisk-${pkgver}
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} samples
  
  sed -i -e "s/\/var\/run/\/run/" ${pkgdir}/etc/asterisk/asterisk.conf

  mkdir -p ${pkgdir}/usr/share/doc/asterisk/examples
  mkdir -p ${pkgdir}/usr/share/doc/asterisk/cisco/examples

  for i in ${pkgdir}/etc/asterisk/*; do install -D -m 644 $i ${pkgdir}/usr/share/doc/asterisk/examples/; done
  
  mv ${pkgdir}/var/run ${pkgdir}

  install -D -m 644 ${srcdir}/DialTemplate.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/DialTemplate.xml
  install -D -m 644 ${srcdir}/FeaturePolicy.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/FeaturePolicy.xml
  install -D -m 644 ${srcdir}/SEPMAC.cnf.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/SEPMAC.cnf.xml
  install -D -m 644 ${srcdir}/SoftKeys.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/SoftKeys.xml
  install -D -m 644 ${srcdir}/AppDialRules.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/AppDialRules.xml
  install -D -m 644 ${srcdir}/asterisk.logrotated ${pkgdir}/etc/logrotate.d/asterisk
  install -D -m 644 ${srcdir}/asterisk.service ${pkgdir}/usr/lib/systemd/system/asterisk.service
  install -D -m 644 ${srcdir}/asterisk.tmpfile ${pkgdir}/usr/lib/tmpfiles.d/asterisk.conf
 }

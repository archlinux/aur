# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

pkgname=asterisk
pkgver=16.1.0
pkgrel=1
pkgdesc="A complete PBX solution"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
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
url='http://www.asterisk.org'
license=('GPL')
depends=('alsa-lib' 'speex' 'popt' 'libvorbis' 'curl' 'libxml2' 'jansson' 'libxslt' 'opus' 'libedit')
makedepends=('sqlite3' 'gsm')
optdepends=('lua51' 'libsrtp' 'postgresql' 'unixodbc' 'libpri' 'libss7' 'openr2' 'iksemel' 'radiusclient-ng' 'dahdi')
install=${pkgname}.install
source=("https://downloads.asterisk.org/pub/telephony/asterisk/releases/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.logrotated"
        "${pkgname}.tmpfile")
sha256sums=('d19e25ccc822e7f7825de96b7b9cf26d85cb3888edf61d8d12a724240758dedf'
            'fc2e42f79e1672cc25b9b8ad2ba99616fbba0047641c986d30718655d0e7d4d8'
            'caa24cfec5c6b4f8cea385269e39557362acad7e2a552994c3bc24080e3bdd4e'
            '673c0c55bce8068c297f9cdd389402c2d5d5a25e2cf84732cb071198bd6fa78a')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  make
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} samples

  sed -i -e "s/\/var\/run/\/run/" ${pkgdir}/etc/asterisk/asterisk.conf

  mkdir -p ${pkgdir}/usr/share/doc/asterisk/examples
  for i in ${pkgdir}/etc/asterisk/*; do install -D -m 644 $i ${pkgdir}/usr/share/doc/asterisk/examples/; done

  mv ${pkgdir}/var/run ${pkgdir}

  install -D -m 644 ${srcdir}/${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/asterisk.conf
  install -D -m 644 ${srcdir}/${pkgname}.logrotated ${pkgdir}/etc/logrotate.d/asterisk
  install -D -m 644 ${srcdir}/${pkgname}.tmpfile ${pkgdir}/usr/lib/tmpfiles.d/asterisk.conf

  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/contrib/systemd/asterisk.service ${pkgdir}/usr/lib/systemd/system/asterisk.service
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/contrib/systemd/asterisk.socket ${pkgdir}/usr/lib/systemd/system/asterisk.socket
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/contrib/systemd/asterisk-ami.socket ${pkgdir}/usr/lib/systemd/system/asterisk-ami.socket
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/contrib/systemd/asterisk-amis.socket ${pkgdir}/usr/lib/systemd/system/asterisk-amis.socket
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/contrib/systemd/asterisk-cli.socket ${pkgdir}/usr/lib/systemd/system/asterisk-cli.socket
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/contrib/systemd/asterisk-http.socket ${pkgdir}/usr/lib/systemd/system/asterisk-http.socket
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/contrib/systemd/asterisk-https.socket ${pkgdir}/usr/lib/systemd/system/asterisk-https.socket
 }

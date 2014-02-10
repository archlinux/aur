# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=openldap-migrationtools
_origname=MigrationTools
pkgver=47
pkgrel=2
pkgdesc="A set of scripts for migrating data from local files (i.e. /etc/passwd) or a NIS domain to an LDAP directory."
url="http://www.padl.com/OSS/MigrationTools.html"
backup=()
depends=('openldap')
arch=('i686' 'x86_64')
license=BSD
groups=('openldap' 'openldap-beta')
source=(http://www.padl.com/download/MigrationTools-47.tar.gz migration-tools.txt)
md5sums=('3faf83eb8482e55979bda47f1d1e6501' '26d5015291ad33bd4867086d4bfcdc20')

build() {
	cd $startdir/src/$_origname-${pkgver}

	mkdir -p $startdir/pkg/usr/share/openldap/migration

	install -D -m644 -o0 -g0 CVSVersionInfo.txt $startdir/pkg/usr/share/openldap/migration/CVSVersionInfo.txt
	install -D -m644 -o0 -g0 README $startdir/pkg/usr/share/openldap/migration/README
	install -D -m644 -o0 -g0 $startdir/src/migration-tools.txt $startdir/pkg/usr/share/openldap/migration/migration-tools.txt
	install -D -m755 -o0 -g0 migrate_aliases.pl $startdir/pkg/usr/share/openldap/migration/migrate_aliases.pl
	install -D -m755 -o0 -g0 migrate_all_netinfo_offline.sh $startdir/pkg/usr/share/openldap/migration/migrate_all_netinfo_offline.sh
	install -D -m755 -o0 -g0 migrate_all_netinfo_online.sh $startdir/pkg/usr/share/openldap/migration/migrate_all_netinfo_online.sh
	install -D -m755 -o0 -g0 migrate_all_nis_offline.sh $startdir/pkg/usr/share/openldap/migration/migrate_all_nis_offline.sh
	install -D -m755 -o0 -g0 migrate_all_nis_online.sh $startdir/pkg/usr/share/openldap/migration/migrate_all_nis_online.sh
	install -D -m755 -o0 -g0 migrate_all_nisplus_offline.sh $startdir/pkg/usr/share/openldap/migration/migrate_all_nisplus_offline.sh
	install -D -m755 -o0 -g0 migrate_all_nisplus_online.sh $startdir/pkg/usr/share/openldap/migration/migrate_all_nisplus_online.sh
	install -D -m755 -o0 -g0 migrate_all_offline.sh $startdir/pkg/usr/share/openldap/migration/migrate_all_offline.sh
	install -D -m755 -o0 -g0 migrate_all_online.sh $startdir/pkg/usr/share/openldap/migration/migrate_all_online.sh
	install -D -m755 -o0 -g0 migrate_automount.pl $startdir/pkg/usr/share/openldap/migration/migrate_automount.pl
	install -D -m755 -o0 -g0 migrate_base.pl $startdir/pkg/usr/share/openldap/migration/migrate_base.pl
	install -D -m755 -o0 -g0 migrate_common.ph $startdir/pkg/usr/share/openldap/migration/migrate_common.ph
	install -D -m755 -o0 -g0 migrate_fstab.pl $startdir/pkg/usr/share/openldap/migration/migrate_fstab.pl
	install -D -m755 -o0 -g0 migrate_group.pl $startdir/pkg/usr/share/openldap/migration/migrate_group.pl
	install -D -m755 -o0 -g0 migrate_hosts.pl $startdir/pkg/usr/share/openldap/migration/migrate_hosts.pl
	install -D -m755 -o0 -g0 migrate_netgroup.pl $startdir/pkg/usr/share/openldap/migration/migrate_netgroup.pl
	install -D -m755 -o0 -g0 migrate_netgroup_byhost.pl $startdir/pkg/usr/share/openldap/migration/migrate_netgroup_byhost.pl
	install -D -m755 -o0 -g0 migrate_netgroup_byuser.pl $startdir/pkg/usr/share/openldap/migration/migrate_netgroup_byuser.pl
	install -D -m755 -o0 -g0 migrate_networks.pl $startdir/pkg/usr/share/openldap/migration/migrate_networks.pl
	install -D -m755 -o0 -g0 migrate_passwd.pl $startdir/pkg/usr/share/openldap/migration/migrate_passwd.pl
	install -D -m755 -o0 -g0 migrate_profile.pl $startdir/pkg/usr/share/openldap/migration/migrate_profile.pl
	install -D -m755 -o0 -g0 migrate_protocols.pl $startdir/pkg/usr/share/openldap/migration/migrate_protocols.pl
	install -D -m755 -o0 -g0 migrate_rpc.pl $startdir/pkg/usr/share/openldap/migration/migrate_rpc.pl
	install -D -m755 -o0 -g0 migrate_services.pl $startdir/pkg/usr/share/openldap/migration/migrate_services.pl
	install -D -m755 -o0 -g0 migrate_slapd_conf.pl $startdir/pkg/usr/share/openldap/migration/migrate_slapd_conf.pl
}

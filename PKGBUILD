# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=realmd
pkgver=0.16.3
pkgrel=2
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
optdepends=('sssd: Active Directory, FreeIPA, LDAP client'
            'samba: traditional Active Directory client')
makedepends=(docbook-xsl git intltool python xmlto)
source=("https://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz"
        "https://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz.sig"
	0001-Add-missing-xsl-file-to-Makefile.am.patch
	0001-doc-make-sure-cross-reference-ids-are-predictable.patch
	0001-Find-NetBIOS-name-in-keytab-while-leaving.patch
	0001-Fix-issues-found-by-Coverity.patch
	0001-Fix-man-page-reference-in-systemd-service-file.patch
	0001-IPA-do-not-call-sssd-enable-logins.patch
	0001-Kerberos-fall-back-to-tcp-SRV-lookup.patch
	0001-LDAP-don-t-close-LDAP-socket-twice.patch
	0001-Remove-support-for-deprecated-gtester-format.patch
	0001-service-Add-nss-and-pam-sssd.conf-services-after-joi.patch
	0001-service-Add-pam-and-nss-services-in-realm_sssd_confi.patch
	0001-Set-NEWEST-flag-when-resolving-packages-with-Package.patch
	0001-switch-to-authselect.patch
	0001-tests-ignore-order-in-test_update_domain.patch
	0001-tests-run-tests-with-python3.patch
	0001-Use-current-idmap-options-for-smb.conf.patch
	0002-Change-qualified-names-default-for-IPA.patch
	0002-configure-do-not-inherit-DISTRO-from-the-environment.patch
	0002-tools-remove-duplicated-va_start.patch
	0003-discover-try-to-get-domain-name-from-hostname.patch
	0003-doc-extend-user-principal-section.patch
	0003-service-remove-dead-code.patch
	0004-doc-fix-discover-name-only.patch
	0004-service-check-return-value-of-fcntl.patch
	0005-doc-add-see-also-to-man-pages.patch
	0005-service-avoid-dereference-of-a-null-pointer.patch
	0006-doc-extend-description-of-config-handling.patch
	0006-service-avoid-dereferencing-a-NULL-pointer.patch
	0007-service-use-kerberos-method-secrets-and-keytab.patch
	computer-ou.patch
	duplicate-test-path.patch
	install-diagnostic.patch)
sha256sums=('d8943f66a2a666fee8be026d82a66904c0a5125aab7ef74504456ce269687dda'
            'SKIP'
            '6db7704e9342efd801ec24949f1002a8e26ac67c4f04638ca51977940ef3ac1d'
            'ea5a2b311f76ebfea0c88c2cf333c007ea5db32316935bbd5dd6883450edd5a3'
            'faffd409b53b46c67d4f776e252e49025a63f9963796e12ef6f487d416310958'
            '262764b9acbe2c84348d8f9a7b759bd08d10c04ef779c4f390c3f6650ef6d96a'
            'cb376d3b6e90be4aa84a1d42d4d395f5a8f0aedfbf719277e549f08928e3a985'
            '2c79e27e504d24b22a06bce567a3aa96348e1bb0682db4e042c96165f799c500'
            'a56748ad07b75e346dccedead2ec50053bfe3c3084f9c804b8fae6d961977236'
            '65f4b0d4d8f51e55e9adc5b8d2896a3abf159f311fc9d3a99ae2df906181e04d'
            '440ae6ac9d7b4e08440dc1382cfc243e28d69dfcf010f8335e3699c40eda9d63'
            'f25dd08914fb493d8b8e6ff5bd44d8398d0498116a874effb314f2cd6e26446d'
            '6b3a36fdb36655940194ec0b53dcec7e97a4a79a0427863c8a905ad67c9c1714'
            '512def4faeaa0cd283161fbb05f2bba16bd2d2373d681a99248e78ede958b0fe'
            '47d7a73329a7dbb4754ab7bd3ed436799cbd21b4f555a0a0ab50c27944817335'
            'f408dc7c2263b01e97b66ec068fc48ba5597a3d13e55a60d26008ae309a7787d'
            'f3a584270e3e0d6a76c9aeb1dbf078c864b78d948c3277d6899b0b40f8a58030'
            '8346081c5a8c1efbd5c33890e530fdd84906d394737a1a2cd5a8e2f5fb4f64b6'
            'd93b5ba71204cbcb70bab02bf990068d04d4be1888f23c251e2c512c8bb0caeb'
            '86640fbf9a7f5d7606529584902dcee96fd13cb50c673d785ec04ab525364119'
            '1daa4159e6fe20131111112b6127ca823b2355a2ef7895840959168af00a5483'
            'e4922a6c16c7fd41a2903a5857876c679fd9c257569fe35a4b08ffaabfd016e7'
            'eeca4747df151ab624feeefdeda4274da3703681074f21789a69a2eb73da9ca4'
            'd594af102566775b4bb0cf59554c69c20721d7db935ac69a3fbc86f28f1226bc'
            '6fc569eb9641503352fb5f19cb2c5dd16a0e8c888c7e4ea652b55a8e9e69ff6e'
            'a962c7b5f3cf2dba39d16195ad7bb1a9d2db9d2292d74d6e65879c220791b871'
            '3ef0438e83ec4cefba482435d8c22d69bbb8e93b24032a83ad139481ecbda817'
            '76e511fe1033f19c8499b4edcc3410eede375ceff968f4ac08cd6333c7e33c2a'
            '77bad53ed4f36ae51f3c81b0195fb898fa6c9f79a377550f51551423c12dcff0'
            '682a5f7af3e4bdc0bfa5ed2f7ad654e9d311666995520ae2997898edb9264bdc'
            '950d252020635b4415551fcf9fcacc06ade8497a639b25661b138341b327ea24'
            '5e43d034348bdf3cb3f06ebd56d811b3427e43f9220fee9a104f50d3972cb5cd'
            'a659dfcf8e4f91123832ae89b9ac92bbcc9ea8d90a698533ca25dff9ec610d90'
            'e49fc613594d4fb540f0a562778e2fd45711548cbe3dc9769f5aa0773de16319')
validpgpkeys=('C0F67099B808FB063E2C81117BFB1108D92765AF')

prepare() {
  cd "$pkgname-$pkgver"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}
build() {
  cd "$pkgname-$pkgver"
  AUTOMAKE=automake ACLOCAL=aclocal ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --with-distro=defaults  ;
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" DBUS_POLICY_DIR="/usr/share/dbus-1/system.d" install
}

# vim: ts=2:sw=2:et

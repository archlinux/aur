# Maintainer: Oscar Morante <oscar@morante.eu>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt-patched
pkgver=1.5.23
pkgrel=5
pkgdesc='Small but very powerful text-based mail client (plus a huge pile of patches mostly from debian)'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'gnutls' 'libsasl' 'libidn' 'mime-types'
         'krb5' 'tokyocabinet')
makedepends=( 'w3m' 'docbook-xsl' )
conflicts=('mutt')
provides=('mutt')
source=(
  "https://bitbucket.org/mutt/mutt/downloads/mutt-${pkgver}.tar.gz"
  'backport-gnutls-fix.patch'
  'am-maintainer-mode.patch'
  'ifdef.patch'
  'xtitles.patch'
  'trash-folder.patch'
  'purge-message.patch'
  'imap_fast_trash.patch'
  'sensible_browser_position.patch'
  'patch-1.5.4.vk.pgp_verbose_mime.patch'
  'compressed-folders.patch'
  'compressed-folders.debian.patch'
  'Muttrc.patch'
  'Md.etc_mailname_gethostbyname.patch'
  'use_usr_bin_editor.patch'
  'correct_docdir_in_man_page.patch'
  'dont_document_not_present_features.patch'
  'document_debian_defaults.patch'
  'assumed_charset-compat.patch'
  '467432-write_bcc.patch'
  '566076-build_doc_adjustments.patch'
  'define-pgp_getkeys_command.patch'
  'gpg.rc-paths.patch'
  'smime.rc.patch'
  'fix-configure-test-operator.patch'
  '531430-imapuser.patch'
  '543467-thread-segfault.patch'
  '542817-smimekeys-tmpdir.patch'
  '548577-gpgme-1.2.patch'
  '553321-ansi-escape-segfault.patch'
  '547980-smime_keys-chaining.patch'
  '528233-readonly-open.patch'
  '228671-pipe-mime.patch'
  '383769-score-match.patch'
  '603288-split-fetches.patch'
  '611410-no-implicit_autoview-for-text-html.patch'
  'path_max.patch'
  'update_german_translation.patch'
  'sidebar.patch'
  'sidebar-dotpathsep.patch'
  'sidebar-utf8.patch'
  'multiple-fcc.patch'
  'sidebar-newonly.patch'
  'sidebar-delimnullwide.patch'
  'sidebar-compose.patch'
  'sidebar-new.patch'
  'nntp.patch'
)
sha1sums=('8ac821d8b1e25504a31bf5fda9c08d93a4acc862'
          '018575fea153952423d4d512ca2fdfc2e49d669f'
          '1ad77bdf742ff584b5695f1908dde83044195c0e'
          '3aca6a18ac32b8f6c15216e6fb928a05320c5b74'
          'ff3b66e57faaa163e3e6512f81fdbbea9e02a0bd'
          '5c1eae78cb8636025916e7d83c192f6c32981ff3'
          'c6eaf7fb1829809e7f07d039f75ab30de02d7873'
          '72a35dfd4476238db3500f3a5651996691c1ce20'
          'e3e7b9c5b17be4032e111edb6a6999a3185c8f7b'
          '61630d6a6c3fdf7480c7b6a0e75552500c48f5f4'
          'a7546f9616460da23e87957b0ce98776113b5f7b'
          '6a53e85ee55c14beda0000de89a397f589cb29a7'
          'b841ad389301d336ba533356d057ea1f09bc150b'
          'ee72ecb042e337427b5d9c31ff1ecb78b440e2ff'
          '773c59af8755b6daa1d73749fa9c38ccf953285c'
          '0acf230d3b7e03b90239b256a6944ccf8a0b4e91'
          '12c74c647238e653c4db5f8eb7590c5723635b9c'
          '4dd818f69c4f302c5ca3e5a7fd95223112c853ac'
          '464ca1c57f8a25177a586cb79b94398f694b32e3'
          'c44f9b5a3104917417d09dbcb0dda77f4566c30a'
          '206daf4a78f801d9835c8096c83181569ae74136'
          '061afb767a30fb78d48b0de1e30aea2f0b3b9d5d'
          '42ab3017961819669c678e7456657ca677c8eb56'
          '8ae07c06cc9a552b7152c4e264b6284cd770a29c'
          'ad645521bcd36a758e10cf0e2e2e8123c3c9a229'
          'f1ee08450995fe21e0dc3807563e7120d2e3d04a'
          'f2b98a258d5ee18f731aab975f5b0dd17945f228'
          '98d958231c05fa1ddf5f1a0ab67a2dc6cefa8418'
          'c8ac575a36876d711a16be09425301c4800bf21c'
          '6ec4a7614dc78d230a9ebe8ec645393a98be41a4'
          'f91ac0baf4eda090da7b80e272d422f234b459cd'
          '03a42b8914c9ef1f684275cba355046de14b1c03'
          '1b53316b0c09333dbee428448a6f565378ff5357'
          '8121dd0a07f6f98377e1b1ad3659deaec3a83b6b'
          'd4803ee5f29e9e495e12bf012dc938d7cd4adc47'
          '561b600c79988975f034c9237158fb991ec92541'
          'f91499aa8bee5827924e6c860bd853e0344d55bc'
          'f99082007d3cb4486b96cb22d1fae1c71fdbe51e'
          'fcdeb12e49735268c080e34c2d88211a7ccb8493'
          '487850ffc2a6d639d9d17b3ced844257799a84a9'
          'c01c8f84e3ea4ac71caf31edeb6adb062eb04fe0'
          '2ba91afb71dc40793bac8198fd9f8d6500bd1ce3'
          'e7181b191f06bd6c74c6e35372dba6dc3f8c4653'
          '19fd36f9a1f15d4481f08d90f9a88d3912e12cdb'
          'b648cb9ab1a0b447417647a82856af01a9a418e5'
          '230973eb243265ee75bd098f0f8286690bed2d08'
          '8d7d858e47bbb2c736c9d09de843d3892888e9c5')

install=install

prepare() {
  cd "${srcdir}/mutt-$pkgver"

  patch -Np1 -i "${srcdir}/backport-gnutls-fix.patch"
  patch -Np1 -i "${srcdir}/am-maintainer-mode.patch"
  patch -Np1 -i "${srcdir}/ifdef.patch"
  patch -Np1 -i "${srcdir}/xtitles.patch"
  patch -Np1 -i "${srcdir}/trash-folder.patch"
  patch -Np1 -i "${srcdir}/purge-message.patch"
  patch -Np1 -i "${srcdir}/imap_fast_trash.patch"
  patch -Np1 -i "${srcdir}/sensible_browser_position.patch"
  patch -Np1 -i "${srcdir}/patch-1.5.4.vk.pgp_verbose_mime.patch"
  patch -Np1 -i "${srcdir}/compressed-folders.patch"
  patch -Np1 -i "${srcdir}/compressed-folders.debian.patch"
  patch -Np1 -i "${srcdir}/Muttrc.patch"
  patch -Np1 -i "${srcdir}/Md.etc_mailname_gethostbyname.patch"
  patch -Np1 -i "${srcdir}/use_usr_bin_editor.patch"
  patch -Np1 -i "${srcdir}/correct_docdir_in_man_page.patch"
  patch -Np1 -i "${srcdir}/dont_document_not_present_features.patch"
  patch -Np1 -i "${srcdir}/document_debian_defaults.patch"
  patch -Np1 -i "${srcdir}/assumed_charset-compat.patch"
  patch -Np1 -i "${srcdir}/467432-write_bcc.patch"
  patch -Np1 -i "${srcdir}/566076-build_doc_adjustments.patch"
  patch -Np1 -i "${srcdir}/define-pgp_getkeys_command.patch"
  patch -Np1 -i "${srcdir}/gpg.rc-paths.patch"
  patch -Np1 -i "${srcdir}/smime.rc.patch"
  patch -Np1 -i "${srcdir}/fix-configure-test-operator.patch"
  patch -Np1 -i "${srcdir}/531430-imapuser.patch"
  patch -Np1 -i "${srcdir}/543467-thread-segfault.patch"
  patch -Np1 -i "${srcdir}/542817-smimekeys-tmpdir.patch"
  patch -Np1 -i "${srcdir}/548577-gpgme-1.2.patch"
  patch -Np1 -i "${srcdir}/553321-ansi-escape-segfault.patch"
  patch -Np1 -i "${srcdir}/547980-smime_keys-chaining.patch"
  patch -Np1 -i "${srcdir}/528233-readonly-open.patch"
  patch -Np1 -i "${srcdir}/228671-pipe-mime.patch"
  patch -Np1 -i "${srcdir}/383769-score-match.patch"
  patch -Np1 -i "${srcdir}/603288-split-fetches.patch"
  patch -Np1 -i "${srcdir}/611410-no-implicit_autoview-for-text-html.patch"
  patch -Np1 -i "${srcdir}/path_max.patch"
  patch -Np1 -i "${srcdir}/update_german_translation.patch"
  patch -Np1 -i "${srcdir}/sidebar.patch"
  patch -Np1 -i "${srcdir}/sidebar-dotpathsep.patch"
  patch -Np1 -i "${srcdir}/sidebar-utf8.patch"
  patch -Np1 -i "${srcdir}/multiple-fcc.patch"
  patch -Np1 -i "${srcdir}/sidebar-newonly.patch"
  patch -Np1 -i "${srcdir}/sidebar-delimnullwide.patch"
  patch -Np1 -i "${srcdir}/sidebar-compose.patch"
  patch -Np1 -i "${srcdir}/sidebar-new.patch"
  patch -Np1 -i "${srcdir}/nntp.patch"

  autoreconf -vfi
}

build() {
  cd "${srcdir}/mutt-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --with-docdir=/usr/share/doc \
    --with-mailpath=/var/mail \
    --disable-dependency-tracking \
    --enable-compressed \
    --enable-debug \
    --enable-fcntl \
    --enable-gpgme \
    --enable-hcache \
    --enable-imap \
    --enable-pop \
    --enable-smtp \
    --with-curses \
    --with-gss \
    --with-idn \
    --with-mixmaster \
    --without-bdb \
    --without-gdbm \
    --without-qdbm \
    --with-regex \
    --with-sasl \
    --with-gnutls

  make
}

package() {
  cd "${srcdir}/mutt-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm "${pkgdir}"/etc/mime.types{,.dist}
  rm "${pkgdir}"/usr/bin/{flea,muttbug}
  rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
  install -D -m 644 contrib/gpg.rc "$pkgdir"/etc/Muttrc.gpg.dist
}

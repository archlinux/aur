# Maintainer: Coelacanthus <coelacanthus@outlook.com>
pkgname=checkinstall
pkgver=1.6.2
pkgrel=2
pkgdesc="Track files modified by an installation script and create a Slackware, RPM or Debian package"
arch=('i686' 'x86_64')
url="http://checkinstall.izto.org"
license=('GPL')
depends=('bash' 'glibc')
optdepends=('dpkg: to create deb packages'
            'rpm-tools: to create RPM packages'
            )
makedepends=()
provides=('installwatch')
source=("http://checkinstall.izto.org/files/source/$pkgname-$pkgver.tar.gz"
        '0001-Felipe-Sateler-Tag-only-regular-files-as-conffiles.patch'
        '0002-Backtick-patch-from-Andrey-Schmachev-Copyright-year-.patch'
        '0003-Fixed-bug-3-Removed-extra-okfail-and-fixed-spanish-t.patch'
        '0004-Fixed-bug-1-Source-directory-package-name-with-space.patch'
        '0005-Applied-patch-from-Ladislav-Hagara-for-compiling-ins.patch'
        '0006-Added-Norwegian-translation-update-from-Andreas-Note.patch'
        '0007-Added-summary-command-line-option.patch'
        '0008-Fixed-glibc-minor-version-handling.patch'
        '0009-Fixed-warning-about-uninitialized-variable-in-fopen-.patch'
		'0010-Support-for-the-Makefile-PREFIX-variable.patch'
		'0011-We-now-create-Slackware-packages-in-TMP_DIR.patch'
        '0012-Fixed-bug-110.-create-localdecls-correctly-identifie.patch'
        '0013-Fixed-bug-23.-We-remove-empty-fields-from-the-Debian.patch'
		'0014-Fixed-typo-in-create-localdecls.patch'
        '0015-Fixed-bug-30.-Newlines-are-converted-to-underscores-.patch'
        '0016-Fixed-bug-38.-.spec-file-macro-processing.patch'
        '0017-Fixed-bug-112-make-install-fails-on-Fedora-21.patch'
        '0018-Fixed-bug-137-Missing-in-copy_dir_hierarchy.patch'
        '0019-Fixed-bug-35-Directories-in-etc-are-incorrectly-incl.patch'
        '0020-add-support-for-recommends-and-suggests-AKA-weak-dep.patch'
        # Above is from git
        '0021-Load-checkinstallrc-from-etc.patch'
        '0022-Drop-cases-for-glibc-2.4.patch'
        '0023-fix-usr-sbin-merge-to-usr-bin-in-Arch.patch'
        '0024-using-custom-cflag-and-ldflag.patch'
        )
noextract=()
b2sums=('3faaebe60c0dc40f36de0ed1854817ecc2d11467e63611d79e2300af17af0708c67491fd0c0a947ded89fd6e53bb15faebf9a85445cabb97be6d21e24cdd70a9'
        '994ee7e7664ce400c6cf4338cb348079064cf985278231485f0434b884278ce60dfa25b3e63377331871f95be2a608fda32409a19db4044c1cd2eb48c789a24b'
        '9d94e308ae7534dc27c51516eb930abb99112180f493aacef786d3de6ee397c077876ff690558a4f742a2d4c5d97579f6a9582d90b2bab915f5c025f3a4a1782'
        'b113f336bbc9f555d52170e7745373067ac1bc21f12b99197eef091b08be6114ad2f6a61fa0f52a1eef246846245d64629beabc018ac8f7e1753c945720ebd28'
        '9000e4e6de09ced649e5d8fb8e0f419232f0cab0cb6a489da1d4bb86039d66ee728ac9b0bb2c8d766c80841a1322038b1015c9be343a80b72e90038067759ceb'
        '6112a545109e7838adc2495bf3287f6cf5a4365a08240562961acfec60a022cb5a90b4fe3d40c29639f82923c0f484efcc8797a3512b68d5c568b7334b1abff6'
        'd2d00dc4cc4ecd19c8f18397d084d2e1d12ccfdea797e787dcc32f6784411104f9716c2a49121f6e8291e3b46c41808b80ca4dada38dda63ac6d4a85e71dcb4b'
        'a7ae461f2848c4b2642b56ae8cf82a6706af86b4ed534f68ae4852c764e1d032daa141a5bec66d1c9685a2a4f468eacaee4dbe1f49da516932e8f970cb431d1b'
        'ea1146405145ae31114ebef8e69547fbe14965b01462cd75b378a4997896519c684a62c4a5f4b4972016d09d59fe2cf89e268164e5894728b0dbb151b000bd1f'
        'b33c580e6c4fb52831d6252c77342e6095bd2c323b1167bebe7d8486a0a4ccb3802df790b8208f2f054098fa904d553eab501853fe1a72e0307b7d571f8bd65d'
        '13e7c097a10e5532cff125044b15a81fa8766bd4ebb26acf0fb7549fd5305e7b1c6b07d8b6ff29b025064fd6c0779cfeca58deaa74366be352cbe81d2372da2a'
        '3b05766fc1754de8535de64eefd1b6719630cf825a3621734e848cdba2d1de7acd5a9598edf3e1862dbb4b2d9860660515a8e7528ddd9fcaba26362f3a2b9f97'
        '4a88981a8bcbaae8a2cbeb3652601b9d17b9523b87f96e6c9228c2aca57e36e37b270a6e9862dab3ad3f9f2a7f60bf0e75f0b7376592930f36960818f72e5977'
        'a638683f5d2812424ba82b7e2f237d26c7b0d833d7c670cba984301c97eb97c26bdb347c458b809256a4303e343a7d12ed9912c8a76b1fc21f0fabe6cf880670'
        '07f2569a9e0f94b832476303bf487c431b35301a63c711ed1104f2a88e27a7c52ab8e40011ccdebdde92f5f32ba1a7e1c5acc03f6e9afd6588703718ee4b623b'
        'd324ac1360699a99d9ad8aceb6b7201c06752bc62e55ee254508ea00dffbe0fb8fb6c9b2aaa54f73db876f8fbe90494d0048ab9c243b029f4e8bf1a7839c3f67'
        '4a58e51416f4f18504c82b526725e21d1ad7c7bd7ee896b7e27f7ce0c68990db8a1db23670b0d8678e2800cb995ca24ebd29388254037dcf4ba5548d00bdc878'
        '4ad781d59d911b36316bcbea2ce489f8a91fb26a0253fafa7cae6f1dcd8331995aba2faa16d693e6cbf03561d4f58d246ddb31da1fe99df14b62535914537d88'
        'f6e401290b06afaa5a22b37a7ca36ee6399af3c6565afc711a05e21b8150925cfb655b740330a236a46884b5d3098d272841dd08a95ba5ae165c790ee59fa620'
        'a947109b5010bbb349f608c6139d291daff6538af9e8fdf827f3c3184d1b47268a1b889d4870f80217b06e7594b1dbe59a917729f266bde676e8c1abb6ea4a7f'
        '94bc1a97619f15617687f2fb65e15991bc6fcaabd09e866f1047cdaddbdf0e6e61cf9d91fdc7489fe76291c8539f4dad169dd8a68690188e3916b25cb37419f7'
        '882d01f77fc57d977f2e63440c2b0a9f967a119fad0276bded5b43072880f8a29d163589b16270dcdd383d998973876d96eff4757b50d494a85eb8d292b28e4a'
        'fd919f347978a8ffcdefa3ca11000c80e341e72495d020238cc3dcf00f06f9e0fd77677bc4dee51ea7ffa596a7c305d547a91d63426c8386f6c353ffe07b05f5'
        '8dde83a0cf2d490cc30e2787dd20dbc2d92b764b370002560309296b9592a7329e2b424e973a12b00d92ea89de42e2517bd3a95e6befe6c5f88a29e9793eba8b'
        '414261dd6eb8112f26e93ea80faba698ea2b42ada99f0c10bceb0e8c1ff0636717b1c922fc9696f59bcb403af0e0ce1863d3e7b9c33643c3db5553379fb8597d')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -t -i "$srcdir/0001-Felipe-Sateler-Tag-only-regular-files-as-conffiles.patch"
	patch -p1 -t -i "$srcdir/0002-Backtick-patch-from-Andrey-Schmachev-Copyright-year-.patch"
	patch -p1 -t -i "$srcdir/0003-Fixed-bug-3-Removed-extra-okfail-and-fixed-spanish-t.patch"
	patch -p1 -t -i "$srcdir/0004-Fixed-bug-1-Source-directory-package-name-with-space.patch"
	patch -p1 -t -i "$srcdir/0005-Applied-patch-from-Ladislav-Hagara-for-compiling-ins.patch"
	patch -p1 -t -i "$srcdir/0006-Added-Norwegian-translation-update-from-Andreas-Note.patch"
	patch -p1 -t -i "$srcdir/0007-Added-summary-command-line-option.patch"
	patch -p1 -t -i "$srcdir/0008-Fixed-glibc-minor-version-handling.patch"
	patch -p1 -t -i "$srcdir/0009-Fixed-warning-about-uninitialized-variable-in-fopen-.patch"
	patch -p1 -t -i "$srcdir/0010-Support-for-the-Makefile-PREFIX-variable.patch"
	patch -p1 -t -i "$srcdir/0011-We-now-create-Slackware-packages-in-TMP_DIR.patch"
	patch -p1 -t -i "$srcdir/0012-Fixed-bug-110.-create-localdecls-correctly-identifie.patch"
	patch -p1 -t -i "$srcdir/0013-Fixed-bug-23.-We-remove-empty-fields-from-the-Debian.patch"
	patch -p1 -t -i "$srcdir/0014-Fixed-typo-in-create-localdecls.patch"
	patch -p1 -t -i "$srcdir/0015-Fixed-bug-30.-Newlines-are-converted-to-underscores-.patch"
	patch -p1 -t -i "$srcdir/0016-Fixed-bug-38.-.spec-file-macro-processing.patch"
	patch -p1 -t -i "$srcdir/0017-Fixed-bug-112-make-install-fails-on-Fedora-21.patch"
	patch -p1 -t -i "$srcdir/0018-Fixed-bug-137-Missing-in-copy_dir_hierarchy.patch"
	patch -p1 -t -i "$srcdir/0019-Fixed-bug-35-Directories-in-etc-are-incorrectly-incl.patch"
	patch -p1 -t -i "$srcdir/0020-add-support-for-recommends-and-suggests-AKA-weak-dep.patch"
	patch -p1 -t -i "$srcdir/0021-Load-checkinstallrc-from-etc.patch"
	patch -p1 -t -i "$srcdir/0022-Drop-cases-for-glibc-2.4.patch"
	
	# fix /usr/sbin merge to /usr/bin in Arch
	# sed 's/sbin/bin/g' -i Makefile checkinstall.in checkinstallrc-dist
	patch -p1 -t -i "$srcdir/0023-fix-usr-sbin-merge-to-usr-bin-in-Arch.patch"
	
	patch -p1 -t -i "$srcdir/0024-using-custom-cflag-and-ldflag.patch"
	
	# with 0021-Load-checkinstallrc-from-etc.patch
	sed "s|CONFDIR=\$(PREFIX)/lib/checkinstall|CONFDIR=$pkgdir/etc|g" -i Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}

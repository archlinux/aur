pkgname=unzip-zstd
_pkgname=unzip
pkgver=6.0
_pkgver=${pkgver/./}
pkgrel=1
pkgdesc='For extracting and viewing files in .zip archives (with Zstandard support)'
url='https://github.com/csabahruska/unzip-arch-zstd'
arch=('x86_64')
license=('custom')
depends=('bzip2' 'zstd' 'bash')
conflicts=('unzip')
provides=('unzip')
options=('debug')
source=("https://downloads.sourceforge.net/infozip/${_pkgname}${_pkgver}.tar.gz"
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-exec-shield.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-close.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-attribs-overflow.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-symlink.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-format-secure.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-valgrind.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-x-option.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-overflow.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-cve-2014-8139.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-cve-2014-8140.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-cve-2014-8141.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-overflow-long-fsize.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-heap-overflow-infloop.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-alt-iconv-utf8.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-alt-iconv-utf8-print.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/0001-Fix-CVE-2016-9844-rhbz-1404283.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-timestamp.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-cve-2018-1000035-heap-based-overflow.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-cve-2018-18384.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-6.0-COVSCAN-fix-unterminated-string.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-zipbomb-part1.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-zipbomb-part2.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-zipbomb-part3.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-zipbomb-manpage.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-zipbomb-part4.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-zipbomb-part5.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-zipbomb-part6.patch'
        'https://src.fedoraproject.org/rpms/unzip/raw/rawhide/f/unzip-zipbomb-switch.patch'
        'unzip-6.0_CVE-2021-4217.patch'
        'https://sources.debian.org/data/main/u/unzip/6.0-27/debian/patches/28-cve-2022-0529-and-cve-2022-0530.patch'
        'add-zstd-support.diff')
sha512sums=('0694e403ebc57b37218e00ec1a406cae5cc9c5b52b6798e0d4590840b6cdbf9ddc0d9471f67af783e960f8fa2e620394d51384257dca23d06bcd90224a80ce5d'
            '3c7f525687b198aaa8547a8b30e744f7f184943624279d5c70170d5b9bb3f0c0f27f3e69bc808dd0d144690107bc76a10c06e160bf99c54fd5684246208b7cff'
            '8423e32bbc1e1fe9366118bd10795bb8307f5a9a1afba1f0f62e46443d198b7f3cfcc41dedf57f31830f4c7328c9f5ae573982ca8664822b5f2a2ecdbc389df9'
            '0aea88ccb4e141f4b23559a6802d0ceccaf4897addbe9d4ec465909ddf5f910a44d5e7907c815211e4b086cbd73c200c9b972f197a256e44f74468e3909928c9'
            'a3be30ce8c9eb903db636e786bea4e0c12ecb3f63af16eeac819f0b11db6984dfd93133fdbba2fdce228f5f57283973f64e3e3a81ec28cf46ea2e0b7593046d2'
            '94560c730437ac2561d5e7550b91688dad1b828e1da96c9477e228e17b37e455ecdcd3a774e7db94dd902bbe12547d910602c0656b803768e5865b045d452dd7'
            '8e1e3c88ff4191c325696984a52df50ba70ec0d0e68938ba06bbcdf9de96c0a26c9802db28b762bd14bc1a5c1c7d33d67e1cce91a3e44c92f3bb90509ea0f15f'
            'ec09ee6017fed66ebae2921b50fb7419eed627d49e78a3a072bec7256841e7829b6a3121f776a1ccc5d2cc3589006902465d73c28b3bd0937b9c3417ab0a0446'
            '7e5274db1d0e9b1db87ce543ddb4edea67cea193ee5394a5a46f3813169c33508cbea96cc0ce88eb4ffc64b21df02c18724d0fe8f7d2814954233f646c386b3a'
            '217a923ff8101823d7555c5999e63b2be0bb5898911f0f39dd46c85c69ce2e59c29135e69b5cbb084f40b5beb8dc52e1b47d3b21cd801ebb06dc08984c85f292'
            'a23f48924852046500547921f7b52e861a75dc2521f184fba87b3ff338c9d0598e8493f2a3c8eb1cb80412e0d057fb4b3c21e457f7295c8c8158d821709fb000'
            '5969a2de0e11d00dfb690f67b1ae96d7a4f587a1cf3dd80572f5e10ba970a69958f04bb826a49338fc93204a3cb7aeb34bf735a681383f8e89691d09a7b26cce'
            '6b37c1e72bea789051624c72c0aaa0522f4eecf83e82efb1d9c1844536903ed253b7448bea4a6e6aa116be86a50cad6911a0e218eacb8e5bee27a4457145b03f'
            'b0b745cff474756447e699a13ff003871b33a4f7a24a91150e5a947eba5132fd90fbacf7580379fc13c5f638483b25cbc226f85b9cac9c7662b2f91927eb2bb3'
            'a00e41feede53d42e0eb03d8280664b2a904918fab3c52459d02c07a298dd12e482eb3318c1842933ac3a527308dc5e4871f029b6b79e5bc2b2e1d84fee4fd0f'
            '48e6c143eb55aad68d49b6dab640f824b88eaeadfb35e4962199b833e8e7adc87ded7bf8846ee43e1b4974e883fdc6b1d1f558eb72705d0c7af0455ee1ffccbb'
            'b73fde8e3568ccb8d26a787ac27127f87625dec372fa0ccaafd1266ddaaee46f9767bb67e874574cb27ec13fd3c90195e60be719b9996a7c5e194da7bf700c97'
            'e387dc533142f0f702c04092da297e8dfc9b51e4ec7001e6e657d93a9a0f6382b1b39196f239190b8d52b8ecfa46a965627e503aaecdab86e59272af84bbc2c6'
            '6f757385a23fe6a034f676df6bf233243afa8743761e3d715e532d066fcd7dc8f8dcd6192be693258f3855837e5534490784378768abe7ce710fb869258d49b7'
            'd506d50897c164ee87e860e97a25b6725f1e724cad74cbd79cb8ac4cd68ef6dfb42bcd8dcf954112340d9b943b8d1d34bf166b2ca958f0045d6f7298954fbf20'
            'f50bc2d6ff9859bdbc9122be558a7119d693687424260bf90663e594223a9247f5a3f24a490e3345f5e9b8c6501446da752e51d4b63a35531e37c20cbc9456ab'
            '4f940afa1f6628a47faf6eb13116eab384bda05c841b0b286b18cafad9c4b567ef332a301b8fbdf07259acdf8f6bdb452487e086bce2a3f092daa4e9d9daefa6'
            'e20e97722e0daf48b97df540added603325d356c6597634afd694af3972bb62952dd0f92c10d98f8c9f28eb9d089f6f5b022e0beb8c6224e32fd2cfaadffa200'
            '7e11e29dde260f0245bc25eeb811d794515d1c523b42ea6004c7c6a2eda19b9de4dd7a8ecc03e5ff7d376e28a96c6f1b2b922d6b8b3963a9e4746231f3c257f4'
            'cb51b1ff5c1bc4a3acc8d4bb60c92cd74dec1b76799f00f542e793b1407964c00cfbda8153703e40a64d1cf89705d6ba16a4c11e7ca9a304eb3a14355546e5eb'
            '27d45a25a6a51415af609a4fdefcb7c95a1105d511a6e18e2a7464e9d3773ba2ccb25f138a3cc6ddc6e5e9c558b633ee60d273cebf562c2a7d1e99d3f229d1ba'
            '48875d7e08d669637e26a7e800f8b2a3812d477e6f249c8d4962fdf93ba6d346f5b22b83d82cb65317b506dff84c441d42c0fe7d1c042a065619d39bdf25fdd0'
            'a788d57fe0fb9ae6106381d2a8fe566aa35bb037012139dc7c283fe5eb316056835dffa9ea9778c15a5b39e50a75329a135a0dffdfc6a53d575ef2013b1d478a'
            'd86aba51101fdbe855c35f034d33d65a79c5c707d01de4709619f5d1316185777048b72c293f9506186677bcecf54a808e106ad59bb36835ef80615641c85d63'
            'fc1f4246b6974c3c554aed1127f512f0b2ac8fa13aff7c3b54877411e15856522e35633c45b2326d96b5094a9106d697a0883c1879af2c616d9dd51180b6887b'
            'bff17d21399a2189ed497602a735eab55746a17e6d414d843068c0374ae09d8d5958c00731e9f35dbfbce6ec9f802cb83d1e7436363392a36a2e34b724d0d71c'
            '7fe4400412e6ab3542400a320e77148958bd52c39d606134c0b2703ab95697e2038fd2c85887b3145d5e1b1b46a0474fc89e5f6ed42bfaa7392c0569a632fbcc')

prepare() {
	cd "${srcdir}/${_pkgname}${_pkgver}"
	sed -i "/MANDIR =/s#)/#)/share/#" unix/Makefile
	patch -p1 -i ../unzip-6.0-exec-shield.patch
	patch -p1 -i ../unzip-6.0-close.patch
	patch -p1 -i ../unzip-6.0-attribs-overflow.patch
	patch -p1 -i ../unzip-6.0-symlink.patch # FS#60433
	patch -p1 -i ../unzip-6.0-format-secure.patch
	patch -p1 -i ../unzip-6.0-valgrind.patch
	patch -p1 -i ../unzip-6.0-x-option.patch
	patch -p1 -i ../unzip-6.0-overflow.patch # FS#44171
	patch -p1 -i ../unzip-6.0-cve-2014-8139.patch # FS#43300
	patch -p1 -i ../unzip-6.0-cve-2014-8140.patch # FS#43391
	patch -p1 -i ../unzip-6.0-cve-2014-8141.patch # FS#43300
	patch -p1 -i ../unzip-6.0-overflow-long-fsize.patch # FS#44171
	patch -p1 -i ../unzip-6.0-heap-overflow-infloop.patch # FS#46955
	patch -p1 -i ../unzip-6.0-alt-iconv-utf8.patch
	patch -p1 -i ../unzip-6.0-alt-iconv-utf8-print.patch
	patch -p1 -i ../0001-Fix-CVE-2016-9844-rhbz-1404283.patch
	patch -p1 -i ../unzip-6.0-timestamp.patch
	patch -p1 -i ../unzip-6.0-cve-2018-1000035-heap-based-overflow.patch # FS#69739
	patch -p1 -i ../unzip-6.0-cve-2018-18384.patch
	patch -p1 -i ../unzip-6.0-COVSCAN-fix-unterminated-string.patch
	patch -p1 -i ../unzip-zipbomb-part1.patch
	patch -p1 -i ../unzip-zipbomb-part2.patch
	patch -p1 -i ../unzip-zipbomb-part3.patch
	patch -p1 -i ../unzip-zipbomb-manpage.patch
	patch -p1 -i ../unzip-zipbomb-part4.patch
	patch -p1 -i ../unzip-zipbomb-part5.patch
	patch -p1 -i ../unzip-zipbomb-part6.patch
	patch -p1 -i ../unzip-zipbomb-switch.patch
	patch -p1 -i ../unzip-6.0_CVE-2021-4217.patch # FS#73542
	patch -p1 -F3 -i ../28-cve-2022-0529-and-cve-2022-0530.patch
	patch -p1 -i ../add-zstd-support.diff
}

build() {
	cd "${srcdir}/${_pkgname}${_pkgver}"

	# DEFINES, make, and install args from Debian
	DEFINES='-DACORN_FTYPE_NFS -DWILD_STOP_AT_DIR -DLARGE_FILE_SUPPORT \
		-DUNICODE_SUPPORT -DUNICODE_WCHAR -DUTF8_MAYBE_NATIVE -DNO_LCHMOD \
		-DDATE_FORMAT=DF_YMD -DUSE_BZIP2 -DUSE_ZSTD -DNOMEMCPY -DNO_WORKING_ISPRINT'

	make -f unix/Makefile prefix=/usr \
		D_USE_BZ2=-DUSE_BZIP2 L_BZ2=-lbz2 \
		LF2="-lzstd $LDFLAGS" CF="$CFLAGS $CPPFLAGS -I. $DEFINES" \
		unzips
}

package() {
	cd "${srcdir}/${_pkgname}${_pkgver}"
	make -f unix/Makefile prefix="${pkgdir}"/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

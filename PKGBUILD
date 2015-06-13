# Maintainer: Samuel Dionne-Riel <samuel@dionne-riel.com>

pkgname=elantech-asustouchpad-dkms
pkgver=4.0.2
pkgrel=1
pkgdesc="psmouse kernel module with hack for some elantech touchpads"
url="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/967399"
license=("GPL")
depends=('linux-headers' 'dkms')
arch=('any')
install=elantech-asustouchpad-dkms.install
kver=$pkgver
source=('elantech-asustouchpad.patch'
	'elantech-asustouchpad-dkms.install'
	"elantech.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/elantech.c?id=refs/tags/v$kver"
	"Kconfig"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/Kconfig?id=refs/tags/v$kver"
	"Makefile"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/Makefile?id=refs/tags/v$kver"
	"alps.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/alps.c?id=refs/tags/v$kver"
	"alps.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/alps.h?id=refs/tags/v$kver"
	"amimouse.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/amimouse.c?id=refs/tags/v$kver"
	"appletouch.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/appletouch.c?id=refs/tags/v$kver"
	"atarimouse.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/atarimouse.c?id=refs/tags/v$kver"
	"bcm5974.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/bcm5974.c?id=refs/tags/v$kver"
	"cyapa.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/cyapa.c?id=refs/tags/v$kver"
	"cypress_ps2.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/cypress_ps2.c?id=refs/tags/v$kver"
	"cypress_ps2.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/cypress_ps2.h?id=refs/tags/v$kver"
	"elantech.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/elantech.c?id=refs/tags/v$kver"
	"elantech.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/elantech.h?id=refs/tags/v$kver"
	"focaltech.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/focaltech.c?id=refs/tags/v$kver"
	"focaltech.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/focaltech.h?id=refs/tags/v$kver"
	"gpio_mouse.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/gpio_mouse.c?id=refs/tags/v$kver"
	"hgpk.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/hgpk.c?id=refs/tags/v$kver"
	"hgpk.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/hgpk.h?id=refs/tags/v$kver"
	"inport.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/inport.c?id=refs/tags/v$kver"
	"lifebook.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/lifebook.c?id=refs/tags/v$kver"
	"lifebook.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/lifebook.h?id=refs/tags/v$kver"
	"logibm.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/logibm.c?id=refs/tags/v$kver"
	"logips2pp.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/logips2pp.c?id=refs/tags/v$kver"
	"logips2pp.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/logips2pp.h?id=refs/tags/v$kver"
	"maplemouse.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/maplemouse.c?id=refs/tags/v$kver"
	"navpoint.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/navpoint.c?id=refs/tags/v$kver"
	"pc110pad.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/pc110pad.c?id=refs/tags/v$kver"
	"psmouse-base.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/psmouse-base.c?id=refs/tags/v$kver"
	"psmouse.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/psmouse.h?id=refs/tags/v$kver"
	"pxa930_trkball.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/pxa930_trkball.c?id=refs/tags/v$kver"
	"rpcmouse.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/rpcmouse.c?id=refs/tags/v$kver"
	"sentelic.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/sentelic.c?id=refs/tags/v$kver"
	"sentelic.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/sentelic.h?id=refs/tags/v$kver"
	"sermouse.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/sermouse.c?id=refs/tags/v$kver"
	"synaptics.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/synaptics.c?id=refs/tags/v$kver"
	"synaptics.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/synaptics.h?id=refs/tags/v$kver"
	"synaptics_i2c.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/synaptics_i2c.c?id=refs/tags/v$kver"
	"synaptics_usb.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/synaptics_usb.c?id=refs/tags/v$kver"
	"touchkit_ps2.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/touchkit_ps2.c?id=refs/tags/v$kver"
	"touchkit_ps2.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/touchkit_ps2.h?id=refs/tags/v$kver"
	"trackpoint.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/trackpoint.c?id=refs/tags/v$kver"
	"trackpoint.h"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/trackpoint.h?id=refs/tags/v$kver"
	"vsxxxaa.c"::"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/input/mouse/vsxxxaa.c?id=refs/tags/v$kver"
)

build() {
	cd ${srcdir}

    mkdir -p src
    cp *.c *.h src/
    cp Makefile src/
    cp Kconfig src/
    cd src

    # apply patch
	patch -Np1 < ${srcdir}/elantech-asustouchpad.patch

	sed -i '/CONFIG_MOUSE_PS2_OLPC/s|^|//|' Makefile
	sed -i '/#ifdef CONFIG_MOUSE_PS2_OLPC/,/#endif/d' psmouse-base.c
}

package() {
	cd ${srcdir}/src
    pd=${pkgdir}/var/lib/dkms/psmouse/elantech-asustouchpad-${pkgver}
    ps=${pd}/source
    
	install -d -m0755 $pd
    install -dm755 $ps
    install -m644 *.c *.h $ps
    install -m644 Kconfig $ps
    install -m644 Makefile $ps

    cat > ${ps}/dkms.conf <<DKMSCONFEOF
PACKAGE_NAME="psmouse"
PACKAGE_VERSION="elantech-asustouchpad-$pkgver"
CLEAN="rm -f *.*o"

BUILT_MODULE_NAME[0]="psmouse"
MAKE[0]="make -C \$kernel_source_dir M=\$dkms_tree/\$PACKAGE_NAME/\$PACKAGE_VERSION/build/. psmouse.ko"
BUILT_MODULE_LOCATION[0]="."
DEST_MODULE_LOCATION[0]="/updates"

AUTOINSTALL="yes"
DKMSCONFEOF

    chmod 644 ${ps}/dkms.conf
}

sha512sums=('09d8a7d2c604c43be9dec9c597acd1ae358dffcc0ead764ca5cd38f0eb84b7873ae0088c83aa16a1df18e066f974ee04bd7dc089ba745b1010e943294e82e953'
            '733fe34c573cbd4b7713fb3ac1d0fbcc48539876c90b8134b73a63eb9dce064950f9d8884a5c0360757209f4d16f57811d2b217742352c5f5187a9a4bf966e79'
            '49dcb33efe2570b3929668856fde5795315c0c777cd2c85a447a0f507119eaeeae73e039d82f92137d3a52a65476c36a2a164255dfd9a3ea0a759be88fa415b2'
            'cc10347bebded7f5cc644ff8ca1cc3a505593864859dea694310a793dd876987d210f7834008c29678cfa3992dfb41faea999a1fcbca89d8e29d3ba49aaebc36'
            'a3e07f985e790a517f17da11152a8c1f53509cd81ec43f768aae3675ac89c5fabef2d428e0b985997fee3af0ee05e58efdca306111bc40b419775d804fd7860f'
            'dd2739f411920dc5b8ad93182f6927dcfc629fe94e82a7dd2c4db2911143bc10fd8a4d245a79c111822b26cddc2a6af67ceb58a404027d49265ffc993fe2b319'
            'bc89418eaa93023fcb6d2ab996a6cb8c638638cac87d7675ec403b5c0a4ddd4c412956982f1113f06b291fdaf1c7e312f44f427943798f42cf394042a50dc926'
            '83268a99f51af8694194c388825eea4f4e3691e1ebd8bbb9a5f1ecfe1d9cbe1ffad592e2e1e3d23a4681ec5baee416ac953d8fce9752784f89e89ef8d4a93654'
            '873f2940a779c0be25fc02040a79bffff983f7bff09508c7dc4ff8eaf08a9eabe9359671ba5bfc3f5943c6ec939b7b3919bafb3973912e32eaef4d8aed6ed689'
            '73bc6bd1b37dc4aa19e68ca9f9e2039f902e3830df51db32dadef3101d675b37c56f8a9d1a5a0e61c4083cf01e553ff7e4880cea5903c97548996d95cdbfddd7'
            '5ae5c4ae256f6ec5f0a93614fa2995f06c859802125390d8d1ebc853899a9813783924a660aa343679d449253dbba44b6579fcc3b53fb0098e4fbaae78f6879c'
            '7613d39e2e4b5da3110abc2cf2960c67b7ae18303f333af0b7655c773dced82e34f97b61406e888e42308b773edb9f9a64159052d212dc12f7da955bf88ad996'
            '0f489506e0a0bc242ab4c481f6345a6c4457dfc6a0095855bdd2eb038f0ecd591cde5a28ff6fe6073993c874690b0b0f8183779bdf216d3df79d0fcd5ac888db'
            'ab75b6dc61abfa9c63c64b2564687df4d155593216be633e46cba18e3e6598b8075988e653d5afa16285ae4b4418f096655de6338f24e61d666153a9b9810e57'
            '49dcb33efe2570b3929668856fde5795315c0c777cd2c85a447a0f507119eaeeae73e039d82f92137d3a52a65476c36a2a164255dfd9a3ea0a759be88fa415b2'
            '5e32c23e8358091584a866889f54ca5c7c17584b6a9f8063610a1de669551d4bc62f96ad1dbc8ed07eba7c43805c68a44df1ab1885898d3466f4376227337c96'
            '3b71609f9d57e085ce638151ed2ac847aef266479e72b1b21bab6098c997444acb949ae7242d19d901d554741253692b1bd3ddeccc016e9c07961c23df64605d'
            '831d672e8a6f369e616dd3e6b07ae222c216393a15c3d454563a8278e47a46ab2da9f3471d41fe153a192320424579c9408ac6cf083365949a28dddcae46cd93'
            '4f0b369b945e97111a8ff59139d0d0cee0927581c658343fd413fe27e96e635de2f47b396ac135950fdaee29028f6bafa3ab34464f3ef105db4588016758576e'
            'f12e317c8a5cd5ec7ab614968cbb2d6744468e6dfeb3728de7c7c69b1c274cadae17531c4e835f5d09f1035b272551d97b87f2f685444beddb770dc11d32312c'
            '5e640a9c6580b67e440ee050e78cec4b6e99a43a0a4350eece879fa441bce2a3d0a1c902c54b4fd3b9899103646641ecbbdf1e272df14a2cbf81337904dcd27a'
            '84194a98ef621d448fcd3889cf825a7fb22ba187eee07d4623fdb4f20e49af5522f9aa1391def4683481c1bc7b24457c0276e1d3fcefad0d440ca5f80edfba1e'
            '439fe7a68fe48216d08e4971466a1d0b94159ce36d575d68f8ab421ec4236aff1a42c8debf572b2c10d0c55b9dd24510e40ff950f146ae04c4cc6dae50918f1c'
            'a93b1977e6e9293863d0c203027fc473c0c4cd8d308f1b5e8681697e24f8798826b82f2dd1b7d18ef8fefe7f87bdc750da61d554cbb41df4ed3560c9b7749eee'
            '660fb2662aa76d7da42bdba270ce1f963ae59388c19152100429b3b017b61b2698e4ef454c5ac337d0e91fec9247c3a0132719c3552288e59c636519587fcbbd'
            'bf10b746bbf1ea25cccaa7e96416c83392acac0cedc7e036c02f2f3bcc874e4bd5f9642c073d1835d4914560931a30bcffe9b3958bd36b51f48cbf0ee9d84050'
            '78450aa72198434746218f58d83f171bb55f9de4293f38560c95983075770140db866700758ac1c76beea402e3769bf38d9955dae2882aeee828e100b2245e00'
            'dd1e6606e00e94c1e36b47780ff8e031193cd3bbc6d87026927f4ec0273ed5f48bca71c224df2f65d37fce26ef78ef6d87d71fae723b26729c8a91a8d599b51f'
            '8f5268959233d5731aaf04216d6a04faf0b85c695945a099964505325a54b9ce21abf94cdbe38d7d0d5154dac2f5e4aa3423e6467c836dd7d5ed1f68b3bacdf1'
            '3554fb792dabbbb99fe7c3014d39b8ab51f704a66707ada62f3ae7c6f435b1f2197103b50f1cd50292d038ffcfabaf2b62117c7bc91ee0b56f41a41162c002e1'
            'bf95bb43fc0ccd1e38d5c2da31126648b70c6a12abffcae93dcf251fd66333db2b18e2bb08ba9f278b872e4f239069a1c3c4a7aa4a37f8c7168a93e785f11c0b'
            '402c115f7b6d57e1a69898e1e83ef81daf301f0a9266b2d6760add9df7f7dd4071ec9e73c2a28e2dcd9d6d77f8d64666432e86a8c050a5bfb0d97993f6b83016'
            '8213683a699faaa1b3d88d8b21fe3be2a94aa766aba530fd5efe7f42eaf8d1974147643714e5e9a61d69902998d54955decc34cfc84e547dad2046f080ed1257'
            'eb95d2bb9684099b1f4b7b06e8a7899fa8e33350ecfbd26f2906fcf8430fb603382be26b55c64f42a779189f9daf1ff94ca3413cb839bc519475485c8063f976'
            '6e610db0069bae081ca4ad76e07d340d3517de12bbf0d83ff9f81877c4edda18656338d952b3cae97daab573bb25dbd4f5963ed49c5f580635f63e11b418cbaf'
            '191e0bdf6ada2ccbe8a694f4dc161701acdd53dbe56b288d32f75c3272306dc5725570570fd401d0a48a7492f3d3770c8311ed6863343bfbdd11dde221c4a277'
            'e7331fb595324ad6707063d8cc88826306ec0ec33fc319cf057481c621db06ebaa8704f0148a25006c236bd9c2c292d3080f7c8800643fdefb219e1e9e6852b1'
            '353c85b68d6bbb8abbf797ef9577f49d85d4f6c5611a9700bb4eb9a4fb321d075ce9bd223c0a05c58bfe6b0cbc314165aad337bd359600dffbfc04550c14c222'
            '6f41272f8ad815ac51ef566abc565a944481bf752cdb44ec88267a15280a11489002fd50b026f2bf21e279ee6442513c13638e0570beeb307018064849bf562b'
            'ec843a58238190ce9b1312c6f712a67a37c3f80f48d93d77af3d1d0b136f644bdcfdb5e7bd0e827513c223d3c5e951e227fac14f9c5b6c74c318a6db8c860038'
            'e538f88b0c2d316661b5580e22b611212695414f905669e9fc0bd31c51ebb77b1ab58ce76b94c4ca618bb17fe7bc33a8b8991d4cc431ed36435f3fc922644ac6'
            '31473d0451332e0438b9e397b06ddb004211213246306cc2ca98361de98aad7bbc74233d011274133d22e7cf5d215eb7e279e923f3d47d3ad83e400942c5f34b'
            '1f2e769f03c9376574b78e3d120191ab95e4c32d0c468a58469760957fd082c5d3d57390038c388a3c0f28e8a3ff75c5931cc502b13120311d201fdd63182097'
            'ad33c3fda940839799cf732ce5bcfdd42ad4128f59100aaeae82895ef7e39fa8fb80ce199ab0ed9ba377251e771af4112fc7e3bdd3178ed61f9bbda593e4cce6'
            '22cefe175c694cc5318394e904ab9fdebd739d34ef1e305dd77fb2faaa899ceb90501a8eaecbfc9cd9a0dce615b2baea6f1612f542ba5dfc6cb74269214691a7'
            '1ba60f516bec90cba82b5bc61c1c7392995ce55a45a26e9d3e70cf67c8ef149347f71c715067abe4c9d2dd1d08d2962c638ffb4e24f9999a0788f8add41e3623')

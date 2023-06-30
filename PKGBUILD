# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="pce-git"
_pkgname="pce"
pkgver=pce.0.2.2.745.g9353360d
pkgrel=1
pkgdesc="PCE is a collection of microcomputer emulators"
arch=('x86_64')
url="http://www.hampa.ch/pce"
license=('GPLv2')
depends=('libx11' 'libxau' 'libxcb' 'libxdmcp' 'ncurses' 'readline' 'sdl2')
makedepends=('git' 'm68k-elf-gcc')
provides=("pce")
conflicts=("pce")
source=(
  'git://git.hampa.ch/pce.git'
  "${url}/rom/atarist/tos-1.00-uk.rom"
  "${url}/rom/atarist/tos-1.00-us.rom"
  "${url}/rom/atarist/tos-1.02-uk.rom"
  "${url}/rom/atarist/tos-1.02-us.rom"
  "${url}/rom/atarist/tos-1.04-uk.rom"
  "${url}/rom/atarist/tos-1.04-us.rom"
  "${url}/rom/atarist/tos-2.06-uk.rom"
  "${url}/rom/atarist/tos-2.06-us.rom"
  "${url}/rom/ibmpc/award-2.05.rom"
  "${url}/rom/ibmpc/ibm-pc-1981-04-24.rom"
  "${url}/rom/ibmpc/ibm-pc-1981-10-19.rom"
  "${url}/rom/ibmpc/ibm-pc-1982-10-27.rom"
  "${url}/rom/ibmpc/ibm-xt-1982-11-08.rom"
  "${url}/rom/ibmpc/ibm-xt-1986-05-09.rom"
  "${url}/rom/ibmpc/ibm-basic-1.00.rom"
  "${url}/rom/ibmpc/ibm-basic-1.10.rom"
  "${url}/rom/ibmpc/kyocera.rom"
  "${url}/rom/ibmpc/olivetti-m24-1.21.rom"
  "${url}/rom/ibmpc/olivetti-m24-1.43.rom"
  "${url}/rom/ibmpc/phoenix-2.51.rom"
  "ibm-xebec-hdc-1985.rom::https://minuszerodegrees.net/rom/bin/IBM_XEBEC_62X0822_1985.BIN"
  "dtc-hdc-1988.rom::https://minuszerodegrees.net/rom/bin/DTC/DTC%20BIOS%20CXD21A.bin"
  "${url}/rom/video/genoa-ega-2.41.rom"
  "${url}/rom/video/ibm-ega.rom"
  "${url}/rom/video/et4000.rom"
  "${url}/rom/video/ibm-vga.rom"
  "${url}/rom/video/mx86200.rom"
  "${url}/rom/video/tvga-d3.0.rom"
  "${url}/rom/video/tvga-d3.0-pce.rom"
  "${url}/rom/video/tvga-c4.3.rom"
  "${url}/rom/mac/mac-128k.rom"
  "${url}/rom/mac/mac-512k.rom"
  "${url}/rom/mac/mac-plus-3.rom"
  "${url}/rom/mac/mac-se.rom"
  "${url}/rom/mac/mac-classic.rom"
  "${url}/rom/rc759/rc759-1-2.1.rom"
  "${url}/rom/rc759/rc759-1-5.1.rom"
  "${url}/rom/rc759/rc759-2-4.0.rom"
  "${url}/rom/rc759/rc759-2-5.1.rom"
  )
sha512sums=('SKIP'
            '64a90a40473ef340c429a76f12b23c4d7cceee808abc23d8cd54a977afdef7ae8a96918462450aed9b8dce578a4690982dd21fe39ac69e60c780bd90fbff11ac'
            '2fafd22868033fb6e0c01644dc7b70ef4155ccff909eae6e1ba882087134595afde21f126d37e4bdda343eeae54580e4df7d9b7ba6f917cc61dcc9e9aa4996f2'
            '239eb6469a598e246515524a29bbdd0bb304c6ee8d4cdfcf9efd674daec6fb319ce94470a96a2eb9f68be3c76b709360dd7a31a9c90ee8808fa10e9296f9483d'
            '1796832a5b637158ee16276a174c7f07b874677e7fd529f418fe233f4009f43d00bbacea2a96c5286d05c67dfe3a2a14726b4e05848d0a60ca2d7d02b86bde47'
            'ad07b532a5f537b18062848b6c7a194b3dc70a497330170c320f0207cdc84b1c78f036d8e0ebae3d61b268df5d7f609dd8844d0491de918a072c4ade7f7b925c'
            '490f767fdd31413ca3e320c9bffeb1c9051e83059915010b2240b318ce6677f244d13a56b02e699f435b8723fc2589a60958a261688254e7a5f62d9f66814d1f'
            'f5bd6f269773c81149f4c1b43b0cbce463e35bf0b4e124e6572c6a4b576ad1de2fa22ce7ff077d81f60f9e325de54609de69af3001dc6e929c93fa383106ccc9'
            '79dc9eae40e317c9251a281092980987cb859f7cc69abde81ba02c14130c5517620ff42f17780ab94bd0ee91cea12214ab68114fe4d4c05f7396ea73921a1b83'
            '81d9d97174b8942924afee716194b691ac4c0c9ca00dd99eac4a2124fd609c71f1fe4dffad46cff81e20cfcddfb1017bbfe2a4caa686f34ddc680a56e551766a'
            '366950c33e43be522e81180c4818ab044d1483919b637518a441bc790e3d196d80cfcb2c0df9b36da4994ff9964446290afcc43c312260d8f6ae050da8a8c0ab'
            '6725ba56b74d63b0a84ec4d28df8fc9375f919ec2a47b31265dd614e1abc8341a7e63e530563844db94930f74188630df41c861a997db6688981c6dbecefc0e8'
            '2b5906997f61d332c6e36f5b01948ee200a49902a43068caae95c3a519e4fcc22c6c8ebd69a6a1a68713902813758f9377de0816c3eb13102e51cf6794c32cd1'
            '92b0aa92c88e6d76e01a7e9ed99d875243bc5eea2e6e1e70d59a92c5c931fe8dd9ac3309bff2bd76d270602bf065b7ccbd53e46a05c968fb2613bc9916fce073'
            'b4b6425bc30e80b273d51566b60294c7ab3b28e15c48694a6a4af2fb4cb979a2c85f0832f5cee2da4231cf851466ebf7240cabe4a12d992a00535d28cc117950'
            'e88f3ab83554362b748501291e2a1c926997c7ce3df9d9cc2db39377503b2920636a885ba8264c3d1d5b6ae180cce4262bcce7a5909d12db5d9f7f0c82f5a8e1'
            '4f791625aaa94ecd76b41fc00e91deafbe15bae3e65e7f9aaff689f509d3c7592cd23752a0c53017d0d0a3f09daebcf84920d2c9e301ea67e1666db9788ffc7f'
            '105d4d2e4fd0d52b745914656618d5d3dcecc6344df5014c21312e0da03155d1640b1d78308f34f3600ff7637f22f8b4ac1dd178d782772b611996525dc2ef0a'
            '92aa9a9194faec03302643897ad171a92dc6ea16227015165fb39da6003a583154f43e815ba60fc4596127ee171c436bb402604894acb1f5f574adf4e15a5fd9'
            '8aeb0f6b2f8ce87408c92263e451098fb52b94c1b41a1ff67eb817d147384e5a794065e99754c707c40e1be4e1f7ccd7ac6994c49caf2cb98fac30200e5368a6'
            '635d8b139ff36983f9ae2b49531ba2ffeca3b66dc9542d83c97c310dd4c4e35dccba3277d6e3ad54c715d25c838e7ef3f06e38f284f2f9b62efb9a726c3d8217'
            '9cd36a7093641bf72e09be9304b078300f9c0974946ff8b57bcc5aedb9b9327b802512b9f1b08aa2f8698fe96d5e547370e36bd8180ca7f783af13967731b32d'
            '05a72240100ff7786fff87475356faa3c257aa91029c1b1f3846352e38a91a0c63f03a4c430cb5f1d07b14a8a6c93ae1425017951f469b302753245f15646681'
            '35aff116315101b3a1e59de54738c1c0ba414f7a7457715bce3788a8baa606a3dda8c4db42216377f4b1df115d1030ef7be621de68c136f5f1b6ad52e14486b3'
            '548aae007f70c8265486a7281b6bca0eddf54847ee10b442bed7b706c1a0aae020991e129f4be254256fad8ae9db75f237387f94afc7f3d6a1460863513ab667'
            'e068735c54692857976594c2d09a08686d9f72984304d084cfda8ec0eba66b5ae7c489c6098f8feb9582a14123878ded2f01a0e5a02d97fe088909d85f4f1ce2'
            'a6d76e57273094b27bc5627b63d5fd9d4ac040117707752ec61ccbbaa4aa03151f18b1748dcbef1700f45173a6ae4bc68d942a3f11f7c078a4fde975967d706c'
            '465ad5f9602920ecf9eccd369c80d8a8c1d1d5611399029d9d9bf5199e7f62825e8af9c3e02c282b7632c6bf67c372b1f349fb811fd5e49030f1abbbb567f6be'
            'c0cdbfa2d644bc34f3225c96e927049d3e1033e7c6bdd22fe4dbeaec77160d352ddd4eb037e8c605a56d271dc99b458d05751fa01ba7b7aa247c624dc1c77171'
            'bad26908b54caa6dc8f9a9de40964a50eb2ed80eabe32c4c8f4a72f9d06d978b682fcec3cf61a1a4574f70e72bb6b4027ebde261757ccc9cf8efaa968f8dd2ed'
            'e659ee7ae0eddb906a7914c61a514e9b8016e7d2d87ec57bd8efe2d7794482d48d7cdb9fa8ba53c0d298fbda2670ba126a77c5f285a37123ab214db2d542dc67'
            '42930d97e265b45eb95b18ec85b934511846bc0b1523677f96d5e58cea25d19817293bbe1390201e531c34295ab176cfb8d6f8f76fb7b83e99a44849130864eb'
            '5d23e746b8648f69a16dfdc76590dd99ecccaf077f791c402abaf2f30f9c30446bf9216b20f512d2af477754994fdc42b20feeb6cc1a1b44653b4c5d6d575678'
            'db2a342e841bd457bc7e66dc25d7654ea8014408d731a83aada37ac6fe6ba910b9b55987e96443b085d1cdd589e70ef79dcb8e1e37c87261142296210e7dbf73'
            '889707a7067bd91e440a635c4009fb779e6d81a215903466928276f617ea28ca914d91f7d346a6416dc65d24e4a1710c8c8e9afd2a288fe24fa48df30672e2a8'
            'a5617e924e0f36de73e756c84241c92d7540dc3eeb2493a8f89eb0f067b428c71fbe1053b57c5529e91f7d6478b5121d881f06dce74f3e8f7b16f7447e6e5382'
            '7538472a1abd85cd4635d2301e7a2add24bf808ad8d2d2e6b38ee18e0c1971f35fd71450f10c17f1e22c6dbf30fef038dc7dae383ca94c9bfe78224f750711ad'
            '0086c238b47df27a92d6b42e3b7288e38fd8cdfa7fbe8683e4c875bdc2497b5f3642eb95dc75d0912272e92da428bdcc5ff5576c15c87a1809df35b9bc09b106'
            '3926e96914e55f977c5da397671a84523e14a93e1d0d0ae46df8466e4a7da42ed146bb2441bfc88445083fa6d9e339cf9b734489ec29ac7b7c71970ae4405504'
            '61e5402000725497b26fc608161c222ad945087638c245b8e20ec475d880c826658627f404fc05d1cc06a0e348ab6be6812c883a6372531f0f053f04babe65ad')

pkgver() {
  #ln -sf BambuStudio "BambuStudio"
  cd ${_pkgname}
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "$srcdir/${_pkgname}"
  ./configure --prefix=/usr --with-x --enable-ibmpc-rom --enable-macplus-rom

  { test "$(nproc)" -gt 1 && make -j"$(nproc)" ;} || make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir/" install

  # fix location of example configs
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  mv "${pkgdir}/usr/etc/pce" "${pkgdir}/usr/share/${_pkgname}/config"
  rm -rf "${pkgdir}/usr/etc"

  # install doc files
  mkdir -p "$pkgdir/usr/share/doc/${_pkgname}"
  cd "$srcdir/${_pkgname}/doc"
  cp -r * "$pkgdir/usr/share/doc/${_pkgname}/"
  cd "$srcdir/${_pkgname}"
  cp AUTHORS COPYING NEWS README TODO "$pkgdir/usr/share/doc/${_pkgname}/"

  # install roms
  for rom in "atarist/tos-1.00-uk.rom" \
             "atarist/tos-1.00-us.rom" \
             "atarist/tos-1.02-uk.rom" \
             "atarist/tos-1.02-us.rom" \
             "atarist/tos-1.04-uk.rom" \
             "atarist/tos-1.04-us.rom" \
             "atarist/tos-2.06-uk.rom" \
             "atarist/tos-2.06-us.rom" \
             "ibmpc/award-2.05.rom" \
             "ibmpc/ibm-pc-1981-04-24.rom" \
             "ibmpc/ibm-pc-1981-10-19.rom" \
             "ibmpc/ibm-pc-1982-10-27.rom" \
             "ibmpc/ibm-xt-1982-11-08.rom" \
             "ibmpc/ibm-xt-1986-05-09.rom" \
             "ibmpc/ibm-basic-1.00.rom" \
             "ibmpc/ibm-basic-1.10.rom" \
             "ibmpc/kyocera.rom" \
             "ibmpc/olivetti-m24-1.21.rom" \
             "ibmpc/olivetti-m24-1.43.rom" \
             "ibmpc/phoenix-2.51.rom" \
             "ibmpc/ibm-xebec-hdc-1985.rom" \
             "ibmpc/dtc-hdc-1988.rom" \
             "video/genoa-ega-2.41.rom" \
             "video/ibm-ega.rom" \
             "video/et4000.rom" \
             "video/ibm-vga.rom" \
             "video/mx86200.rom" \
             "video/tvga-d3.0.rom" \
             "video/tvga-d3.0-pce.rom" \
             "video/tvga-c4.3.rom" \
             "mac/mac-128k.rom" \
             "mac/mac-512k.rom" \
             "mac/mac-plus-3.rom" \
             "mac/mac-se.rom" \
             "mac/mac-classic.rom" \
             "rc759/rc759-1-2.1.rom" \
             "rc759/rc759-1-5.1.rom" \
             "rc759/rc759-2-4.0.rom" \
             "rc759/rc759-2-5.1.rom"; do
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/`dirname ${rom}`"
    cp "${srcdir}/`basename ${rom}`" "${pkgdir}/usr/share/${_pkgname}/${rom}"
  done
}

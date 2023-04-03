# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>

_brotli_ver=1.0.9
_openssl_ver=1.1.1s
pkgbase=edk2
pkgname=(edk2-arm edk2-aarch64 edk2-shell edk2-ovmf)
pkgver=202211
_commit=fff6d81270b57ee786ea18ad74f43149b9f03494  # refs/tags/edk2-stable202211
pkgrel=3
pkgdesc="Modern, feature-rich firmware development environment for the UEFI specifications"
arch=(any)
url="https://github.com/tianocore/edk2"
license=(BSD)
makedepends=(aarch64-linux-gnu-gcc arm-none-eabi-gcc acpica git iasl util-linux-libs nasm python seabios)
options=(!makeflags)
source=(
  git+$url#tag=$_commit
  $pkgbase-softfloat::git+https://github.com/ucb-bar/berkeley-softfloat-3.git
  https://www.openssl.org/source/openssl-$_openssl_ver.tar.gz
  brotli-$_brotli_ver.tar.gz::https://github.com/google/brotli/archive/v$_brotli_ver.tar.gz
  50-edk2-ovmf-i386-secure.json
  50-edk2-ovmf-i386-secure-4m.json
  50-edk2-ovmf-x86_64-secure.json
  50-edk2-ovmf-x86_64-secure-4m.json
  60-edk2-ovmf-i386.json
  60-edk2-ovmf-i386-4m.json
  60-edk2-ovmf-x86_64.json
  60-edk2-ovmf-x86_64-4m.json
  60-edk2-ovmf-microvm.json
  60-edk2-ovmf-microvm-4m.json
  60-edk2-aarch64.json
  60-edk2-arm.json
  70-edk2-ovmf-i386-csm.json
  70-edk2-ovmf-i386-csm-4m.json
  70-edk2-ovmf-x86_64-csm.json
  70-edk2-ovmf-x86_64-csm-4m.json
  80-edk2-ovmf-ia32-on-x86_64-secure.json
  80-edk2-ovmf-ia32-on-x86_64-secure-4m.json
  81-edk2-ovmf-ia32-on-x86_64.json
  81-edk2-ovmf-ia32-on-x86_64-4m.json
  82-edk2-ovmf-ia32-on-x86_64-csm.json
  82-edk2-ovmf-ia32-on-x86_64-csm-4m.json
  $pkgbase-202202-brotli.patch
)
sha512sums=('SKIP'
            'SKIP'
            '2ef983f166b5e1bf456ca37938e7e39d58d4cd85e9fc4b5174a05f5c37cc5ad89c3a9af97a6919bcaab128a8a92e4bdc8a045e5d9156d90768da8f73ac67c5b9'
            'b8e2df955e8796ac1f022eb4ebad29532cb7e3aa6a4b6aee91dbd2c7d637eee84d9a144d3e878895bb5e62800875c2c01c8f737a1261020c54feacf9f676b5f5'
            '9182615c6f89e4f3c19f1b0f4434aa0a3293f982cf3ed783a2c140c2555d824b417c7c3c7a00ad10616188507f5068226c720b20ffd41d44449605ba0844bad2'
            '53604279dea69000cb036062d9617f1c7dc5ce3d83fbcb066b9087e4f412c2ea24ae3a37436ab17d5bf9dd6b2da380933c48400163d4b9fde65ea42d37956d5e'
            'e2e5f3eabb3ced681385ed9d57a3aa83e2155415ea6fd2c16eb15c5a1e685f92e90f1c6f270c1c8da23dde3a0e4a085399f65038b799430c713d1628eb44ac07'
            'c1f83b3c5f5c43803d4bb1084f6ebdd1987364cab59945a8226a8cf1229daba79c83f638c0a1395ea56acffbd4349b94459659705743a397ff03369b7794a1c6'
            '25df19b698081c7a21e4c5f37321150ab2f144f4888d887513c3ed926a844909cee390d3e5d80b02c084510074c874b21db3b3d119330342cf8877197ef0a425'
            'c886b3d6e5f23833c2dc9f8c9f3b21523c680dd2c6bfebbb488f54619d31e53d4019b05b4e1a3dc91abd6e0cab4540d750a2db1b9b4dcf8257e4ba9a2b9b487a'
            '99f5dcdbc54824976f51c45b939e8bcb4971a70dc2d50b24233d3125ce6cf687f92b8d3896d72280470a2c001637920da8d6e33d576c489beb7f0e898bfb22ab'
            '9da9de6717b610a181be8f7b34b379a56a1fa31f945f78198eec52359abd178bdf77fda4426157992e64329f53a204af042d5145cb5d3b4b1203915a48815449'
            'a86e294e5904f52441b86da220f37cc693d7066f7fcb75dafc472a3a72516e865c213be6d0ce245ec5dd680ca9272429d39dca4db4f3e6434b12c479227bc4b0'
            'b17d3ff5c9230c394ca4ee8229842c801b0cab3d88b546f2094dd0b42f2bc535f5bda3f9faee4b5418482185887648f906daaf0b7307c4c19747f5f0ab504f9a'
            '126822ef6198e87fb38014a5ba21969c9a163b41df3cdef6825317971ecc8df4a63099113e687634b88648acc93f24917d729e1c44295d2df7012288740307d3'
            'bbf663d539a985504d5fbc95552a2a60ac860a6bce4a62ecc551292d838b41cba3b5203f580a76a05e9f862ef98e7a3e5da39505c1f39d8ef48c08778fac584a'
            'b5829aaf5ebae0073de26695eddbda61d117fbfb5e3c9f169fade31127ceb9bbc332af760bf6033d90a277d44c095fc30fe0d69defd81fb1aaf82cba0cf6fb90'
            '2e03935b57fabbbac4493ba6d54ac5b68abfd75775a56c95f5ba8c4627ba38260a3691a335e597c65096c50ce5038389efbb41ef5822a1ff49a8f312d8e37f75'
            '6e91029d451c9d43c1488ce0e252e6abc18fb1da48b6938d6ae3644fce58c97da6fff6addc60740b1b9ed5e6b86e9d7e94ee0dd55ea73833a82401b4c6f8c936'
            '69ec9e9288aad64b585bbffa8566a96a43791c4f899b9e9ba4858645ffe667423cd875ec8d6bed742cc1b1a9e96c8dd81609ff0f48da86b415ecf8cf8089cac2'
            'cebf9c2cfe8ea7007c68112b4e64d61a98a1637d4b51bceefa22a205e57bb947c757cea8dcc2d01961d8b72b4f289f692d4034d3c38f062e06941b2cc4586377'
            '95661c2182112a76652507de84b7d0f9bb0d21f6b3b62134952bd7aada8df5cfc727658d11b71a7780a22049d9cafc4361d9a1d515b68d1463e7082465fd4f7e'
            '8ed6d1d749c3471421a02c41e0e8c3e1ceb62ca6bc09cf2bc85055e2b2661bc149a77b83f480af1aec2f9a948971c6b5aebc92fbc112508fc6293cc6edc7a8a7'
            'c9dbe7b2b6b8c18b7b8fdfef5bc329d9142c442f2f3dbae3ca4919255dcaf2ab576cd305648228d5dd48040ca3b14f44ee33b05cb6ca13b49e2836947b78ea53'
            '692e5bdefb61ae7b8d6e2063f163e2b68136b2522d606806766186f10c5fae1f7583fd83cda52c235d0d8eb0651e5a711f505021a8d8d949d8dccfce7f0c82ac'
            'c699ad500f24569643a4581f4bb5be0e4a90d160f0b3ae7728cf8e27b39665983b80439ca7b853b1bd9a174c8c123cbaf7ed3cd4a17d6460f4fec670c62a1183'
            'd074c794796d17d77eed7c34201d93d7ef3f1322fe1ea4a2ddd7137fae884d49f94f465ee39cfd8346b026142668a41f5a8671e521409505dd6d002f71c0eebc')
b2sums=('SKIP'
        'SKIP'
        'ecd19eaf84dbc80448b51651abe52a89cc0052f024537959c4ebe61528988f235d661244fce6967159a876dd038c817bad19df742e828ca1cbae97ce6a4124bb'
        '8b9939d5224396ef33b43e019250ba4bc8949903583615e8dc02c85340fc0a1e2d1632161e00b0ee7355d77f05529ac772f482e05d2089afd71a0bf71e803904'
        '98742b83c2d605772a1bfa64ee434430413516db13d80235f0bc0be3a0e930aa17d737a6d2c95ce3d60f33de9f93679e09f421632d9e3fc9575d662fcf198f4b'
        'ee28940a8d13a7badf94bcceebd4371c79cd0194ca9f984f39cd75ee64f1ba53059d81f5826c6b5a564d50dce7b9fb5fe8d63ee8d38d38462bc070249124a16b'
        '8dfd44f35d35d699bb12eef771b08b978cf38ba64494b0eb8c153c72493d47c2d71445869c8d9115c29b28cd206f31be27b43024bd8796a50c8c41a67f87a859'
        'b9a488c2a6295f3d8eab80150dbfa7acea94720b08928d4e6a4613189fe24922f6c40e1ae8c9856ebb1bc31586ecfb1e02e099a11f7abde575d1f9aa78cc732d'
        '0a30e819e63b09207c664beca8845f73fb43482d19e831c7f915755594eeafcfc8dccb842f819fb7d20215d87452da31943488e201b9690b733db8169870afcc'
        'd5d3dc38bf8a09473075a2dd8ab4adcd3af80be30c0ae49fbf55f478b8e0d9a1fde90abceda7099ed3136ee9cadee406bef949a17a070be1b92250adb14c1a7c'
        'aa1144f31bd391e09d2bf0f55d6cb7a50fab38eca5967989463d58f2931267f7499414709c9692335376f8834b513d69249d995fdc9e90429eadd287348d57e8'
        '56562116024236f6bb5590fff241d47568a9c1755faa25a62011e8fa3f14b7d74014651b421f5a0c6fb269fb6c05f23b97a5b1ed13929e8141e1c3839f784a5b'
        'f55e220c6d6a8733bd9233115453e9aca10af91e4cd93be438b4951049198228bdd1b6765b2eae2a781cf3e90beab9b14540c9165ab76af38b9db35b09dde947'
        '01dbc4cad102535504eace2d9da225a481b62785d37365f1dea2d1210990ca6177485aa0134a074c09d253b539f12ae810706a77a46779ddb7dd4f1b9b934011'
        'f84ff505702e4b2a38b6fd23fbb732c25d3102a04bb6918b0cc3b3d7528a92626324199cea4ed91955aade98f308f1d1037255f26cc9ee21ace75fc6376e7df6'
        '04a7eb373d6ea1415d7cd6e8dea0d16b75cbb1fb88572a30b8ce9960dd0404adc7f25fce2ccfb103eb09405411dc4d4e0084236e4c814916d81e957dc6aedfd4'
        'b4fcc2351b2d77b85cdce35180353aef06900af1554479853bf915d27a756d4bbed50a50e85b72e2e7f4868e6dec3b9c5b27f743d7c112e24e4e0c50cd103a33'
        '1783b83c6e39c99feb59043c3cff48b24bef55d43949cd9a3097dfbee73a6cf511c180d610a52de876ccea9833fec46d7a88ebce8114e54620b9988232fb9bcc'
        '1d76eda20067c1bb9928b0304244ab5770a9c4e1f401a74d51da31a47f3a5d6e1e64b5394768cdae6a5bc396b68b6a32eb1a407e1c6377461dd2d5f2f5a2538d'
        '1debba4546e7cc7d758302a1b5aa3d0a874f39b046beac60e36ecf8aaf8a7690c97508f81fd40eaea807bdd8f4d6c8284e72d6bd61b0791db144a6adcc13ccbf'
        'c54eb05090280af70ceb44b601752ec38ca80d2af232385cf5ddd6f95ea0504d00a2dd2c82828aa07c41fb456fbb6f174b8bf89b851061206328ae66e589dd2a'
        'b53bbe532f9a7583bfbcc9436f2172f2dcaa75177c1480753a2a60d97a2fbd5bfb86b97b3f7c27d82e88eb2035c6607abb7e35d39a42e6a2d40c0b54d7c430ef'
        'dc9a98b8b6d6d8cc2f3aa2b314ba521a2fa8110abf199ca2a6c612ba53df3adad89e5ae0e4cfbe8f5ebf2cefd3cda1716d19f90304a138630f0b8d6e36cd4d10'
        '0c1e145109de9a25339633b563e47f6c09ea314f636023d09a58559a499dd0bd283a45e050fc99fe34c4d712bd00a035064fa8406734d57029c67b9adb4b11ce'
        '0ad956e3e662909abafd0b9a2b7ef12e35a8832183cb41e17dcafaa4f5db1e47ef20b3040268644daebb24f66c18b99de07f41e7d62089691c07de688a08f05a'
        'a44b5ffc35d78925ac7362ec2cf75475d02e05ed0b9e8771c909d090187aaff7436e8d856d58b8a56827990006b813c63318b60a8a7780844c829a2b13a502cf'
        '644c071dc4fbbccaa64b0b1babcad60395ffce1a7a317a6f5380eff44cbb886be5f29156a8e967ab02b508a33954fcf5602606b43362cc3bb1936a8cfc3a3c07')
_arch_list=(ARM AARCH64 IA32 X64)
_build_type=RELEASE
_build_plugin=GCC5

prepare() {
  # patch to be able to use brotli 1.0.9
  patch -Np1 -d $pkgbase -i ../$pkgbase-202202-brotli.patch

  cd $pkgbase

  git submodule init
  git submodule deinit BaseTools/Source/C/BrotliCompress/brotli
  git submodule deinit CryptoPkg/Library/OpensslLib/openssl
  git submodule deinit MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  git submodule deinit MdeModulePkg/Universal/RegularExpressionDxe/oniguruma
  git submodule deinit RedfishPkg/Library/JsonLib/jansson
  git submodule deinit UnitTestFrameworkPkg/Library/CmockaLib/cmocka
  git submodule deinit UnitTestFrameworkPkg/Library/GoogleTestLib/googletest
  git config submodule.SoftFloat "$srcdir/$pkgbase-softfloat"
  git -c protocol.file.allow=always submodule update

  # symlinking openssl into place
  rm -rfv CryptoPkg/Library/OpensslLib/openssl
  ln -sfv "$srcdir/openssl-$_openssl_ver" CryptoPkg/Library/OpensslLib/openssl

  # symlinking brotli into place
  rm -rfv BaseTools/Source/C/BrotliCompress/brotli MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  ln -sfv "$srcdir/brotli-$_brotli_ver" BaseTools/Source/C/BrotliCompress/brotli
  ln -sfv "$srcdir/brotli-$_brotli_ver" MdeModulePkg/Library/BrotliCustomDecompressLib/brotli

  # -Werror, not even once
  sed -e 's/ -Werror//g' -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile

  # copy seabios's CSM binary into place, so that it can be included in the binaries:
  cp -v /usr/share/qemu/bios-csm.bin OvmfPkg/Csm/Csm16/Csm16.bin
}

# TODO: check TPM_ENABLE/TPM2_ENABLE
build() {
  local _arch
  local _build_options=()
  # shared targets for all
  local _common_args=(
    -b "$_build_type"
    -n "$(nproc)"
    -t "$_build_plugin"
  )
  # shared targets for all EFI binaries
  local _efi_args=(
    -D NETWORK_IP6_ENABLE
    -D TPM_CONFIG_ENABLE
    -D TPM1_ENABLE
    -D TPM2_ENABLE
  )
  # shared targets x86_64 and i686
  local _x86_args=(
    -D FD_SIZE_2MB
    -D HTTP_BOOT_ENABLE
    -D TLS_ENABLE
  )
  # 4MB FD size variant
  local _4mb_args=(
    -D FD_SIZE_4MB
    -D FD_SIZE_IN_KB=4096
    -D HTTP_BOOT_ENABLE
    -D TLS_ENABLE
  )

  cd $pkgbase
  export GCC5_IA32_PREFIX="x86_64-linux-gnu-"
  export GCC5_X64_PREFIX="x86_64-linux-gnu-"
  export GCC5_AARCH64_PREFIX="aarch64-linux-gnu-"
  export GCC5_ARM_PREFIX="arm-none-eabi-"
  echo "Building base tools (AARCH64)"
  ARCH=AARCH64 make -C BaseTools
  echo "Building base tools (ARM)"
  ARCH=ARM make -C BaseTools
  echo "Building base tools"
  make -C BaseTools
  . edksetup.sh

  for _arch in ${_arch_list[@]}; do
    # shell
    echo "Building shell ($_arch)."
    BaseTools/BinWrappers/PosixLike/build -p ShellPkg/ShellPkg.dsc -a "$_arch" "${_common_args[@]}"
    # ovmf
    case "$_arch" in
      IA32)
      echo "Building ovmf ($_arch) with secure boot support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D EXCLUDE_SHELL_FROM_FD \
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE
      mv -v Build/Ovmf{Ia32,IA32-secure}
      echo "Building ovmf ($_arch) with secure boot support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D EXCLUDE_SHELL_FROM_FD \
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE
      mv -v Build/Ovmf{Ia32,IA32-secure-4mb}
      echo "Building ovmf ($_arch) with CSM support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D CSM_ENABLE \
                       -D LOAD_X64_ON_IA32_ENABLE
      mv -v Build/Ovmf{Ia32,IA32-csm}
      echo "Building ovmf ($_arch) with CSM support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D CSM_ENABLE \
                       -D LOAD_X64_ON_IA32_ENABLE
      mv -v Build/Ovmf{Ia32,IA32-csm-4mb}
      echo "Building ovmf ($_arch) default"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D LOAD_X64_ON_IA32_ENABLE
      mv -v Build/Ovmf{Ia32,IA32}
      echo "Building ovmf ($_arch) default (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D LOAD_X64_ON_IA32_ENABLE
      mv -v Build/Ovmf{Ia32,IA32-4mb}
      ;;
      X64)
      echo "Building ovmf ($_arch) with microvm support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/Microvm/Microvm$_arch.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}"
      mv -v Build/MicrovmX64{,-4mb}
      echo "Building ovmf ($_arch) with microvm support"
      OvmfPkg/build.sh -p OvmfPkg/Microvm/Microvm$_arch.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}"
      echo "Building ovmf ($_arch) with secure boot support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32X64.dsc \
                       -a IA32 -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE \
                       -D EXCLUDE_SHELL_FROM_FD
      mv -v Build/Ovmf3264{,-secure}
      echo "Building ovmf ($_arch) with secure boot support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32X64.dsc \
                       -a IA32 -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE \
                       -D EXCLUDE_SHELL_FROM_FD
      mv -v Build/Ovmf3264{,-secure-4mb}
      echo "Building ovmf ($_arch) with CSM support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkg$_arch.dsc \
                       -a "${_arch}" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D CSM_ENABLE
      mv -v Build/OvmfX64{,-csm}
      echo "Building ovmf ($_arch) with CSM support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkg$_arch.dsc \
                       -a "${_arch}" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D CSM_ENABLE
      mv -v Build/OvmfX64{,-csm-4mb}
      echo "Building ovmf (${_arch}) without secure boot (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkg$_arch.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}"
      mv -v Build/OvmfX64{,-4mb}
      echo "Building ovmf (${_arch}) without secure boot"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkg$_arch.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}"
      ;;
      AARCH64)
      echo "Building ArmVirtPkg ($_arch) with secure boot"
      local _build_options=(
        -p ArmVirtPkg/ArmVirtQemu.dsc
        -a "$_arch"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        -D NETWORK_HTTP_BOOT_ENABLE
        -D NETWORK_TLS_ENABLE
        -D SECURE_BOOT_ENABLE
      )
      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd bs=1M count=64
      dd if=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_EFI.fd of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd conv=notrunc
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_VARS.fd bs=1M count=64
      ;;
      ARM)
      echo "Building ovmf (${_arch}) with secure boot"
      local _build_options=(
        -p ArmVirtPkg/ArmVirtQemu.dsc
        -a "${_arch}"
        "${_common_args[@]}"
        "${_efi_args[@]}"
        -D NETWORK_HTTP_BOOT_ENABLE
        -D NETWORK_TLS_ENABLE
        -D SECURE_BOOT_ENABLE
        -D TPM_ENABLE
        -D TPM_CONFIG_ENABLE
      )
      BaseTools/BinWrappers/PosixLike/build "${_build_options[@]}"
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/QEMU_CODE.fd bs=1M count=64
      dd if=Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/QEMU_EFI.fd of=Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/QEMU_CODE.fd conv=notrunc
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/QEMU_VARS.fd bs=1M count=64
      ;;
    esac
  done
}

package_edk2-aarch64() {
  local _arch=AARCH64

  pkgdesc="Firmware for Virtual Machines (aarch64)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/ArmVirtPkg"
  conflicts=('edk2-armvirt<202211')
  provides=(edk2-armvirt)
  replaces=('edk2-armvirt<202211')

  cd $pkgbase
  install -vDm 644 Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/*.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
  # add libvirt compatibility (which hardcodes the following paths)
  install -vdm 755 "$pkgdir/usr/share/AAVMF"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_CODE.fd "$pkgdir/usr/share/AAVMF/AAVMF_CODE.fd"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_VARS.fd "$pkgdir/usr/share/AAVMF/AAVMF_VARS.fd"
  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*$pkgname.json -t "$pkgdir/usr/share/qemu/firmware/"
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # add symlink for previous aarch64 location
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/$pkgbase-armvirt"
}

package_edk2-arm() {
  local _arch=ARM

  pkgdesc="Firmware for Virtual Machines (armv7)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/ArmVirtPkg"

  cd $pkgbase
  install -vDm 644 Build/ArmVirtQemu-$_arch/${_build_type}_$_build_plugin/FV/*.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
  # add libvirt compatibility (which hardcodes the following paths)
  install -vdm 755 "$pkgdir/usr/share/AAVMF"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_CODE.fd "$pkgdir/usr/share/AAVMF/AAVMF32_CODE.fd"
  ln -svf /usr/share/$pkgbase/${_arch,,}/QEMU_VARS.fd "$pkgdir/usr/share/AAVMF/AAVMF32_VARS.fd"

  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*$pkgname.json -t "$pkgdir/usr/share/qemu/firmware/"
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_edk2-shell() {
  local _arch
  # minimal UEFI shell, as defined in ShellPkg/Application/Shell/ShellPkg.inf
  local _min='7C04A583-9E3E-4f1c-AD65-E05268D0B4D1'
  # full UEFI shell, as defined in ShellPkg/ShellPkg.dsc
  local _full='EA4BB293-2D7F-4456-A681-1F22F42CD0BC'

  pkgdesc="EDK2 UEFI Shell"
  provides=(uefi-shell)

  cd $pkgbase
  for _arch in ${_arch_list[@]}; do
    install -vDm 644 Build/Shell/${_build_type}_${_build_plugin}/$_arch/Shell_$_min.efi "$pkgdir/usr/share/$pkgname/${_arch,,}/Shell.efi"
    install -vDm 644 Build/Shell/${_build_type}_${_build_plugin}/$_arch/Shell_$_full.efi "$pkgdir/usr/share/$pkgname/${_arch,,}/Shell_Full.efi"
  done
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  # docs
  install -vDm 644 {ReadMe.rst,Maintainers.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_edk2-ovmf() {
  local _arch

  pkgdesc="Firmware for Virtual Machines (x86_64, i686)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/OVMF"
  license+=(MIT)
  provides=(ovmf)
  conflicts=(ovmf)
  replaces=(ovmf)
  install=$pkgname.install

  cd $pkgbase
  # installing the various firmwares
  for _arch in IA32 X64; do
    # installing OVMF.fd for xen: https://bugs.archlinux.org/task/58635
    install -vDm 644 Build/Ovmf$_arch/${_build_type}_${_build_plugin}/FV/OVMF.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
    install -vDm 644 Build/Ovmf$_arch/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
    install -vDm 644 Build/Ovmf$_arch/${_build_type}_${_build_plugin}/FV/OVMF_VARS.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
    install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF.4m.fd"
    install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.4m.fd"
    install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF_VARS.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_VARS.4m.fd"
    install -vDm 644 Build/Ovmf$_arch-csm/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.csm.fd"
    install -vDm 644 Build/Ovmf$_arch-csm-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.csm.4m.fd"
    if [[ "${_arch}" == 'X64' ]]; then
      install -vDm 644 Build/Ovmf3264-secure/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.secboot.fd"
      install -vDm 644 Build/Ovmf3264-secure-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.secboot.4m.fd"
      install -vDm 644 Build/MicrovmX64/${_build_type}_${_build_plugin}/FV/MICROVM.fd -t "$pkgdir/usr/share/$pkgbase/${_arch,,}/"
      install -vDm 644 Build/MicrovmX64-4mb/${_build_type}_${_build_plugin}/FV/MICROVM.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/MICROVM.4m.fd"
    else
      install -vDm 644 Build/Ovmf$_arch-secure/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.secboot.fd"
      install -vDm 644 Build/Ovmf$_arch-secure-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgbase/${_arch,,}/OVMF_CODE.secboot.4m.fd"
    fi
  done
  # installing qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  # https://bugs.archlinux.org/task/64206
  install -vDm 644 ../*$pkgname*.json -t "$pkgdir/usr/share/qemu/firmware/"
  # add symlink for previous ovmf locations
  # https://bugs.archlinux.org/task/66528
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/ovmf"
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/$pkgbase-ovmf"
  # adding a symlink for applications with questionable heuristics (such as lxd)
  ln -svf /usr/share/$pkgbase "$pkgdir/usr/share/OVMF"
  # licenses
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 OvmfPkg/License.txt "$pkgdir/usr/share/licenses/$pkgname/OvmfPkg.License.txt"
  # docs
  install -vDm 644 {OvmfPkg/README,ReadMe.rst,Maintainers.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}

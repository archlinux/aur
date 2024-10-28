# Maintainer: envolution
# Contributor: Librewish <librewish@gail.com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: darkcoder <mario_vazq@hotmail.com>
pkgname=os-prober-btrfs
_pkgname=os-prober
pkgver=1.83
pkgrel=1
pkgdesc='Utility to detect other OSes on a set of drives'
url='https://joeyh.name/code/os-prober/'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('sh')
source=(https://deb.debian.org/debian/pool/main/o/${_pkgname}/${_pkgname}_${pkgver}.tar.xz
        os-prober-frugalware.diff
        os-prober-mdraidfix.patch
        os-prober-btrfsfix.patch
        os-prober-bootpart-name-fix.patch
        os-prober-mounted-partitions-fix.patch
        os-prober-factor-out-logger.patch
        os-prober-factored-logger-efi-fix.patch
        os-prober-umount-fix.patch
        os-prober-grub2-parsefix.patch
        os-prober-grepfix.patch
        os-prober-gentoo-fix.patch
        os-prober-grub2-mount-workaround.patch
        fix-blkid-path.patch)
sha512sums=('b6a75cfa9cd71338e43597d3529a9f65cf210013f5b0e05a3e7aada6d33d391453b73dfc366e452538b13701be3e2eb00ad8e22da34ab108f60822c35ec46623'
            '91be47af6589d4e53ccc035475a64bb62ec7dd0d70966e1770b7ef2095ebaa3f94fabec41dbfeb8f22c0d5db0d1269a6bbeb7996fd08da256dc4a58d3121eaf7'
            'e4026689a647ab8f82defa31c6440ecf3754c6dca75e5921ee07e7a0a17adb3c56679a5c83be35ad1b382d0047fb50ebe0c897012c920e86c5eca5ab6a1eaa09'
            'a4e8b655725bd5d56d1a164f58d54061b0161f91ec601e655aa98f9ebff5a76a29082f6828a586e55dd0127bf4bb7e70d19ab53d7dc6c897f441a4f970a9e71d'
            '5411e3af0e64588d80a3327fff71626fc721e3b72a7bba1032278c905de01587743d7386cd39c33282789c73cec29d2051d19873fc5a121ed2fdf6ab8a1f65e4'
            'fe4e59f2c81e6de22acce7f429ddafd2c0ac1ff6f8826e26c6d286c7243d51c22817f1e2f5ce827bc7cba66016ed1a5b7ec24c888f1494119ebed886475f61c1'
            '417e487c6021d26753ea67b4fdb1adb1fa752d0627436ef5143ac46efa57a31858ee8303983b4919cb5b13ec5ac23eac2e529577230131cf16a66ba5b70c86cf'
            '1b870342befba4c48087965e4c5b5ed5ca69b01455a3c698c97e831074456047cb7ede1e11d0f476dcaa5572a59c7b4050c277cbb5624c53d5c7d74badc2d588'
            '282893fd430acf9dcf6fd530a66ab19c9b37576a219308bcbd6c5a3f9030d441358183afb5b43ed557f2caff730e737006dba7856951660e04f0ea7a38e61edc'
            '5addb8249fe532c7eda00d188251555488641c193a871430526633d2286e5f42ff98b2840d6998829a2d4a4ec3f1f25265d8439ae809b31c2f249f02a741089b'
            '85a20d7b7ba6376dff46576031347f9c2b41d58dbbd369e22e93a68572d418fd724e93493677666df388b04047d9dd413fffbb5a571a945d9662b7e38723c032'
            '112d56be81ebf0c00600c5bdce1ca998d75fde62239c70548b1b84578b9c7d90eef230b0d84c50ea119bef1a6db05da5d9976ec2ff99cf0ffe6090360de01d4a'
            'a93ce198faafdc8170aa862597f23736605bbddc987a5a02492fd97b449964153c2340947abb62d39738cc7611e1428021a9d6dba18828563121ff7adda60981'
            'fd38bc9b79d34dea6ab17ee5981ec31bd84a472497e6607fb78294e507cca90f811243932cfc6b3793815bab66fa42746b6d223dcdb940bc3e0e5f8906403b5f')
b2sums=('ae0b5884f28dc60622142e8e7004e40f15fc2cc325eb634306fed0bbfa431c22331af75f7e52bdf78f60a0842fb9398c7d95be792cb06397223dda7aa9d36a8d'
        'e2e1d069c56b79c65b310221d07e75cea413543416d5eee3c1b0d084d795bc33da1863081b0fce679780b19d0c9ca0c8d619b298ca5aa5eeec09daf1d3b03e30'
        '78ce30f144d83e3676c3d86afcdcad1643e09e089df5f460c33833adc17564ad267398588973f2b07b249f591219edab23c748167180f578e4f7b08e85c32d1a'
        '4aad146d474d6062e1b110e8468bb023a62ba3c4e6fe64526a5ddb9be8897eac2d8e8ce12d212f8f15e809641ac3b483c176c809b1c5ee4ae4900adc865ff0ee'
        '950eda643d4ea1882d6cce43fdbc809b995be2e12569eb1654f902021b8b25401164ff76deb34adafcb9587d111bab7ddff69bc47252cca6f7617c18be4e5004'
        '7c1c36f861f36bffa88f9a71f62125a8a697ce41896c3b626afce225f3b7e9117bcd56372bfb2987a8d20f6d0494935aaf4196fc78bf15dbf8ccfae85de63ed2'
        'd537ca8874c0b5a0210f698813f41eb8e77d37bb516e6fc8985e4cd17cae10bdc4d3837a30665badf845d0a3d12d2c953fbf1ef5e2721ca5bf68866908a11ffc'
        'c8644030aae2a007f3527d11d193230706e5001850365486ba171cda7057114705b239c01143a8bbc9f01cc80bd002ffba4edd9b35d5577463c6a32afc331b57'
        '8207b10e4d72aedb9f2154a6c3e0707e38e72f26feb5152d66f61a03a22d485bb60db26773a38d45ffc1c1a7f5d9a0dc2ac48e3580e73422bdafd7e7b7e1e45b'
        'e886e8dc5eced2161d2bdfc2b72a2a70dd627091221c31164dd41872a9b7365c62e19b2c1dbe135e62ebe8fbd7a0a750fbc938eee4ddeaf41a82e2380e2a68bd'
        '8dd033b3c2b3402a2bc19381e70347e811e0ace8f00890dc3f89f0ff3aff8a65ede8320549f82422823322e7b725ed5d44c24ab8c3dbec7bdf38340d3d0cb173'
        '02cd79dbb76b5c301f1ba05dc4763823cef0a8c136323246ad4e82988cf7c0be3e6e59efee5bbfbb450e66cf18e3426cf553fa48d6760ec4b1161173cda274ed'
        'ac4f64096934807d6486048ec6063563b18fa3887455d86da15d5c8dbef3be784caee101b7ee1da76c8f3dc9b6b2f5d9adf9ca9e108e2ba41846ad8d76fb2c9d'
        'baa8ae878639b6f35e68ad3136dc99f6e275dec895bd8a1864100e89964555b1cd4f2df66680d2dd81322fd70e3aa7adf4d9770b3c65d034ac08d865d751cdac')

prepare() {

  [ -d "work" ] && mv work ${_pkgname}-${pkgver} #1.83 has a packaging consistency issue

  cd ${_pkgname}-${pkgver}
  patch -p1 -i ../os-prober-frugalware.diff
  patch -p1 -i ../os-prober-mdraidfix.patch
  patch -p1 -i ../os-prober-btrfsfix.patch
  patch -p1 -i ../os-prober-bootpart-name-fix.patch
  patch -p1 -i ../os-prober-mounted-partitions-fix.patch
  patch -p1 -i ../os-prober-factor-out-logger.patch
  patch -p1 -i ../os-prober-factored-logger-efi-fix.patch
  patch -p1 -i ../os-prober-umount-fix.patch
  patch -p1 -i ../os-prober-grub2-parsefix.patch
  patch -p1 -i ../os-prober-grepfix.patch
  patch -p1 -i ../os-prober-gentoo-fix.patch
  patch -p1 -i ../os-prober-grub2-mount-workaround.patch
  patch -p1 -i ../fix-blkid-path.patch

  # adjust lib dir to allow detection of 64-bit distros
  sed -i -e "s:/lib/ld\*\.so\*:/lib*/ld*.so*:g" os-probes/mounted/common/90linux-distro
  rm -f Makefile
}

build() {
  cd ${_pkgname}-${pkgver}
  make newns
}

package() {
  cd ${_pkgname}-${pkgver}

  install -Dm 755 os-prober linux-boot-prober -t "${pkgdir}/usr/bin"
  install -Dm 755 newns -t "${pkgdir}/usr/lib/os-prober"
  install -Dm 755 common.sh -t "${pkgdir}/usr/share/os-prober"

  for dir in os-probes os-probes/mounted os-probes/init linux-boot-probes linux-boot-probes/mounted; do
    install -dm 755 "${pkgdir}/usr/lib/${dir}"
    install -m 755 -t "${pkgdir}/usr/lib/${dir}" "${dir}"/common/*
    [[ -d "${dir}"/x86 ]] && cp -r "${dir}"/x86/* "${pkgdir}/usr/lib/${dir}"
  done

  install -Dm 755 os-probes/mounted/powerpc/20macosx "${pkgdir}"/usr/lib/os-probes/mounted/20macosx
  install -dm 755 "${pkgdir}"/var/lib/os-prober
}


# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.11
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
install=openafs-modules.install
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-afs-Make-afs_AllocDCache-static.patch
        0002-LINUX-Minor-osi_vfsop.c-cleanup.patch
        0003-afs-Remove-SRXAFSCB_GetDE.patch
        0004-afs-remove-dead-ICL-fstrace-code.patch
        0005-cf-Add-function-prototypes-for-linux-conftest.patch
        0006-afs-Remove-afs_MemExtendEntry.patch
        0007-afs-Remove-afs_osi_UnmaskUserLoop.patch
        0008-afs-Remove-dummy_PSetAcl.patch
        0009-afs-Remove-DFlushDCache.patch
        0010-afs-Remove-SRXAFSCB_FetchData-StoreData.patch
        0011-afs-Remove-afs_DbgDisconFiles.patch
        0012-afs-Add-declaration-for-RXAFS_ResidencyCmd.patch
        0013-roken-Declare-ct_memcmp-in-hcrypto-kernel-roken.h.patch
        0014-Linux-6.8-Add-function-prototypes-for-krb5.patch
        0015-afs-Declare-init_hckernel_mutex.patch
        0016-afs-Add-includes-to-pick-up-function-prototypes.patch
        0017-afs-Move-function-prototypes-into-headers.patch
        0018-afs-Add-afs_xioctl-prototyes-to-afs_prototypes.h.patch
        0019-afs-Remove-SRXAFSCB-protos-from-afs_prototypes.h.patch
        0020-rx-Add-function-prototypes-to-rx_prototypes.h.patch
        0021-afs-fix-ops-variable-may-be-used-uninitialized.patch
        0022-afs-Add-static-attribute-to-internal-functions.patch
        0023-rx-Add-static-attribute-to-internal-functions.patch
        0024-rxgen-Declare-generated-PKG_TranslateOpCode.patch
        0025-rxgen-Declare-generated-PKG_OpCodeStats.patch
        0026-Linux-6.8-use-hlist-iteration-for-dentry-children.patch
        0027-Linux-6.8-Remove-ctl_table-sentinels.patch
        0028-Linux-6.8-Use-roken-s-strlcpy-in-kernel-module.patch
        0029-Linux-Remove-weak-attribute-for-key_type_keyring.patch
        0030-Linux-Define-afs_thread_wrapper-as-static.patch
        0031-Linux-6.9-file_lock-mbrs-moved-to-file_lock_core.patch
        0032-afs-Reintroduce-and-use-DFlushDCache.patch)
sha256sums=('e2efb4710996b7d23198b53c56295a8f9e24e8a555317c5fc63b8125a3714ecd'
            '8156fa6b024531b9c18d3727e4a7319eb270bb862c6f9ee44eabf6920bcf3736'
            '18f7fdd1c3a392f5b6c660d9eedfdf189ce19629da1c2f4e8197aa1198df9008'
            '863eba3beee07f972d478624587975fc997a78867e3f9cb2f4ab649bfabae0bf'
            '22c4102a0919b71af82ec8525c016b9692424f67ace207c225ebab838111d5cc'
            'd79cd75af56537a28cd15692af61c1f701527795dea789b85535976fb258f420'
            '9c0423ebc12378fff0595735510e80e0759895d3d763f1d6d364d6fc22d8d272'
            '58a2fbbd131a6d480ac1ede5a79c9ae90ce0a9edc81d66b4d3dede9980c662b8'
            '1aefdecb45083192fcfb76e8029404fb82295d1051699bea9cddc7c0be81e00e'
            '6542a046d99b304d716c6034aa468ebc7dc76e37507d328bb82b3797fef39220'
            'dff332541f05a125fd4b7713e8c6a2030fa9abf4ecb56e7b0c7ee554f73a9fa9'
            '8c59d49b409fde14538f7eab2efbf51f281e4ca977cb4658fb0197ae5c317aef'
            '45302b6323b76162d648883e52ae68cf95933e96697f58a4f2b948687a1e4d51'
            '0be51a38cc7208ecbf855880115fe797b6bef0005ff53391d2f7a636bb67eff4'
            '8882dec77cf6bac3c2022c3b32460f76988a736aa3312b3ecc1daaca4a8d601e'
            '3f7de2872cd90e50e103a3c388c9a4501e85d27041d4e696ca49a885b4ca7b60'
            'd750390ac3ef573793c44862b6f59302ef0ba6b2ba24bbded58dc70d83f25e47'
            'b31fd46ae26a2a34c5d81c77edccc69a42c8d0362cc25254730fddedb22753c8'
            '963b27b44402149159dd8f5c1e9821704cacd2a6de1fb2c8088bfb11f10d1c99'
            '09bac17f405b2f00d99278ecc441596aab1ac1dae80586efa86ade3d7806c266'
            '4b2de147029b6f91fdeeddb8276fbc577926378440d019f2a197c3b51517e6d8'
            '9354aa971f3d9e460ef3179347f8ee7f6c38597571f84d648a237a7edcaf4835'
            '067c31796977aef73747f85a85cb9045c4361502eb7f9d622aecf2dd9ed5b723'
            '063a8d942eb3a9f5a27780dd12b2dea2e67f8f3b35d7bfe2eedfe879ea2b1b40'
            '0072ef62a412e23c136bb69e67ec05bc802cc96636e9a0827cc3dd3dd43bc935'
            '3564c0a944f6e2478477105625809729e6183213b969fe2ed9b69483244c4be7'
            '072f7aa32c711447d794ad430b68475fdfa3e21e805dab640086226fbc328c66'
            '867086d1809b63a1e87afc7c3b440f6bccb39e6fbe40d05fc3a35aa5ecf4f1cd'
            '2ff01dbf33ebb7b3cb6e5be83a6adab906ae287836cc1584561144f5be63d6cd'
            '049b82cb0b1427d87460f703cf1926e4b86b386afed1e5ebc78d1ac61b0ca137'
            'fe36d327804d315cb54b4cedcb44631fe70044db6ce3ba88387698c4b91808df'
            '0a3f1b80d2312edfd9424e0bbcf943a13b049c9556778b600b103d11e9b62182'
            '32f0bda8b9a3a408af5247347e2896011122362584abcd03b5c63973bd863d07')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
if uname -r | grep -q lts; then
  # if you are currently running an lts kernel, only consider lts versions
  _kernelver=$(ls -dt /usr/lib/modules/*lts* | head -n1 | cut -d/ -f5)
else
  _kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
fi
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Compatibility with Linux 6.8 and newer + bug fixes
  patch -p1 < "$srcdir"/0001-afs-Make-afs_AllocDCache-static.patch
  patch -p1 < "$srcdir"/0002-LINUX-Minor-osi_vfsop.c-cleanup.patch
  patch -p1 < "$srcdir"/0003-afs-Remove-SRXAFSCB_GetDE.patch
  patch -p1 < "$srcdir"/0004-afs-remove-dead-ICL-fstrace-code.patch
  patch -p1 < "$srcdir"/0005-cf-Add-function-prototypes-for-linux-conftest.patch
  patch -p1 < "$srcdir"/0006-afs-Remove-afs_MemExtendEntry.patch
  patch -p1 < "$srcdir"/0007-afs-Remove-afs_osi_UnmaskUserLoop.patch
  patch -p1 < "$srcdir"/0008-afs-Remove-dummy_PSetAcl.patch
  patch -p1 < "$srcdir"/0009-afs-Remove-DFlushDCache.patch
  patch -p1 < "$srcdir"/0010-afs-Remove-SRXAFSCB_FetchData-StoreData.patch
  patch -p1 < "$srcdir"/0011-afs-Remove-afs_DbgDisconFiles.patch
  patch -p1 < "$srcdir"/0012-afs-Add-declaration-for-RXAFS_ResidencyCmd.patch
  patch -p1 < "$srcdir"/0013-roken-Declare-ct_memcmp-in-hcrypto-kernel-roken.h.patch
  patch -p1 < "$srcdir"/0014-Linux-6.8-Add-function-prototypes-for-krb5.patch
  patch -p1 < "$srcdir"/0015-afs-Declare-init_hckernel_mutex.patch
  patch -p1 < "$srcdir"/0016-afs-Add-includes-to-pick-up-function-prototypes.patch
  patch -p1 < "$srcdir"/0017-afs-Move-function-prototypes-into-headers.patch
  patch -p1 < "$srcdir"/0018-afs-Add-afs_xioctl-prototyes-to-afs_prototypes.h.patch
  patch -p1 < "$srcdir"/0019-afs-Remove-SRXAFSCB-protos-from-afs_prototypes.h.patch
  patch -p1 < "$srcdir"/0020-rx-Add-function-prototypes-to-rx_prototypes.h.patch
  patch -p1 < "$srcdir"/0021-afs-fix-ops-variable-may-be-used-uninitialized.patch
  patch -p1 < "$srcdir"/0022-afs-Add-static-attribute-to-internal-functions.patch
  patch -p1 < "$srcdir"/0023-rx-Add-static-attribute-to-internal-functions.patch
  patch -p1 < "$srcdir"/0024-rxgen-Declare-generated-PKG_TranslateOpCode.patch
  patch -p1 < "$srcdir"/0025-rxgen-Declare-generated-PKG_OpCodeStats.patch
  patch -p1 < "$srcdir"/0026-Linux-6.8-use-hlist-iteration-for-dentry-children.patch
  patch -p1 < "$srcdir"/0027-Linux-6.8-Remove-ctl_table-sentinels.patch
  patch -p1 < "$srcdir"/0028-Linux-6.8-Use-roken-s-strlcpy-in-kernel-module.patch
  patch -p1 < "$srcdir"/0029-Linux-Remove-weak-attribute-for-key_type_keyring.patch
  patch -p1 < "$srcdir"/0030-Linux-Define-afs_thread_wrapper-as-static.patch
  patch -p1 < "$srcdir"/0031-Linux-6.9-file_lock-mbrs-moved-to-file_lock_core.patch
  patch -p1 < "$srcdir"/0032-afs-Reintroduce-and-use-DFlushDCache.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --without-swig \
              --with-linux-kernel-packaging \
              --with-linux-kernel-build="/usr/lib/modules/${_kernelver}/build"

  make only_libafs
}


package() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  make DESTDIR="${pkgdir}" install_only_libafs

  # install kernel module
  install -dm755 "${pkgdir}${_extramodules}"
  mv "${pkgdir}/lib/modules/${_kernelver}/extra/openafs/openafs.ko" "${pkgdir}${_extramodules}/openafs.ko"
  gzip -9 "${pkgdir}${_extramodules}/openafs.ko"

  # install license
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove files already included in openafs package
  find "${pkgdir}/usr" -maxdepth 3 -type f -delete
  find "${pkgdir}/usr" -maxdepth 3 -type l -delete

  # update major kernel version in install file
  sed -i "s/depmod .*/depmod ${_kernelver}/g" "${startdir}/openafs-modules.install"
}

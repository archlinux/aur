# Contributor: T.Cunly
#
# This is based on PKGBUILD linked at https://hep.pa.msu.edu/wiki/bin/view/T2K/ArchInstallCERNLIB
#
# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=cernlib
pkgver=2006_35
pkgrel=3
_pkgver=2006-35
_atlasver=3.8.4-1
_atlascppver=0.6.2-1
pkgdesc="A large collection of general purpose libraries and modules maintained and offered in both source and object code form on the CERN central computers."
arch=('x86_64' 'i686')
url="http://cernlib.web.cern.ch/cernlib"
license=('GPL')
depends=(openmotif gcc-fortran lapack libxp)
if [ "${CARCH}" = "x86_64" ]; then
    _rpmarch='x86_64'
    URLROOT=http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/16/Everything/x86_64/os/Packages
    source=($URLROOT/cernlib-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-static-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-utils-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-devel-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-packlib-2006-33.fc12.${_rpmarch}.rpm \
            $URLROOT/cernlib-packlib-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/xbae-4.60.4-13.fc15.${_rpmarch}.rpm \
            $URLROOT/kuipc-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/g2clib-devel-1.2.2-2.fc16.${_rpmarch}.rpm \
            $URLROOT/compat-libf2c-34-3.4.6-22.fc15.${_rpmarch}.rpm \
            $URLROOT/patchy-2006-33.fc12.${_rpmarch}.rpm \
            $URLROOT/patchy-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/paw-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/paw-2006-33.fc12.${_rpmarch}.rpm)
    sha256sums=('c42d89fd5f0fb83bfdf3289258df9da798e50a1affbbe0e7fe0380eaafaabd4f'
                'b8bc35bb37dfe4bc99a616f05b52a5552ccb21409ece94e837c682091aa5bdbc'
                '60256c62f2cc5dcdf65890ee68c9864046c7b5b73834e5f15258657bebeb36b4'
                '26c064846afe42f2b6a58d43943e39d638e8970c6edb4d7ec54459964632ecb0'
                '9b6163ea25fe14893593edbe58798f6e31a24d28714cabdf7dd5d351c2e499b9'
                'cf96f5a827958a009643b7c88be75a88839674d37a355c16196ac48666c537c1'
                'cba27f64e9d9556442aa28765171493042dd40e0f82f9b93da83470100f9ff06'
                'e039df540a979c1243f22749714a2981e2a7dc916b2c423bb593fa3e2ea4a3d5'
                '8726c80051383b129328aefc89e8d7df00f319a867d9c803a5ee5dce7deb564b'
                'e3f0cd32c1d3c7acedc381a04aba6302b3291ef304078bb2c4e0c5e977a445f9'
                '04a325dfb17c0ee897acc74b84f8f7a8fb829e7041c67b2564efa0b6e5b529e8'
                'bb361215197864ef0878d1f8f52f4ee6d3302b1dbe76e5e7be1866e44f5b08c2'
                '56c6b4d3c4e614c1acfc29f0d845497a25cd8f65d9c7fa40eb47a803f2505cb8'
                'b4a79eb64c7765066e1216022693e7cdf37ab9757c13d8c304ed1c34cba5fc18')
elif [ "${CARCH}" = "i686" ]; then
    _rpmarch=i686
    URLROOT=http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/16/Everything/i386/os/Packages
    source=($URLROOT/cernlib-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-static-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-utils-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-devel-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/cernlib-packlib-2006-33.fc12.${_rpmarch}.rpm  \
            $URLROOT/cernlib-packlib-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/atlas-sse-${_atlasver}.fc16.${_rpmarch}.rpm  \
            $URLROOT/atlas-sse-devel-${_atlasver}.fc16.${_rpmarch}.rpm \
            $URLROOT/atlascpp-${_atlascppver}.fc16.${_rpmarch}.rpm \
            $URLROOT/atlascpp-devel-${_atlascppver}.fc16.${_rpmarch}.rpm  \
            $URLROOT/xbae-4.60.4-13.fc15.${_rpmarch}.rpm \
            $URLROOT/kuipc-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/g2clib-devel-1.2.2-2.fc16.${_rpmarch}.rpm \
            $URLROOT/compat-libf2c-34-3.4.6-22.fc15.${_rpmarch}.rpm \
            $URLROOT/patchy-2006-33.fc12.${_rpmarch}.rpm \
            $URLROOT/patchy-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/paw-gfortran-${_pkgver}.fc14.${_rpmarch}.rpm \
            $URLROOT/paw-2006-33.fc12.${_rpmarch}.rpm)
    sha256sums=('9c81ea4b261b80dd9afcdd7a18710bdc2efda42f7c72639d4edf26652d8d2b18'
                'dd30114ea87e8a90807c66568bb0d323853d3c778fbd16e13edef09175bcc843'
                '96598f5b18d72ae9774b77f2e029822e95534fdd32677cbdfda5e45572a822b0'
                '1333bd68da5cfb47ec3c5b1ffe9d076c0a1916ae06f88779a8aadd2e4bec7dec'
                '7f590a0e85e5325ae30c44e7094be8b853e260425e0db3686ee56125bca44124'
                '543e70cfa7209e6be90acad3c8d36415f6b5a59af2e9f611d66b350e0c17ae57'
                'f26a402e50320a8d262399f0527ec1eaf8abd1f0fadd7b51433d30128158e4b7'
                'aff9fd839cd897f359cd660f918699375e488fe3a21ef8a91f3ab8a4104acf05'
                '9308250700192b246e8f1dcade59b87eaa97db631061b27535026b8771429e81'
                '60b764a1a09a3698ec1e6a7bf4105e5d898bf8f18bf6a0d97efe0e218f1571de'
                '3c642d47796ec4b859b853bca4ba72907f4b2fc11ce82f6ba45e53e664b32e8d'
                'b1fffeb7aa9b9fd8bb9712113fcd0c29eebacd57a05f94e24ba164a04d36aca5'
                '7d6f7199b5e0c9b99bc2f48b32b5a2a0599eacf0d8f4490d29a06f0128c233bc'
                'eb88c04bc688f1aa4792d50cac22931d0a39a33efc76f22a652879092ee4406d'
                'ac7356526977e665c5d985f85b8976e547c1ba1d0358af4558cf89bb48df1c0f'
                '8574c92d59f7e2284f63f05ec2b6f7d87292d7e82ce327b1e65a16939ce7adbd')
fi
package() {
    if [ "${CARCH}" = "x86_64" ]; then
        rm -r usr/lib64/cernlib/2006/bin
        mv usr/lib64 usr/lib
    fi

    cp -a ${srcdir}/usr $pkgdir
}

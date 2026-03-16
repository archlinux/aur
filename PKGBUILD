# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Luke McCarthy <luke@iogopro.co.uk>

pkgname=nam
pkgver=1.15
pkgrel=7
pkgdesc="Tcl/TK based animation tool for viewing network simulation traces and real world packet traces"
url="https://www.isi.edu/nsnam/nam/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('otcl'
         'libxmu')
makedepends=('tclcl')
_debrel=${pkgver}-11
source=(
	http://downloads.sourceforge.net/sourceforge/nsnam/${pkgname}-1/${pkgver}/${pkgname}-src-${pkgver}.tar.gz
	# This is using Debian pachset
	https://sources.debian.org/data/main/n/${pkgname}/${_debrel}/debian/patches/1000-fix_narrowing_conversion.patch
	https://sources.debian.org/data/main/n/${pkgname}/${_debrel}/debian/patches/1010-netmodel_cc_void_int.patch
	https://sources.debian.org/data/main/n/${pkgname}/${_debrel}/debian/patches/1030-group_cc_void_int.patch
	https://sources.debian.org/data/main/n/${pkgname}/${_debrel}/debian/patches/1040-lib_underlinkage.patch
	https://sources.debian.org/data/main/n/${pkgname}/${_debrel}/debian/patches/1050-gcc-14.patch
	https://sources.debian.org/data/main/n/${pkgname}/${_debrel}/debian/patches/1060-const-string-literals.patch
	# Also my own patches
	2000-tcl_use_interp_result.patch
	2001-workaround_tcl_macro.patch
)

sha256sums=('12ed547b3a5f8903890889d40cfea4d9bd66bb9ba6be99a0c753a9763cad8882'
            '423ecf52bec01ab7dc63c61260af0784bb7e03cdefcacc38c0ea65dbfaaced26'
            '192fb6b30d6b1a8bd827b91eec6c46df4d6a7d5183a257fa00cf46cadb699160'
            'eddc177ecd4a63803f9fd09d6f0fd2b76633bc03a06659efa193975371ee80f2'
            'fae76b63bac3d287563347695ffdde44efa63774a67cf60ebc13de395dff03dd'
            '389d2801143fc224a08a861ba5390abb6d40809714bd60c51e12f08354177eff'
            '70f59974cc57645d884f25b652a9540b6204d5d808d7808e4827fd9097e9c828'
            '25146be15bf358656c64d1ec8764370b30f53d3e97f98089a707c015a52d2ef2'
            'acdbf725019d81b7407192ab0323f9305881925d83304da1f77b5f6b770ba720')
sha512sums=('a1c53c4117d913342f0714480e2d52cddf96107b541c995b5029c7cbd1eb708014cb59abb31723060384f52158727c3425e28ee9e6e0c73b828aed0029b6a15d'
            '78e32a9d74c98a6094e24f4155f899b384f98b74f53fac75dd13e16bd80a6fd0422f083036aed33910d256bac77076ba1ed38f7fd01dd320697c7f4a5b38a862'
            '057f718f8b7cfafea3bcd0a00cc6f54ed91376ddbd731c743eba0f63a9bbae7b4fa15995810be3dfa1038dfab5fc89bba7065e205df24110713925aba4477c59'
            '13f3ffd3743f3b2253423164a42c81f2fdd96e204d8a21471973d0dc62fb378b6a0dc01f4ffd52eaf9f778a96f1b8e5d301cb4cf8ee04dc3b13d84a29691f598'
            'b5bfd074afccc2d25a48bb7e8b3b5f271806df0f35a289e9eff53c06187598ffc93c47baec3830bf6da99350bdf41f95a7ce0f09d73270dcddd368de7fc81073'
            '8d96d99d1818a2f83b951459c0897a1fc296b1d17878abbaf3eda135a4fe6b06a0d8b2696905e2584cb73fb275b5502f60a3a71161a4c3e69929a03f660e6950'
            'ce3ecbbcb33ff3eac6aa4fe4fac6f7dbc8cd36eb8176990c445d4f6dc3971f932f56c46efb01551796c7468e9bbb27f2edb761919e3dba3389023fa1d0c7074e'
            '81c6a15f11c9e6096ae09f3c56a7af9cee053021ac6ee943bd352b1e1df27cce777f5d6bd987f52ee7e60436af4e9e083b283732f58e6bdbfa506fec0faa913f'
            'bad215f042b67041b6d8a2a8340ba922ff709d69417d7658f8b5dfe926dd3b2519f433235cc84893377282ffc7cc2544044d93fd3bed3dfe9390ba744d342ed2')
b2sums=('01a04ea710cf564aca02806071d5334756c0ebdff7d27ababee1efa45038dd7fc451c620fb94ff8aed5cf0ab857e6b6d9267f1de9c55993f34d6a4931ab8306f'
        '7f7ef2dc664067598bf05d818e2f18800f8c085d265a7a9dbf67095fbd3935e4a35f155bd7d5cb398ee8caa826ccef290c758f003854694f30aef7f57767996e'
        '604b69300830b34b8c6d9d0146df4c6fe1eaf7e9757903240ac44f7293221e992477665df688429966bf4c96fc9d3342cdd3481c3e16102326cbe651875bd01a'
        '0596f6f1e50b1d7f81a03a9813f714f0a5c5a9390354ef7aee527446c14f5b5c0da8e2bde8c338a7de1f1c2ce25658078ba70eaf6b39e1bb91545d27a02b38a8'
        '3d5ec2c896e2a20c3355dd6cf65543e713091483840dfbac69b2c1b60a12aa647efeb5c54c976e1490c1f5dd78d6cbad8a62f627b5ef6ea1703403ccf930d424'
        'ce05372c3e22972775a5acbf0e4276e951bd0ae6f257bfd4f4f7937303a4358f198c7b5ef7784b8d0bfe32cb6d349ad33e3b54ca6537b93c9429d8acbfa3998d'
        'dd208e38c49a7766d6ef5ca8889b6c737e06d2ba8182e9144edaee38c3227bd0d6121bd28a8951972c98c22475da061737e7d78c102931952ff36fd3da7d0e50'
        'b2c4aaf344ed9bc73e64e1e8cd872d8656d68b6b99a4eb0ea0e99674afe5c9ca14daa2d282db5a6596e216712036ffda36870f332cfcb0a39a472d9a3007eeb2'
        '3071ce78ec2a8671e47f55f64bee82d6e6950e7869a6ab90017c04bd1e69b92dd05d3c3c75f3ea73762b62758dcaa063cabc31b0b48ed71c9c843993d1a1e99e')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    for patch in ../*.patch; do
        patch -Np1 -i "$srcdir/${patch##*/}"
    done
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --with-tclcl=/usr/lib/tclcl
    env CXXFLAGS="$CXXFLAGS -fpermissive" make
}

package() {
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"
    install -d "${pkgdir}"/usr/bin
    make DESTDIR="${pkgdir}" install

    for dir in edu ex iecdemos bin; do
        # FIXME: I think per Arch guideliness,
        #        /usr/lib/{pkgname} should be for binaries,
        #        /usr/share/{pkgname} for data,
        #        /usr/share/doc/{pkgname} for documentation
        #
        # Might need to check if it is properly structured.
        #
        install -dm755 "${pkgdir}"/usr/share/nam/"${dir}"
        install -m644 -t "${pkgdir}"/usr/share/nam/"${dir}" "${dir}"/*
    done
}

# vim:set ts=2 sw=2 et:

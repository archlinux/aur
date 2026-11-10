# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-core
pkgver=11.0.16.10616
pkgrel=1
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Command line utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'icu' 'keyutils' 'krb5' 'lttng-ust' 'zlib')
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the cm binary
source=("https://uvcs.unity3d.com/linux/repos/deb/pool/main/u/unity/uvcs_amd64/${pkgname}_${pkgver}-1_amd64.deb")
b2sums=('b0a4bab58844bf423cb2ea0721d32036167057f8831cd96c4284fc46142fb3dfec8bcaaa5f59d0f3a8fdec07fc57c01a2efbe9d6db765927a334c71923914541')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}

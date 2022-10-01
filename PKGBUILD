# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20221001
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.33.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.33.0/imgpkg-linux-amd64
kapp-v0.53.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.53.0/kapp-linux-amd64
kbld-v0.35.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.35.0/kbld-linux-amd64
kctrl-v0.41.2::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.41.2/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.31.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.31.0/vendir-linux-amd64
ytt-v0.43.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.43.0/ytt-linux-amd64
)
sha256sums_x86_64=(
10a8327490ca3dbfa3d00f90ae442838d364e4d7d158786e94aa1ff0438dab27
c2c7381a152216c8600408b4dee26aee48390f1e23d8ef209af8d9eb1edd60fc
1c3f0e4171063eef70cdabf1730d3557af992aeafb423755e71e9d5f1aea2c9b
d1556af9a36e337c1637275b9ab150e278e0ee1e803e73d43b820caab7d95b25
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
69e96fead5d2aaba9f4671f56ca0093445464a061d6c25f0f66f86ba0889c2b0
29e647beeacbcc2be5f2f481e405c73bcd6d7563bd229ff924a7997b6f2edd5f
)
source_aarch64=(
imgpkg-v0.33.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.33.0/imgpkg-linux-arm64
kapp-v0.53.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.53.0/kapp-linux-arm64
kbld-v0.35.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.35.0/kbld-linux-arm64
kctrl-v0.41.2::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.41.2/kctrl-linux-arm64
vendir-v0.31.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.31.0/vendir-linux-arm64
ytt-v0.43.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.43.0/ytt-linux-arm64
)
sha256sums_aarch64=(
08c8eafd44a0a51c47a06d9f5146e8659b88878e6f053fb1a6cc7eeed7f8019f
b4ec066f491c687218eca7e986bdedda6e2680d2bcc3ae1495eb34597aeb2bd1
54e92ff92e66a4b86d7768019cb3b40c87e0e6084380c9a765679b2d342fc4f8
d766031254677c5d07422b96844f4e9ab4aea8d20f397da3c2b93e6ddbdddf2f
bcb4de5602428da37b4fa4c2163533790574587dd010f00ee57a4f875c46a0e7
62b8b0698bb9a88d5cfb91ed2f42853dff4f6b4f59f61036df07ad38ca10267b
)
package() {
[[ -f "${srcdir}/imgpkg-v0.33.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.33.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.53.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.53.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.35.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.35.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.41.2" ]] && install -Dm 755 "${srcdir}/kctrl-v0.41.2" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.31.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.31.0" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.43.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.43.0" "${pkgdir}/usr/bin/ytt"
}

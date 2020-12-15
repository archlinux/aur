# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20201215
pkgrel=1
url="https://carvel.dev"
arch=(x86_64)
license=(Apache)
provides=(ytt kbld kapp kwt imgpkg vendir)
conflicts=(ytt kbld kapp kwt imgpkg vendir)

source=(
ytt-v0.30.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.30.0/ytt-linux-amd64
kbld-v0.27.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.27.0/kbld-linux-amd64
kapp-v0.35.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.35.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.2.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.2.0/imgpkg-linux-amd64
vendir-v0.14.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.14.0/vendir-linux-amd64
)
sha256sums=(
456e58c70aef5cd4946d29ed106c2b2acbb4d0d5e99129e526ecb4a859a36145
9c2c38ce2f884523a6888c3ba5c28bb9a7ab5d3f9879ab8492db1372e206e83b
0f9d4daa8c833a8e245362c77e72f4ed06d4f0a12eed6c09813c87a992201676
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
57a73c4721c39f815408f486c1acfb720af82450996e2bfdf4c2c280d8a28dcc
c224bdfe74df326d7e75b4c50669ec5976b95c0ff9a27d25c6e1833d0c781946
)

package() {
install -Dm 755 "${srcdir}/ytt-v0.30.0" "${pkgdir}/usr/bin/ytt"
install -Dm 755 "${srcdir}/kbld-v0.27.0" "${pkgdir}/usr/bin/kbld"
install -Dm 755 "${srcdir}/kapp-v0.35.0" "${pkgdir}/usr/bin/kapp"
install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
install -Dm 755 "${srcdir}/imgpkg-v0.2.0" "${pkgdir}/usr/bin/imgpkg"
install -Dm 755 "${srcdir}/vendir-v0.14.0" "${pkgdir}/usr/bin/vendir"
}

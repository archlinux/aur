# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20210516
pkgrel=1
url="https://carvel.dev"
arch=(x86_64)
license=(Apache)
provides=(ytt kbld kapp kwt imgpkg vendir)
conflicts=(ytt kbld kapp kwt imgpkg vendir)

source=(
ytt-v0.33.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.33.0/ytt-linux-amd64
kbld-v0.29.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.29.0/kbld-linux-amd64
kapp-v0.36.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.36.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.7.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.7.0/imgpkg-linux-amd64
vendir-v0.19.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.19.0/vendir-linux-amd64
)
sha256sums=(
de20cb812f6c5f66feeb66cfcc82607d21c2b726cb54cfd0eaddd112f062e5ca
28492a398854e8fec7dd9537243b07af7f43e6598e1e4557312f5481f6840499
22fe308f1d9ebbb829a6ea10ca80d9468ff4b9aa911b0c33788fe67d04ccb383
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
bb90881c2c03cad4d50b2f0881d1330d341a37bb55bd8fff50bf228f7cfcf3d2
7f4634715be0219c779a0620f4aabd79a178a733bf29ef87428e758391aef148
)

package() {
install -Dm 755 "${srcdir}/ytt-v0.33.0" "${pkgdir}/usr/bin/ytt"
install -Dm 755 "${srcdir}/kbld-v0.29.0" "${pkgdir}/usr/bin/kbld"
install -Dm 755 "${srcdir}/kapp-v0.36.0" "${pkgdir}/usr/bin/kapp"
install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
install -Dm 755 "${srcdir}/imgpkg-v0.7.0" "${pkgdir}/usr/bin/imgpkg"
install -Dm 755 "${srcdir}/vendir-v0.19.0" "${pkgdir}/usr/bin/vendir"
}

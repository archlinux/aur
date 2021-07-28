# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-os-guide
pkgname=($pkgbase csky-os-linux-guide csky-os-csi-rtos-guide)
pkgver=0.0.01
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=575996958993285120'
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('tar')

source=(
        "linux-XuanTie CPU Linux SDK介绍.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1594614304485/XuanTie+CPU+Linux+SDK%E4%BB%8B%E7%BB%8D.pdf"
        "linux-Uprobe 使用指南.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/420257228264570880/1587612511285/Uprobe+%E4%BD%BF%E7%94%A8%E6%8C%87%E5%8D%97.pdf"
        "linux-Kprobe 使用指南.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/420257228264570880/1587612539508/Kprobe+%E4%BD%BF%E7%94%A8%E6%8C%87%E5%8D%97.pdf"
        "linux- perf使用说明.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/420257228264570880/1587714999937/T-HEAD+CPU+perf%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.pdf"
        "linux-Uboot用户手册.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/420257228264570880/1587718589594/Uboot+XuanTie+CPU+%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf"
        "linux-T-HEAD CPU调试技巧.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1606876665617/T-HEAD+CPU%E8%B0%83%E8%AF%95%E6%8A%80%E5%B7%A7.pdf"
        "CSI-API(v1.7)_User_Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1621586994345/CSI-API%28v1.7%29_User_Manual.pdf"
        "CSI-RTOS_Smart_SDK(v1.7)_User_Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1621587012526/CSI-RTOS_Smart_SDK%28v1.7%29_User_Manual.pdf"
        )

sha256sums=('ced054feb2f1563f409856a9cb56d7edfeb1edc7bc50c5f894901e01d20c6a1a'
            '0b021afefaab3c20307f948c367c287ec83c77c1b1d565d0877e94eaf051f402'
            'ba2f045bc9e1457630db92e0da12eeabf060bd13c82e62ffa975c39423824a88'
            '02a82c423f764222ed3b28f7d03ecd6fb96284a19ed01cfabadfab1fa4e79420'
            'dd57f5c3e4a9898cbe70f05a85b550f258288338f152c8b9a81e8d41e6f3e14e'
            'b8db225a809323f33cb164e9bcc7e209fdfdae923f3d3dc64f06c0b5ab035bd0'
            '1fe0a2ffa9c1369189c20887bca710bca0006eafe99b7f709834eeb6e8749cd1'
            '98964115383dccc01eba8eb46dbca01b9da973c73f201532a24a0dfbb31d835c')

noextract=()

package_csky-os-guide() {
    pkgdesc="C-Sky OS guide"
    depends=(csky-os-linux-guide csky-os-csi-rtos-guide)
}

package_csky-os-linux-guide() {
    pkgdesc="C-Sky OS linux guide"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    cp -r "${srcdir}"/linux*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}

package_csky-os-csi-rtos-guide() {
    pkgdesc="C-Sky OS CSI RTOS guide"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    cp -r "${srcdir}"/CSI*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}

# vim: ts=4 sw=4 et

# Maintainer: smalllin0 <aslinqf@163.com>


pkgname="rime-my-wubi86-pinyin"
pkgver="2.0.0"
pkgrel=1
pkgdesc="rime 86版五笔+拼音输入方案"
arch=("any")
depends=("rime-pinyin-simp")
url="https://gitee.com/comrade-kobayashi/rime-my-wubi86-pinyin"
license=("custom")
source=("https://gitee.com/comrade-kobayashi/rime-my-wubi86-pinyin/repository/archive/master.zip")
_repodir="rime-my-wubi86-pinyin-master"

sha512sums=("b048c1755e0d9716cbe7323b54eb51c788fb25943f6cd3f60840ee573a5676912befa71a1456ba37b340b41c0b8e05675fbfc3b219127a6cbdbbf6cff5b40f8a")

package() {
	mkdir -p "${pkgdir}/usr/share/rime-data/"
        cp "${srcdir}/${_repodir}/my_wubi86_pinyin.schema.yaml" "${pkgdir}/usr/share/rime-data/my_wubi86_pinyin.schema.yaml"
        cp "${srcdir}/${_repodir}/wubi86.dict.yaml" "${pkgdir}/usr/share/rime-data/wubi86.dict.yaml"
        echo -e "\e[31m 请在rime的用户配置文件中添加方案: - schema: my_wubi86_pinyin \e[0m"
}


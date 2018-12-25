# Maintainer: Junfeng Qiao <qiaojunfeng at outlook.com>
# Contributor: 

# BUILD INSTRUCTIONS:
# -------------------
# This PKGBUILD helps you install FangZheng fonts for Chinese. 
# It does not contain any specific font files, 
# you should acquire fangzheng fonts from the company's 
# webpage and comply with its licenses.
#
# You need all files listed in the _ttf_fangzheng[*] array. 
# Place them in the same directory as this PKGBUILD file, 
# then run `makepkg'.
#
# If you have any sugguestion, please contact me.
#
# For more information, please visit:
# https://github.com/qiaojunfeng/manjaro-settings/tree/master/fonts/ttf-fangzheng

pkgname=ttf-fangzheng
pkgdesc="FangZheng fonts for Chinese;方正字体"
pkgver=20180101
pkgrel=1
arch=(any)
url='http://www.foundertype.com/index.php/FindFont/index'
license=(custom)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)
provides=(ttf-fangzheng)

_ttf_fangzheng=(
#########################################################################################
#文件名          字体名          编码           字体格式  字数   版本号 更新时间
#########################################################################################
FZHTJW.ttf     # 方正黑体简体    GB2312-80(完整)  TTF     7156   6.00   2017-03-22
FZFSJW.ttf     # 方正仿宋简体    GB2312-80(完整)  TTF     7156   5.30   2015-08-28
FZSSJW.ttf     # 方正书宋简体    GB2312-80(完整)  TTF     7156   5.30   2015-08-28
FZKTJW.ttf     # 方正楷体简体    GB2312-80(完整)  TTF     7156   5.30   2015-08-28
FZKTK.ttf      # 方正楷体_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02  
FZSSK.ttf      # 方正书宋_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02  
FZHTK.ttf      # 方正黑体_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02  
FZFSK.ttf      # 方正仿宋_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02  
FZXBSK.ttf     # 方正小标宋_GBK  GBK(完整)        TTF     21003  5.30   2015-09-02 
FZLSK.ttf      # 方正隶书_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02  
FZY3K.ttf      # 方正准圆_GBK    GBK(完整)        TTF     21003  5.31   2018-05-09  
FZY1K.ttf      # 方正细圆_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02  
FZY4K.ttf      # 方正粗圆_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02  
FZXH1K.ttf     # 方正细黑一_GBK  GBK(完整)        TTF     21003  5.30   2015-09-02
FZCSK.ttf      # 方正粗宋_GBK    GBK(部分)        TTF     9641   5.30   2015-09-02  
FZDHTK.ttf     # 方正大黑_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02  
FZCCHK.ttf     # 方正超粗黑_GBK  GBK(完整)        TTF     21003  5.30   2015-09-02 
FZXDXK.ttf     # 方正细等线_GBK  GBK(完整)        TTF     21003  5.30   2015-09-02 
FZZDXK.ttf     # 方正中等线_GBK  GBK(完整)        TTF     21003  5.30   2015-09-02 
FZCDXK.ttf     # 方正粗等线_GBK  GBK(完整)        TTF     21003  1.10   2016-02-19 
FZS3JW.ttf     # 方正宋三简体    GB2312-80(完整)  TTF     7156   5.31   2017-05-04 
FZS3K.ttf      # 方正宋三_GBK    GBK(部分)        TTF     7221   5.31   2017-05-04 
FZYXK.ttf      # 方正幼线_GBK    GBK(部分)        TTF     11083  5.30   2015-09-02 
FZSYK.ttf      # 方正宋一_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02 
FZLBK.ttf      # 方正隶变_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02 
FZDBSK.ttf     # 方正大标宋_GBK  GBK(部分)        TTF     15804  5.30   2015-09-02 
FZBSK.ttf      # 方正报宋_GBK    GBK(完整)        TTF     21003  5.30   2015-09-02 
FZZXHK.ttf     # 方正正纤黑_GBK  GBK(完整)        TTF     21003  1.20   2018-03-14 
FZZHK.ttf      # 方正正黑_GBK    GBK(完整)        TTF     21003  1.20   2018-03-14 
FZZZHUNHK.ttf  # 方正正准黑_GBK  GBK(完整)        TTF     21003  1.20   2018-03-14 
FZZZHONGHK.ttf # 方正正中黑_GBK  GBK(完整)        TTF     21003  1.20   2018-03-14 
FZZCHK.ttf     # 方正正粗黑_GBK  GBK(完整)        TTF     21003  1.20   2018-03-14 
FZZDHK.ttf     # 方正正大黑_GBK  GBK(完整)        TTF     21003  1.20   2018-03-14  
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}"
          "http::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

source=(${_ttf_fangzheng[@]/#/file://}
        "license.html::http://www.foundertype.com/index.php/About/bookAuth/key/my_grfs.html")

sha256sums=('bd99fe368b31c62e29ee8456c8fdeb86277786a17e8e40be00ecbe5e4fc7c275'
            'e7134308aa1638ba13365f83e82cbdd3629b908c39350d47c395e100463f0314'
            'b5e4a745d7132abc8bbc482c3c096d30ef4c36fe3260a630fc12cfb16394e675'
            '2239b43b9decc6c74b353c2dc41e15f7fdede652148afcae6eb959bb03d82aa2'
            '6527f1a53414d9d1dcdb64f7f26cc451ef7ab2c57a2a2b1a06e5255e97f2d894'
            '00fdbfb433aaf4c00dd02b79319bbfe94ffca399dba1be9e6455e4bb650e0273'
            '5be63dbc864f04b012f83db53b2e0ea4a2c70311c4a42cc33c6206ae9cd47ef0'
            'ef84cfa29b89f5cb7936306ddec54819d7667fec6d028b820cf80794635c043f'
            'a6e4e1ee8878b824b4eb66dc58e25ed255992ef3ac901264b8444a5bc5a30029'
            'b93428e03530010e2e8c1012a3aa2fca68c9950f3a1fb6ef88e1b4516e6d0064'
            '3631913c15f7952470b70a9d9c2a8479e296939327e9ee9fec8e7062ddb91dd3'
            'c370edd27236e808be5c0fcd860be3945fa9b48c3f1b51eeab156d4af3ef7c5c'
            '4c5e9fa5688135925e23823be750e46ca413885450b7c77a2f0e0dde266f7225'
            'fc60cafc67dfe9584cc4b2aeba05ce6b9d799ecadb2552f27507bc8437511c63'
            'a62bfb18257f1d30634ed2bccc0d2953fe8780d91e21814aba7d6489a4b12e80'
            '81f2ed237feb0f344dcb3605ed9d550e961fca13ecaa1a682abda45fcf9f38e0'
            '12daea58bddc798d78ae2f5131dd3345ef3ab52c3fc4d49eec01df63889b6cc1'
            'd7d7e1290a4d5c174ed87cded929d955c75177d62b8269d4ec789ad9513fc309'
            '15672417c7de8294d1b062d446099176a2ec3e1e76fe1c0d77b0579f91666391'
            '6c3a34bf0ffd9488eecde40fcc8d228ac863decca17301684e871a485ca49b6d'
            'a5999075693e4303049c1dcc72a4fd6b50902e52b8b396bb3c2bbe1e8d068deb'
            '3ef5d37af82a24ef00fce7e5bf2fd00587d81d5b2afe9d183797be3a7caadb38'
            '1880d1d5c6bc4c02f82164a58afa3c0a394dcdf18fe5a091c707e0158a920319'
            '6ffa7ee254d9ed62784ab37563f5b78ed0960411c5e861017ceca27fc00ee144'
            '48f894272cb49c348ac70f31db38b2d6a9a51137ef2d437057702c42d5db1c2a'
            'f2efe8b04e3dad8c5c6b3d127bc661f80f0a88869dc3de62305cef8ecb0db2d2'
            '385c82f0f6991ef59ef75264d728a5565e997500be396f59bdc050bd7f82cff4'
            '8a8dd6e8de3bb9a47e73e79d3083c06beca71039602f4555eed0be22d85fe06e'
            '28cb886b1ff1c42bd06880caa0be3b07d00b90ebbb98b0b892ee48702ce30243'
            '97df3b13f52f8ae6848c00dbbd5008c34c9e06f75d08cd4ed08f30e41f79c5cc'
            'b4a41aefe2527ae8beba99e7a6e358a023cfea1f9643a55fc84d5bb76997f3cf'
            '4fda6f7ad6ff8f5657b80c88f11569206dd941836df9f29f3b327796777c8389'
            'f8bdf5d6eea96bc55c9d1e09e5a6795ff8df62362fe4d32155178cfb80d850ca'
            'SKIP')

package() {
    install -m755 -d "$pkgdir/usr/share/fonts/fangzheng"
    install -m644 ${_ttf_fangzheng[@]} -t "$pkgdir/usr/share/fonts/fangzheng"
    install -Dm644 license.html "$pkgdir/usr/share/licenses/$pkgname/license.html"
}


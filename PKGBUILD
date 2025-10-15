# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Maintainer: Doug Newgard <dnewgard at outlook dot com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: reflexing <reflexing@reflexing.ru>

# Instructions were copied from ttf-ms-win10 and slightly modified:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed and up-to-date Windows 11
# system or the most recent install medium.
#
# On the installed Windows 11 system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\Licenses\neutral\_Default\Core\license.rtf
#
# How to acquire fonts from Windows 11 install medium:
#
#    You can freely download retail Windows 11 from:
#
#       https://www.microsoft.com/en-us/software-download/windows11
#
#    Fonts are located in 'sources/install.wim' file on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#
#    You can extract WIM using wimextract ('wimlib' package) or 7z ('p7zip').
#
#    Put the following script together with previously extracted
#    'install.wim' and execute:
#
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} --dest-dir fonts
#
#    Fonts and license will be located in the 'fonts' dir, copy these to the package root.
#
# You need all files listed in the _ttf_ms_win11[_*] arrays.Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgbase=ttf-ms-win11
pkgname=($pkgbase{,-japanese,-korean,-sea,-thai,-zh_cn,-zh_tw,-other})
pkgver=10.0.26200.6899
pkgrel=1
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
provides=(ttf-font)
conflicts=(ttf-vista-fonts)

_ttf_ms_win11=(
########################################################################################
# Normal         Bold          Italic        Bold+Italic    # Full name                #
########################################################################################
arial.ttf      arialbd.ttf    ariali.ttf     arialbi.ttf    # Arial
ariblk.ttf                                                  # Arial Black
bahnschrift.ttf                                             # Bahnschrift
calibri.ttf    calibrib.ttf   calibrii.ttf   calibriz.ttf   # Calibri
calibril.ttf                  calibrili.ttf                 # Calibri Light
cambria.ttc    cambriab.ttf   cambriai.ttf   cambriaz.ttf   # Cambria
Candara.ttf    Candarab.ttf   Candarai.ttf   Candaraz.ttf   # Candara
Candaral.ttf                  Candarali.ttf                 # Candara Light
comic.ttf      comicbd.ttf    comici.ttf     comicz.ttf     # Comic Sans MS
consola.ttf    consolab.ttf   consolai.ttf   consolaz.ttf   # Consolas
constan.ttf    constanb.ttf   constani.ttf   constanz.ttf   # Constantia
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel
corbell.ttf                   corbelli.ttf                  # Corbel Light
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New
framd.ttf                     framdit.ttf                   # Franklin Gothic Medium
Gabriola.ttf                                                # Gabriola
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia
#holomdl2.ttf                                               # HoloLens MDL2 Assets
impact.ttf                                                  # Impact
Inkfree.ttf                                                 # Ink Free
l_10646.ttf                                                 # Lucida Sans Unicode
lucon.ttf                                                   # Lucida Console
marlett.ttf                                                 # Marlett
micross.ttf                                                 # Microsoft Sans Serifc
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype
segmdl2.ttf                                                 # Segoe MDL2 Assets
SegoeIcons.ttf                                              # Segoe Fluent Icons
segoepr.ttf    segoeprb.ttf                                 # Segoe Print
segoesc.ttf    segoescb.ttf                                 # Segoe Script
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight
seguibl.ttf                   seguibli.ttf                  # Segoe UI Black
seguiemj.ttf                                                # Segoe UI Emoji
seguihis.ttf                                                # Segoe UI Historic
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold
seguisym.ttf                                                # Segoe UI Symbol
SegUIVar.ttf                                                # Segoe UI Variable
SitkaVF.ttf                   SitkaVF-Italic.ttf            # Sitka
sylfaen.ttf                                                 # Sylfaen
symbol.ttf                                                  # Symbol
tahoma.ttf     tahomabd.ttf                                 # Tahoma
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS
verdana.ttf    verdanab.ttf   verdanai.ttf   verdanaz.ttf   # Verdana
webdings.ttf                                                # Webdings
wingding.ttf                                                # Wingdings
)

_ttf_ms_win11_japanese=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msgothic.ttc                                                # MS Gothic
YuGothR.ttc   YuGothB.ttc                                   # Yu Gothic
YuGothM.ttc                                                 # Yu Gothic Medium
YuGothL.ttc                                                 # Yu Gothic Light
)

_ttf_ms_win11_korean=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
malgun.ttf     malgunbd.ttf                                 # Malgun Gothic
malgunsl.ttf                                                # Malgun Gothic Semilight
)

_ttf_ms_win11_sea=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
javatext.ttf                                                # Javanese Text
himalaya.ttf                                                # Microsoft Himalaya
ntailu.ttf     ntailub.ttf                                  # Microsoft New Tai Lue
phagspa.ttf    phagspab.ttf                                 # Microsoft PhagsPa
taile.ttf      taileb.ttf                                   # Microsoft Tai Le
msyi.ttf                                                    # Microsoft Yi Baiti
monbaiti.ttf                                                # Mongolian Baiti
mmrtext.ttf    mmrtextb.ttf                                 # Myanmar Text
Nirmala.ttc                                                 # Nirmala UI
)

_ttf_ms_win11_thai=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
LeelawUI.ttf   LeelaUIb.ttf                                 # Leelawadee UI
LeelUIsl.ttf                                                # Leelawadee UI Semilight
)

_ttf_ms_win11_zh_cn=( # Chinese (Simplified)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
simsun.ttc                                                  # NSimSun
simsunb.ttf                                                 # SimSun-ExtB
msyh.ttc       msyhbd.ttc                                   # Microsoft YaHei
msyhl.ttc                                                   # Microsoft YaHei Light
)

_ttf_ms_win11_zh_tw=( # Chinese (Traditional)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msjh.ttc       msjhbd.ttc                                   # Microsoft JhengHei
msjhl.ttc                                                   # Microsoft JhengHei Light
mingliub.ttc                                                # MingLiU_HKSCS-ExtB
)

_ttf_ms_win11_other=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
ebrima.ttf     ebrimabd.ttf                                 # Ebrima
gadugi.ttf     gadugib.ttf                                  # Gadugi
mvboli.ttf                                                  # MV Boli
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(${_ttf_ms_win11[@]/#/file://}
        ${_ttf_ms_win11_japanese[@]/#/file://}
        ${_ttf_ms_win11_korean[@]/#/file://}
        ${_ttf_ms_win11_sea[@]/#/file://}
        ${_ttf_ms_win11_thai[@]/#/file://}
        ${_ttf_ms_win11_zh_cn[@]/#/file://}
        ${_ttf_ms_win11_zh_tw[@]/#/file://}
        ${_ttf_ms_win11_other[@]/#/file://}
        file://license.rtf)

sha256sums=('74d696e666f696e93db685a85c94bfbfcc0796dfcf8a2e2e2e2c908a54e82949'
            '9e77165c7bfb4a5436f1ab683f1592bb2a9826e15aecad8dc9ed278ce03e8882'
            '6ac9e0ec4d55bfa29e16a7b74e9109efb344bff80d87cc664e1af63bd6c45f94'
            '02d374333edc09827f8b6afb4b95be63317418c2270574dc6579cdc0df698553'
            '10df702864b1f89cb29ba0d6b97c04228338d16807e13e8d8c74b91aba5e5f23'
            'eaad201da94cb323401fdb8cc760650803ddf8fd704cb9fa56317e6c69bc6fd6'
            'df2c69a18a462e5cbc97d04a033f3bd7cd0abfe818381641f8c2dee7b7c43dbd'
            '5e8b2eb430f543eb304f08f44f5eb02ccbc39ffdc95400aae96f5dcd2aea73d8'
            '21390a7e84b61224916e810fd00344ad9ad4f1d9115151a551845a4387d20b10'
            'b699a59faad65272ee48a4d118d6bc743d4cc4ba338cb1c6347deec58aa1e1a0'
            '744d3ec1b277e3652ba8f8d45c89f83c99b7ecf3eb2dfa27306d7be56d3ee030'
            '67ac784ac390f6c48119e76f9e34589f9a86b8974f561a6159545b858ab4cd41'
            '84e70ccc1664482f4a960442c7a166c91a1b2cf98ff88c33cb73f79403f66d7b'
            '6685c657a7e292083e28f19bbf1a1e90509ce3e1130dbc4ed1c62ba3f9140543'
            '6905f0ac846d1ec4326cd14a46cb7379204940aa293b098ee4c1a69723bbd165'
            'fa90f376ad37f308a819b341c8185f788d30a1012829278592eab45a41818d1a'
            '002c1e3378d02ed7dbdb3df1c94d433413a56f3f2f3aa8315a57720ee851dc45'
            'ec0dce5170aaaf2cf485d4ba39d86fbba1dd1c76d9140cbf75a6b84b50fb20de'
            'c165dbbc35bbf1fefae865c3e6b02404c8d182074fe04e78e221bab7d35ce3f8'
            'a873581d9f0886441bd45c5e425a734e86e063ef583b9cf8081b1aa03b871f1c'
            'c35742957794a81b6c73aa43d2f19e3d3d0c45a6dafbc2efcddd04ad6b3aeac8'
            'ff22b2841bc0aa0664b50c9215e8440f1da4f74bedd27ab33865f63f433b2681'
            'fc7fbc3fb456a363f1f719b0ec62ae093c78124bb6da046006ae7e217a6b8575'
            '128fdcfdfdd358e1624c15dd1f84a4d0689e59afcdefb81f8105efb2253b9c00'
            '872cdefea79e25ff1a8a814109593c23ed66ba46f5bb843815d49e1ab4e0be3c'
            '36eb300a76582b7d39f3d34834ce1255f0b9b2830fb2e81485c4b85a5ff7f03b'
            'c6e6ce8119fdd47ec6a5449a08e2d2ad7f41ea03143aae193068ed9fa58eaebc'
            '8fa803e5abc7fff0c78c62cd22d07c705f3273c53312380c36ff484246ed3c1b'
            '81e2a95d3c49468029c07e58f71a5f0ca4cfcb617eaf6bd77576fb03aa430bb2'
            '1df27cbcc8a9fb7f843bc24e257b78e8ff93de70e8c1ad2caab8379e7d6a1eab'
            '495577bf8ef74deab6ecc2e7acf63cd966184148f9bc2044a1068cd58501577e'
            'b6c66a1858370fe575629e19d53c05350738bf5105e18ceac07fe9efc9cd008d'
            '2314a03c53506fa79525bc479ea4be9c036d1ebd86a1ffb5837ca5b43ff51f07'
            '9311aadcbd919746f50d222fa0215fb44266d6993221c14a196f0725fdae464f'
            'a183b77b655df66793639af7874828fb50f748dc4af57ae40f758156f7f34634'
            'fa008372f8a94945d0daef9daf0bfb9e3fba3a25fd17f2607d47ac6861bd0303'
            '9be778c9ed418770f6b5a02064d9c0b47a8fdea1137618f0bec9ac4072430a45'
            '588f090ae3a6d31370457312683d14ee3a5bfbdaaa0a070b7c80225b55b23e78'
            '0e36ddf90102e476c6739ca4c8cc18ba8309d880c12558981d2e4d42de78fc00'
            'a031500bccd32b5d6e819699b774fc679c696ed4965b643d51a94eb398475550'
            '6aab1f79264ccda1e7129dba62dbe3750b10eaa27408a327dadb808724e62c84'
            'e376f24c9f27eb7370b25aa366d78da731834a1aea651858801c9a14e8906943'
            '546406ddbb3e3f6b876a5e8a5dee62ac090d1448662e98d8844b22393813dd13'
            'ac3b362cf998eb33475655e12ab7cb2f6a35d1f2eff6f76af00ebb6f81c53ee7'
            'bac844bd41f847cf138737026d41c983387a1065535c32e78aa22c48708b52ad'
            'df59f9ea915957b22a389d68580bf40dc5bd05822cc65b5fdcc188c706a694e7'
            'ddd852f9e43a5e81af62a3f6654324ba7553d7d66101ab848abc1bd2d626ac4b'
            '38dffcaf1fac89492f7c56c600a14daf36ae42f7c21985cd4134ae113124a58f'
            '72a6cd94fab6c179392075d3fb361e269cdddfad41bb7ab385fa22a37e49a900'
            'd3e4bad27651d120ac8f2cea42cf4b4f077264fb243f66b3caffcfd35465f49b'
            '3f9e512f82eaf6f1b7869b82013fb79f6eaf1a41e75a0e7b96f31f35b1022ae4'
            'd8bbdb72e3f930157824b2e59677d3a912d4512c14a948e6656a2e3fb0c935ad'
            'c8ab96bc49ec1dc36936b5973fc143ca222c1a33ab27b87071a3bbc44d34ca9a'
            '97226e81f19eff8c8fb191745748bab920472c005d3ec4e23d9a50a12c471d92'
            '2ca2cfde263fa420e8d39420f075ee9ac80bc0794272c53ac4571a88f8a075a6'
            'b7397adf2dcc24ca790348a3c26deb2122b45e5728fd25fc588de4cf5a75b469'
            '9621f0043b451d266255ac6229e729d476b76dd908635924f0bcdc4bb6719de1'
            'e47d594e2e2bc31b28f87b6f66483d32f925843ceb002f919c7a403aca48813d'
            '8e14668bbae03f78ed668dbe3261218881960dcd9fb80ad6c1d1dfb4226a57c3'
            '99f0af2d1941707fecda23da38bafbed5144a73a3720d773c05b9d4c445920ed'
            'd0e722b91ffd5391cc2e7d6e976f274d5aee9fe0b8d0fedfffe093763e695cde'
            'a2efc8b8e51fbd031a7142a1ade8866fa904c0c349511abc579ee53f8a926f31'
            'd4a0e1eb6b7101ce78c8ab33573085057123d2d2a790aaf5245bc62b764d4060'
            '91046862e08fbade0bdd648e81c4efbe6a963947f8b6e32b64a28fe39073c468'
            '3cced0162ddb9e5f1e63ee1b36fd6e581c090318dce1a0af01b77f5ea9952c80'
            'b24aa49a4bcb99a0ffc60cad77f00941e4b121153d8b0a519c03719d9be6004e'
            '6cd482205e1390b32a2b6327e1e5039424e346172c187074eac12006bc51935e'
            '73db31e13ef5151beb6a5272cff4c6de6ae2f0bbc3688f4046e5e63593f9953a'
            '34ed88e3895e0d6b17c862014b6ba4fc0113ec007453de3edf72619150cf4d2c'
            '9bdc0241dc3a37ee8b23468ec14d875bd9b94939a3cfefb635d02718a7c2f00f'
            '4ce2a8f4ceb2058b01e073fab23991dcfdba76b9266283496b56484d8984c289'
            '3c574f3990c94e13823a6a9ed32fe42969181b8c707f7d949702ddbb068d1359'
            '09bff29e9a15ab35e9b31390b1174fe495e8a1aa79ee7a45f2bed92b5374bbac'
            '0d7c47ad801fcfe8ab61353a39a076369fcdba46bb53212b1b104147609d2aa0'
            'e7921e223e51281fe9e793133aba8bff0b3065b94818fc8c416e8598dde9b613'
            'e17738f092c8b02f4443867a7dfcdde66fb4cd6f6b10de8e40b2f3192f8a5835'
            '33212faa85fad61785cd6917172378b798bc9f5d4c47c121437354f47980aa6f'
            'f07cbd7886f4a1a5255a1bdf4ca5ea29db3be3357414003a92bec5d1c3165578'
            'a162ceeaf701b55d11c542daf1c39c52bfaf686496505bff2eb75ca24814c136'
            '5a7421ef8999c70e960b79d5806a96cd1a35349e759123e07b83631c80df398e'
            'ac45cce4abfdd8aba8498c2120795f5027e4ebf44a7b6f0b53f4609c8547f6ee'
            'a4a35dcc62cd30e1a6c97b695ecef83e59d2b149e3af834f6a49f11851d56b37'
            '27ca1ab4bd5ad3b0404ee6a9a03b143408dbd7e5a4c9e4b2054639c03fc0f682'
            '9f71aabf76ccc757d25e18801d6a37e45cacc8b74c8b42a19e9f36ca99eef594'
            '74d4b98aabe85e16cb2fa6583c93f9f17642234d030a38462c36d1bcdde65928'
            'ac278d932d59558a76817e98051b1dae53867aa81ad83e5198b1b4c4b8066a08'
            'bbf1192965e5266fbf23370416337d2861fc1e8bd349def93f2994ba67382fc3'
            'dbccddcd68ffa5f9e4d2b9f8ca2507145e0c1f02f8f03298cb1f6281fe3ad12e'
            '13187d9b4746c442e0b0050809038fc78a23607c812baf612c07246e1ecbb8de'
            'f2cb777422a10368904d3f691e650e39da862fe723389056324927df540a35ec'
            '85b680fc9d8fee549191dc823f31d777b37181d298b470bd615cf066920a4a51'
            '4b6d2004937d292f183af258c27d7f7f931783ad0e03d441822768dc02145ded'
            'ffb7862e680bfa5967a4ed34d0cdd2b01417e9c698e8d0dc1fcc5302e3f26dbf'
            'fe3e8bdd64c1c9f3b9cf5189d06510c80d72cec28e03d04bffc560f77eec58d1'
            'dfcc306777a594d2815368547dd897e2ac82aff8073e55d9e682569939e49b81'
            '9c9dc0cd0fd6b1a06e8f406d04bb15a88aaf20328d3e166c12d6bc7994b781d2'
            '87942234ab0cc4400088648bef8d1f7afc4c44e676c7ed6b32ca31462c18307d'
            '6a8481fe107ee547893c018b13dba291c2020bec3de5da6525d9ac09f6bc2105'
            'f3245f5f38f61bd1ceefb0f1338a5b88a21e6220832c2f43a38bbc7e1547c36f'
            '14f2ebcdaa1b77e5993a8533662e4bd3ebfe2c5771b6daafd8ccb39b2ad588b9'
            'd71f81c83ec63eaa32d36d5df7be1d9e71d3ea9150f47cebda2924923cbbf18a'
            '67461fabd8329d0d8ad62689cac642b34fac81c754ff9077ad211160ec62282d'
            '9bcd6064e3b52fa30a347edd6e82506e2ec8b1602930b423c629a82c10468a5b'
            '4bde3e6392b96910fb59094c6c1a4dbfae18fee78d0bf13dc30616837c4f95db'
            '599ae7ecd382254ec077661c6cac1ff98e559c7f1948cf1bea18d0b62ac2ab3e'
            '9d0437d151ddd907d72ba9ba348d670575a86e4f5cbf018de18645f2353140e5'
            '7de36ce08c41514f0ea1a25681dca833353eed5b07b5d1b056af46cee3e2cb22'
            '95392428a804b937919526fec91bab64200664f7f22f777211da6bb244988f56'
            '7a183cf1c6c56b9609fcc16eda8b5229fbc11758a21e669ec00343239b02192f'
            'e8cbc0b2afcc14fb45dfb6086d5102c0b23a96e7b6e708f3122acde1b86c9082'
            'c0ca810a242c4482594182db40f0f9d35a3d51bb2eeac750e6e867b2110eb00e'
            'df8d94382f73e6d2197b60653c3d55c28ab5cf127a82e65b8af4ed1b52fdc412'
            'fdec3a7efacd57913d3c14111837908ccbabea5b0b44ec62527eb73acf743afb'
            'de0b632015447f28c2db41c8e07c745cedb05ead5dbc2e73f19da14d2e5f2151'
            'cfc2acbf9ae0205a0a258e564bdbf5466a4e49a95281a1d2e72690f149ec837b'
            '538949482d964e9f353a3a8d860bb3eda93b46b830f3b677e4f53eb2ff3a6e7d'
            '03e4e45bb8ebb6d055a5584166cc26712bf7e746ea29cb6e548341361d31dc85'
            'f5151d081f6afea4c26464e0cd5e695f57a99209cfeea2f483c3108684660eb6'
            '1878842d8dbdf8489794af0bace95a956db270dfa506ddcaabf94fa827b769ac'
            '80aef1c25135b945e9de7d09e6445c386405eb2e0ea7032d4cd00a2fe3eef0ae'
            '707585b9acfc1507d9bd943bb5435f75768274b1a12b1f71de76ad78be4d7e7b'
            '289bfc7da2a20102b0e00bc86d939cc1e3a41b2492bf61f87acdc49a493cb748'
            '8b20b869b1fb1ab26b8e7b90e28a34a575a097c41662a9f17cd9875e2688eaa3'
            'ad02cdfc06e144ac45f318e8e5a64cbe04c7479d4beb91d25f5a319a466b1767'
            '796dc7e97b357f9c2ad10044d01a86d3fb49cf80e3693011eb055c466c995de0'
            '16d0c83e99ca3cd56a85966c4ff2c5f0c0f8a5a7140a7594b2ec3e404c8e96a0'
            '2e2fabd71aa30f0d7039b879ee58441a791e095a6656064eb9d4a84a071e5e8f'
            '120a51d2b14eb588700a21e15fc301f0ea55d7c1a4e1f3ae61db83b7c8d42cd6'
            '2a476ca00b5fbbbc12a4c5335634722b11a495ed87429284325701f1e36b596a'
            'd79c55e68b1131eea0cc1c47be4f572d964f28c682e143db2ad09c1e4cb07a3f'
            '4508821b3dffe01f0ef5e5326a3e60df705a44633858811f67b6982dce3f6ee6'
            '7e9bdf90bb5d3fe1b5975fc8ae31944b8fa674122261f92c28d4ec0b9c482fa1'
            '1fd5fc7046e0eea753988ee06d1a5a731df68475614e2174fbba9b4800f392ac'
            '7d55cd4801102131d991630cea74534dcf73a9fabf4a33e54fe05dfb4f5aa790'
            '15f1162a68b5859f246d89ea62aed711b1994817c72e78e3df5d205c89c5c6e8'
            '8f8afdb3ec7047118f6dc51b29d395e697ee6770d0afd0cd407457e2ad6e93cb'
            '1dcd304f0ba642dbc3c3f3ccb70c24e9fad7ada2e2d5d0061c7cacab86e8df92'
            'a7bc75937950d0f217f79313631d81f5b92459c414a4099d6ea3c0c0262a716b'
            '0ec2bdbfc2ba99d9fb05b6f7c511e7ab8b7c055e2d644570ad777455d6e9796d'
            'c96226cba7f50e94b534a5f8ade6a54f48a03be7c73360524eda5cbce4de34b6'
            '5dfd7a4c708caeefae42cdb9540946de042beeb8c069dfde0dbc14c2fa0705ae'
            'SKIP')

_package() {
    conflicts+=(${pkgname/11/8} ${pkgname/11/10} ttf-win7-fonts${pkgname##*11})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win11() {
    pkgdesc='Microsoft Windows 11 TrueType fonts'
    provides+=(emoji-font ttf-tahoma ttf-ms-fonts)
    conflicts+=(ttf-tahoma ttf-ms-fonts)
    _package ${_ttf_ms_win11[@]}
}

package_ttf-ms-win11-japanese() {
    pkgdesc='Microsoft Windows 11 Japanese TrueType fonts'
    _package ${_ttf_ms_win11_japanese[@]}
}

package_ttf-ms-win11-korean() {
    pkgdesc='Microsoft Windows 11 Korean TrueType fonts'
    _package ${_ttf_ms_win11_korean[@]}
}

package_ttf-ms-win11-sea() {
    pkgdesc='Microsoft Windows 11 Southeast Asian TrueType fonts'
    _package ${_ttf_ms_win11_sea[@]}
}

package_ttf-ms-win11-thai() {
    pkgdesc='Microsoft Windows 11 Thai TrueType fonts'
    _package ${_ttf_ms_win11_thai[@]}
}

package_ttf-ms-win11-zh_cn() {
    pkgdesc='Microsoft Windows 11 Simplified Chinese TrueType fonts'
    _package ${_ttf_ms_win11_zh_cn[@]}
}

package_ttf-ms-win11-zh_tw() {
    pkgdesc='Microsoft Windows 11 Traditional Chinese TrueType fonts'
    _package ${_ttf_ms_win11_zh_tw[@]}
}

package_ttf-ms-win11-other() {
    pkgdesc='Microsoft Windows 11 Other TrueType fonts'
    _package ${_ttf_ms_win11_other[@]}
}

# vim: ts=4 sw=4 et

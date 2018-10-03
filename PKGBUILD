# Maintainer: Michael Lass <bevan@bi-co.net>
# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: reflexing <reflexing@reflexing.ru>

# Instructions were copied from ttf-ms-win8 and slightly modified:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed and up-to-date Windows 10
# system or the most recent install medium.
#
# On the installed Windows 10 system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\Licenses\neutral\_Default\Core\license.rtf
#
# How to acquire fonts from Windows 10 install medium:
#
#    You can freely download the Windows 10 Enterprise 90-day evaluation from:
#
#       http://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise
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
#    Fonts and license will be located in the 'fonts' dir.
#
# You need all files listed in the _ttf_ms_win10[_*] arrays.Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgbase=ttf-ms-win10
pkgname=($pkgbase{,-japanese,-korean,-sea,-thai,-zh_cn,-zh_tw,-other})
pkgver=10.0.17763.1
pkgrel=1
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)
provides=(ttf-font)
conflicts=(ttf-vista-fonts)

_ttf_ms_win10=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
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
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel
corbell.ttf                   corbelli.ttf                  # Corbel Light
framd.ttf                     framdit.ttf                   # Franklin Gothic Medium
Gabriola.ttf                                                # Gabriola
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia
holomdl2.ttf                                                # HoloLens MDL2 Assets
impact.ttf                                                  # Impact
Inkfree.ttf                                                 # Ink Free
lucon.ttf                                                   # Lucida Console
l_10646.ttf                                                 # Lucida Sans Unicode
marlett.ttf                                                 # Marlett
micross.ttf                                                 # Microsoft Sans Serifc
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype
segoepr.ttf    segoeprb.ttf                                 # Segoe Print
segoesc.ttf    segoescb.ttf                                 # Segoe Script
segmdl2.ttf                                                 # Segoe MDL2 Assets
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI
seguibl.ttf                   seguibli.ttf                  # Segoe UI Black
seguiemj.ttf                                                # Segoe UI Emoji
seguihis.ttf                                                # Segoe UI Historic
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight
seguisym.ttf                                                # Segoe UI Symbol
Sitka.ttc      SitkaB.ttc     SitkaI.ttc     SitkaZ.ttc     # Sitka
sylfaen.ttf                                                 # Sylfaen
symbol.ttf                                                  # Symbol
tahoma.ttf     tahomabd.ttf                                 # Tahoma
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS
verdana.ttf    verdanab.ttf   verdanai.ttf   verdanaz.ttf   # Verdana
webdings.ttf                                                # Webdings
wingding.ttf                                                # Wingdings
)

_ttf_ms_win10_japanese=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msgothic.ttc                                                # MS Gothic
YuGothR.ttc   YuGothB.ttc                                   # Yu Gothic
YuGothM.ttc                                                 # Yu Gothic Medium
YuGothL.ttc                                                 # Yu Gothic Light
)

_ttf_ms_win10_korean=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
malgun.ttf     malgunbd.ttf                                 # Malgun Gothic
malgunsl.ttf                                                # Malgun Gothic Semilight
)

_ttf_ms_win10_sea=(
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
Nirmala.ttf    NirmalaB.ttf                                 # Nirmala UI
NirmalaS.ttf                                                # Nirmala UI Semilight
)

_ttf_ms_win10_thai=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
LeelawUI.ttf   LeelaUIb.ttf                                 # Leelawadee UI
LeelUIsl.ttf                                                # Leelawadee UI Semilight
)

_ttf_ms_win10_zh_cn=( # Chinese (Simplified)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
simsun.ttc                                                  # NSimSun
simsunb.ttf                                                 # SimSun-ExtB
msyh.ttc       msyhbd.ttc                                   # Microsoft YaHei
msyhl.ttc                                                   # Microsoft YaHei Light
)

_ttf_ms_win10_zh_tw=( # Chinese (Traditional)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msjh.ttc       msjhbd.ttc                                   # Microsoft JhengHei
msjhl.ttc                                                   # Microsoft JhengHei Light
mingliub.ttc                                                # MingLiU_HKSCS-ExtB
)

_ttf_ms_win10_other=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
ebrima.ttf     ebrimabd.ttf                                 # Ebrima
gadugi.ttf     gadugib.ttf                                  # Gadugi
mvboli.ttf                                                  # MV Boli
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS)

source=(${_ttf_ms_win10[@]/#/file://}
        ${_ttf_ms_win10_japanese[@]/#/file://}
        ${_ttf_ms_win10_korean[@]/#/file://}
        ${_ttf_ms_win10_sea[@]/#/file://}
        ${_ttf_ms_win10_thai[@]/#/file://}
        ${_ttf_ms_win10_zh_cn[@]/#/file://}
        ${_ttf_ms_win10_zh_tw[@]/#/file://}
        ${_ttf_ms_win10_other[@]/#/file://}
        file://license.rtf)

sha256sums=('c9b76220a5be42ead4733611e417cd65c5fd8aeaa33eb56576ac378a37d130a1'
            '766f06ac8761f82f25d032a220e89438f6064591af9915061f20b949efdedf69'
            '79a5742b865cf06891d4ae43e42cac0e5169c7b7b06b5b3c24ef8e0966d27b62'
            'e432c1b3568bd207e30e3d52d41e6431ea53a679eb52dd79b1a36aa6a4f3b994'
            '10df702864b1f89cb29ba0d6b97c04228338d16807e13e8d8c74b91aba5e5f23'
            '3b5d98707ce72f93c6e8fea694e244cd40d235bd06f246307a31474fba498efd'
            'f79071c0adb962aeff8aabb1027da58c20432c71a57ca7f8564246130a84913b'
            'c1bdd0f5b284156fbfae18f20625ebf911e5c80527d8c1ca3e4f54c542f1c4bb'
            '7881f1df0e8716886edde1e4790aad9e2793905466d7d5f1c8d411a27d90ac2c'
            '487cded39b062466dd72a13adc2ab6483a934fee649564573d892cda2008448c'
            'a4676a1dc708b536347f6885a0702b40ad3bce83b65db089a289773f68d09999'
            'bf2e7a3bdfb51790f0970ea2fc0cd34f5901944736d7ac5721dcf2b9b5c32527'
            '84e70ccc1664482f4a960442c7a166c91a1b2cf98ff88c33cb73f79403f66d7b'
            '6685c657a7e292083e28f19bbf1a1e90509ce3e1130dbc4ed1c62ba3f9140543'
            '6905f0ac846d1ec4326cd14a46cb7379204940aa293b098ee4c1a69723bbd165'
            'fa90f376ad37f308a819b341c8185f788d30a1012829278592eab45a41818d1a'
            '9f02f6bf076197ed2a1335fe59a3bdf88e7ad4a849bf68037a528f37cce36791'
            '5346840fa85a1969699dc97635e838cd2c42dad7f8a4999d7368eb888fceb04b'
            'fc68cb42582e1207bcc397df7b60870a74ae068b17d7bd79f2e9f63af89796b4'
            '1614c0d3a6751eb46b2c52f09ae23dd61f769beda83058269cb0653c049eae43'
            '0e14f663fa34460fe9a07bb32d0017a180a4a0c8457d279fbfc5d8452753b477'
            'e8b17bc645c098bbc5167acfe13f0e3c63f0f417d539aab171db7eea3c40eab2'
            'a7da3ef195158acd8432226a21f2940f1806a9c8d079f18d0a9ab475f50f9659'
            '56567bc71e89fd173674c78f02b474123a02561b246526a22600c3a29b2fdc65'
            '65aece2928246837317e093a11c6df5cbfc67035f1e045c9771f7c408be1faea'
            'c691699eaf218e702b2d77c1f62d2c080be6248f1c11018b0b2556834a9cecb1'
            'c6e6ce8119fdd47ec6a5449a08e2d2ad7f41ea03143aae193068ed9fa58eaebc'
            '8fa803e5abc7fff0c78c62cd22d07c705f3273c53312380c36ff484246ed3c1b'
            '81e2a95d3c49468029c07e58f71a5f0ca4cfcb617eaf6bd77576fb03aa430bb2'
            '1df27cbcc8a9fb7f843bc24e257b78e8ff93de70e8c1ad2caab8379e7d6a1eab'
            '495577bf8ef74deab6ecc2e7acf63cd966184148f9bc2044a1068cd58501577e'
            'b6c66a1858370fe575629e19d53c05350738bf5105e18ceac07fe9efc9cd008d'
            '2314a03c53506fa79525bc479ea4be9c036d1ebd86a1ffb5837ca5b43ff51f07'
            '9311aadcbd919746f50d222fa0215fb44266d6993221c14a196f0725fdae464f'
            '93c3ff526c19d03496c01c6a1bfd1031f97af021a13e859a89dfc717a0b6b6ec'
            '716c08d704f154870bd9fb78b185d0b644912301dfa9c9e6daf45bdb4832a299'
            '5861588608d3a3775d921a7e4acb8362b21630c6b63718bc68adb7137ce53beb'
            '8fdb188252a2db0f020c89831bddb61cadfe290c3616fe534479b4d3b10d09c1'
            '148049066067bcbddfcc9f84bc74a62eb16a5f8a96cea33cc2116839f402f689'
            'c21599ea3508203136efb968b3812ec420e798b2df711ebcc42122754efe6ad2'
            '0cc2cd083a495de28f9a96d2aab2028b8127411f8034978b85dc607a117de6e2'
            '4c0ab5f7b7852f7ea6eaeac2a96d29d9fcb238ee8edb0c4a1a28b991b2687fa0'
            'cf2f6de34923f555ab1897c3d7b5c001da87fa04e46129f58d0ec0257b986fe7'
            '3c99aa248d260920ec1b9e16910dbd31ce6921c933d9480392be98ed1b47a6c6'
            'bac844bd41f847cf138737026d41c983387a1065535c32e78aa22c48708b52ad'
            'df59f9ea915957b22a389d68580bf40dc5bd05822cc65b5fdcc188c706a694e7'
            'ddd852f9e43a5e81af62a3f6654324ba7553d7d66101ab848abc1bd2d626ac4b'
            '38dffcaf1fac89492f7c56c600a14daf36ae42f7c21985cd4134ae113124a58f'
            '72a6cd94fab6c179392075d3fb361e269cdddfad41bb7ab385fa22a37e49a900'
            'd3e4bad27651d120ac8f2cea42cf4b4f077264fb243f66b3caffcfd35465f49b'
            '3f9e512f82eaf6f1b7869b82013fb79f6eaf1a41e75a0e7b96f31f35b1022ae4'
            'c2c3a4146ac080945670eb6b0c4961b26467c797e8497367ac8611cbc3955559'
            'd8bbdb72e3f930157824b2e59677d3a912d4512c14a948e6656a2e3fb0c935ad'
            'f23225869ceb58b78a836b84207d1726cc5d9c3f5fe2ae8a295ff62a98df09a0'
            '2ca2cfde263fa420e8d39420f075ee9ac80bc0794272c53ac4571a88f8a075a6'
            '97226e81f19eff8c8fb191745748bab920472c005d3ec4e23d9a50a12c471d92'
            'b7397adf2dcc24ca790348a3c26deb2122b45e5728fd25fc588de4cf5a75b469'
            '3f557479a768a1d9924af0f29d0d842e8c41988738ce891f6be3abb0f008b0d5'
            'e47d594e2e2bc31b28f87b6f66483d32f925843ceb002f919c7a403aca48813d'
            '8e14668bbae03f78ed668dbe3261218881960dcd9fb80ad6c1d1dfb4226a57c3'
            '99f0af2d1941707fecda23da38bafbed5144a73a3720d773c05b9d4c445920ed'
            'd0e722b91ffd5391cc2e7d6e976f274d5aee9fe0b8d0fedfffe093763e695cde'
            '91046862e08fbade0bdd648e81c4efbe6a963947f8b6e32b64a28fe39073c468'
            '3cced0162ddb9e5f1e63ee1b36fd6e581c090318dce1a0af01b77f5ea9952c80'
            'd0dfad2f6bbe7ff7c0f96a0c80a28bd4f4624f900573a61abd9d29406d3775d7'
            '91283e8af7f9eca8b14b498b484b35d49c3bd3144ab7e25aa4934297138ea28b'
            '60735b1825a3c45b857119d70b625dca7968ae1c571eeb201651c718452d5e6f'
            'da2ba9063090cfcfe387c5ca524f8991554d369582060dfa2dad03c374826fc0'
            'afd3f88d3844cae61b42c4265e609343369b5c17abecb9287364ccdb802aa203'
            '87dc484ae1c01ce5f69aa5eed43ecaf7f7be5e33b70e6588f73c78bd07dee471'
            '77534a94c5bab472fed075f2a418531a5c5121ce5c855a4b495e1809da745378'
            '4881fcebfb48aedd7433ba75a1d102bff808c80240a7839e526e5a3731346ae0'
            'c59d660de6e83f6a76fe92dd35e124abc5abcf536baaf572d6a4b6f006152fcf'
            '245b1e48d00f171c5b4e6b5a61aaa81c13ad4917fbef55d2eff7e1d725b065aa'
            '1cbe547c648ff673c30ca91c6a4f091addd1a4b605a9798f84089add47e9b884'
            'c22457517f61903da1262f87d35c785fc013c92d1a0579330d184b2be2f4d458'
            '97afe390ea66c38e3dd59fb10c0248704ebd4d5ba97448184c928f325e5c44e5'
            '249530776b503faf3a4bb5bb866201d0a3b1a9226a6014369e98386fd1ab5dd2'
            '95b430488010a492aab460881dc913f4a61f2c5a54510bbfacc0e1f09a02bffa'
            'cd4d4b098ecb8e671261d654820c6ba72333093d74fd23a41a630393fc8f380f'
            '921bf07b814733e71f0a59d4d25566f0afa3867ad1bd987ce5b08c54d5918d72'
            'd2f8326a354456d93e78b0537c58793e7072c3617af7d9ee187f10d6d595f510'
            '18f4d0f9de114e04a6f0b21955a96177154ff0f55fb4a94c68af5c51449bf107'
            'eac5da16a297e4292decbf8c6735d0912f342c6ba9c2844d362126b3de1136ca'
            '1581ff0e4ecc7ec2835c02678b62ee7c8e89937e4142aff11030548ff04d40a7'
            '9ba07e98c2dfe00c7f00a44cc74da52a9818d39988a105c6af6974a63d04b9ad'
            'c7a5df780936c04804287e32c1b77e78b9b0e46b8d2723a85bda987eec8de024'
            'bbf1192965e5266fbf23370416337d2861fc1e8bd349def93f2994ba67382fc3'
            'b890858df485549d20fcb0a2c519dffe9c5c155d16b55e0b9252d6e66db555e5'
            '68f92341975acc275c7d4a2ec52a1569b70e992b521c42b30f29149806421674'
            '2cff2a03d8034801979dd6d16f09b9a825c3d710fcf068f2ebfbf0e1425c87cf'
            '621b4a765fef5d255d19530f4bf936104c6519f2e232a0eef1923474e5b9cf22'
            '3a1c2bc8528bfa432e0414d4ec69bf5813563c474e16a9ad0f57ca262f8d24a2'
            '2852329a38acf9252504669d9c23d5e88366cf77e8209d508f5e7198639648ea'
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
            '029766fa6d75ffba352daa361627c2d9597ba273b160aec1164640fde3418bc9'
            'b779a8f2896a591c9463239c195776f82af71838dcd3c2c1c2a6bb3372a53376'
            '4942d17e2931eb9a7f958a706e31179e556003ec09fac9d0e32aa977f3a9cd57'
            'e2463b758dcaef1d4a9653eb14b13f0b2ecea9e97259bd757568d9020bde3219'
            '619e0a81944afea625d38651008d181e0bb919e9b10db42b65d7629dc89d1eb6'
            '0086c19e81d293a542e7d75564c645fb58070cc850aefebf8fa1c397858e510c'
            'a541834fb9cdde9bd6d2c3ff1565cb0bb5ccf7a15e4e9daf2cb58d9b1cf282aa'
            'a7217a2e590c86141bddadc74a2bcdff2efe210db48469a77a749e0446d91ea9'
            'a030874507b9249f5b889318d07639707fa9ef9d354ba2e564162f01b81825eb'
            'fdec3a7efacd57913d3c14111837908ccbabea5b0b44ec62527eb73acf743afb'
            'de0b632015447f28c2db41c8e07c745cedb05ead5dbc2e73f19da14d2e5f2151'
            'cfc2acbf9ae0205a0a258e564bdbf5466a4e49a95281a1d2e72690f149ec837b'
            '538949482d964e9f353a3a8d860bb3eda93b46b830f3b677e4f53eb2ff3a6e7d'
            '03e4e45bb8ebb6d055a5584166cc26712bf7e746ea29cb6e548341361d31dc85'
            'f5151d081f6afea4c26464e0cd5e695f57a99209cfeea2f483c3108684660eb6'
            '1878842d8dbdf8489794af0bace95a956db270dfa506ddcaabf94fa827b769ac'
            '80aef1c25135b945e9de7d09e6445c386405eb2e0ea7032d4cd00a2fe3eef0ae'
            '707585b9acfc1507d9bd943bb5435f75768274b1a12b1f71de76ad78be4d7e7b'
            '3ed4612d44f71851d33a126bb483b08a623feb0b2731025a73a41898dec7cee7'
            'f56f3c5a1c1896f83c977f90bf7ab39729f7ea2c39f4d7484b06635c7c6fc0bd'
            '69994ce1c7cce85fb3efd22940fd1cf207d05976db19725f14871a565a2c27e4'
            '7c18828f1a952a4fbc9670e17e5d90fc33eebbff51effa59319aa881a914c081'
            '9ea5464747a4931b27c88833a9107ec0f5786a5f2c924005bcbf3541ba61e1cb'
            '796dc7e97b357f9c2ad10044d01a86d3fb49cf80e3693011eb055c466c995de0'
            '16d0c83e99ca3cd56a85966c4ff2c5f0c0f8a5a7140a7594b2ec3e404c8e96a0'
            '2e2fabd71aa30f0d7039b879ee58441a791e095a6656064eb9d4a84a071e5e8f'
            '2e3cc9dbd787c827f73496f01633bba430e15c5db4d4f6ed9938386ea01f0171'
            '5f12f95e02fd187b9f46d623c9a9acac5830bf5239b92938a4a8de0237dc9430'
            'e4b3b9d058750fb80899c24f68e35beda606ca92694eff0e9f7f91eec7a846aa'
            '06e1a30f687ab7d39f533447b21e84d51e0cecdaa6bfa060c87136b168811bdc'
            '2db3f3100589c5795f7917ebc25779d23b69dd19047a963190d9357a5e0dc34c'
            '0b50839f0e13f9e1607b46568aa953fc1491eb3f867f2737e6a4ff9eb3696aa9'
            '920f472051f70e33887909a4f2c91541a2b3afa7a4faf577acf350020cd29d46'
            'd3b01af9bfc265ee4057b76c897243ed42f14d62a78b7306084e54dba37a548e'
            '814fc6cc5407d2137022a1ff8587cfa43d5a2736b2ab5378ea49ceb5c072de37'
            'e911a5291045e3cc1c00e1de728e90c2f6315888042d47b3b9ec57f8897fe3fb'
            'a577dd351531d9716d11d34a5b151ab0e2b939a2a75a6a04225a37d81d6902f9'
            'ef2c245c5b895e4cb4fd67b1842141921ff17e5812d8daca7f1f7f760e848552'
            '21b256efb2eaaf7bbbf99865bcda5a3e04bb78d9740929d0d6e37d4cc50ae7b0'
            'a5b742323c8da0fe29b0003fb0073969b757865fbf91789d32206397593c4d6a'
            'SKIP')

_package() {
    conflicts+=(${pkgname/10/8} ttf-win7-fonts${pkgname##*10})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win10() {
    pkgdesc='Microsoft Windows 10 TrueType fonts'
    provides+=(ttf-tahoma ttf-ms-fonts)
    conflicts+=(ttf-tahoma ttf-ms-fonts)
    _package ${_ttf_ms_win10[@]}
}

package_ttf-ms-win10-japanese() {
    pkgdesc='Microsoft Windows 10 Japanese TrueType fonts'
    _package ${_ttf_ms_win10_japanese[@]}
}

package_ttf-ms-win10-korean() {
    pkgdesc='Microsoft Windows 10 Korean TrueType fonts'
    _package ${_ttf_ms_win10_korean[@]}
}

package_ttf-ms-win10-sea() {
    pkgdesc='Microsoft Windows 10 Southeast Asian TrueType fonts'
    _package ${_ttf_ms_win10_sea[@]}
}

package_ttf-ms-win10-thai() {
    pkgdesc='Microsoft Windows 10 Thai TrueType fonts'
    _package ${_ttf_ms_win10_thai[@]}
}

package_ttf-ms-win10-zh_cn() {
    pkgdesc='Microsoft Windows 10 Simplified Chinese TrueType fonts'
    _package ${_ttf_ms_win10_zh_cn[@]}
}

package_ttf-ms-win10-zh_tw() {
    pkgdesc='Microsoft Windows 10 Traditional Chinese TrueType fonts'
    _package ${_ttf_ms_win10_zh_tw[@]}
}

package_ttf-ms-win10-other() {
    pkgdesc='Microsoft Windows 10 Other TrueType fonts'
    _package ${_ttf_ms_win10_other[@]}
}

# vim: ts=4 sw=4 et

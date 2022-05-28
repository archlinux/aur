# Maintainer: RubenKelevra
# Contributor: Zepman <the_zep_man@hotmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: reflexing <reflexing@reflexing.ru>

pkgbase=ttf-ms-win10-cdn
pkgname=($pkgbase{,-japanese,-korean,-sea,-thai,-zh_cn,-zh_tw,-other})
pkgver=10.0.19042.789
pkgrel=6
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
provides=(ttf-font ttf-ms-win10)
conflicts=(ttf-vista-fonts ttf-ms-win11-auto ttf-ms-win11 ttf-ms-win10-auto)
replaces=(ttf-ms-win10-auto)

if [ -z "$IPFS_GATEWAY" ]; then
	cdn="https://gateway.pinata.cloud/ipfs"
	# Alternative Gateways:
	#cdn="https://cloudflare-ipfs.com/ipfs"
	#cdn="https://ipfs.io/ipfs"
else
	cdn=$(echo "http://$IPFS_GATEWAY/ipfs")
fi

_ttf_ms_win10=(

    # Arial
    "arial.ttf::$cdn/bafybeibdmtdnbdlhg6wift647ilkesiyyj33vdh3rsfrfylkdpssk7z43y"
    "arialbd.ttf::$cdn/bafybeiajq7sshr3bfxahujc6oicmntm3rpexsmxs6a2g2bwdgzis2ijqei"
    "ariali.ttf::$cdn/bafybeiaut5h4bckmpkksftymq4euwukhmz6al2tehyfq6bapvonp4vez3q"
    "arialbi.ttf::$cdn/bafybeihgvgd72nkhyr3z2sjvcqwekockkvweakwgtemfpu25sb7kgrpsby"

    # Arial Black
    "ariblk.ttf::$cdn/bafkreiaq35ycqzfr7colfg5a224xybbcqm4nc2ah4e7i3dduxenluxs7em"

    # Bahnschrift
    "bahnschrift.ttf::$cdn/bafybeiaba4stzagipdchm733ygr7a6lvvu3gmoixzlhohqmondue4wdmya"

    # Calibri
    "calibri.ttf::$cdn/bafybeihqn6wl4ngeptkw25bohgx34cen25ub5zerwjpsd5iz5yrvdc2kpe"
    "calibrib.ttf::$cdn/bafybeibnph4y7dyjygxwkywi2v4qchnujm6zspv44xh4neflgbbksm7w6a"
    "calibrii.ttf::$cdn/bafybeig7pmac72kialq7oo63vblvpnjnc22gu2bep5epuvjgwnh5y7pfhm"
    "calibriz.ttf::$cdn/bafybeifljylpdhb3duyhdbnerxwrhnexdbgdxf47xg4qngxodtppj2mtpy"

    # Calibri Light
    "calibril.ttf::$cdn/bafybeigt44wzjqkhzz2irxpbzazqtummflnkduy3zswid4t6z6cia7eaom"
    "calibrili.ttf::$cdn/bafybeibm3ogpg7vihvltgsi5n3vks32jirt2i5hokaxemvgspe4eofmnyu"

    # Cambria
    "cambria.ttc::$cdn/bafybeicjmswogcd6fawgdyvjrajheddnx6kyes4vwwo7pubpzgdanfm7wa"
    "cambriab.ttf::$cdn/bafybeic5rspeagclq5hfgiupcgyklphjgfpi6wuiqcyv5tntfb5phigu7u"
    "cambriai.ttf::$cdn/bafybeia6jhblgxgt44qyoroju46foxmqf23udizj7x7nhazxfe22xccbpe"
    "cambriaz.ttf::$cdn/bafybeidbp4njipkc6cqhnu3l6p5a2lfxw4232ferfhhbh6jhynephfxpwi"

    # Candara
    "Candara.ttf::$cdn/bafkreie7al3l6b3bs7wsuezv7zm2hppyrz5njkcjx5uag6ssr434zy3hse"
    "Candarab.ttf::$cdn/bafkreicti2ca7kc2dfuwthojoy26qognfrbnvv7yusmz243i5oei7tvqjm"
    "Candarai.ttf::$cdn/bafkreih4ndfuewbocid3zq4x355wbbykosxancyx266xt4xj6y5prf4wwq"
    "Candaraz.ttf::$cdn/bafkreiawctanhjtvd22gwlcs6cnoepowd53jx3nigbmcnhfqmu6ajhvoim"

    # Candara Light
    "Candarali.ttf::$cdn/bafkreiaoct3gh6ruiyh6tid3wmwqaf5bqcskbscfputz7p6f3bcsou5uo4"
    "Candaral.ttf::$cdn/bafkreihiwf54mroatc54kft2z7qt6dr4mpypif6vhgvlc4o3p3vdyqhkwi"

    # Comic Sans MS
    "comic.ttf::$cdn/bafkreifh3i7pdfivrlgyimrcniq7ffapdadktsgqphyy2cu2wr27kd4wle"
    "comicbd.ttf::$cdn/bafkreicwkz54ohuj7ultm5ghr4bli5ashibfmgzemutkejqayorjwl64mu"
    "comici.ttf::$cdn/bafkreidfv3hcskbena3tc7qjhii4nx24x7dhanpr4bc4s5y7praixyp25i"
    "comicz.ttf::$cdn/bafkreiggsfuz5lzbrzycwllxyh3c2laibptcjdy4ceaywczfk2buvhhmwe"

    # Consolas
    "consola.ttf::$cdn/bafybeibyaoy736a3xt6plqfibxncvxp6a6vazyaza54tiuj2em2ughzz2q"
    "consolab.ttf::$cdn/bafybeicy64glqsf53lmknjq6lb5p7vfagwx2bmw3wqz6otp6e4qs6gylc4"
    "consolai.ttf::$cdn/bafybeicm6xyidsshsp35pqqpt3s4coo7ljch6hahu4piunekibrvn5omxy"
    "consolaz.ttf::$cdn/bafybeiefkpwhyv42dsnio2xb63cypixybpmesskbplpfwowqu575xhl264"

    # Constantia
    "constan.ttf::$cdn/bafybeigatcwrsn4ry5cnkenwqrxrc5z4lfh2kjivtnn54m6y7ldhtdjw34"
    "constanb.ttf::$cdn/bafybeiaggvewnespjr4clfc4lffvhjfcx3rhut563jep337rea6kjuiwdq"
    "constani.ttf::$cdn/bafybeia5z767y6bwherljtuykge74x6xtkelibfmki2o4vxdebzmq5fiqu"
    "constanz.ttf::$cdn/bafybeifpfl3ycxofvn5jkafy7ckk7znovtmjk3ztvzlzqu5bmg5ixezb5a"

    # Courier New
    "cour.ttf::$cdn/bafybeigigiafdgd2rirxfnwvwejpunj2sizsq4lb3lchiwrepo3f7sazgy"
    "courbd.ttf::$cdn/bafybeihbfzdqbkzmk7gix45q2wxliwrkadvgqrbekbeumeo325ycey3tbq"
    "couri.ttf::$cdn/bafybeia6wrdw7mtywm7x6dqteqskajydbjbiubj7hvdjesxhppejgqbc4y"
    "courbi.ttf::$cdn/bafybeie2dc2io23hitsixsj4xcb74yjeohcthyk2oly6v7voho7ypluuyi"

    # Corbel
    "corbel.ttf::$cdn/bafybeifiponppzgr3xq2kvvaiajh44gk3kpnubfto6cvnie44ir5r2syji"
    "corbelb.ttf::$cdn/bafybeif7yklazg6iplkbikij5d7xfxgpyy2mnwsw7inlod2r4pm4bnndaa"
    "corbeli.ttf::$cdn/bafybeiapr6o254yyciwjbredyojef7zyarqwyuandkb5uoxwhyo277kh7i"
    "corbelz.ttf::$cdn/bafybeialxqtjxbyxqbdhtjmewavialj2bs3zrquu3yb45spqtv3mktiamq"

    # Corbel Light
    "corbell.ttf::$cdn/bafkreiaog3o7saic4r3mm444utemygf2qme5ragbevmjqhjojvbn46h4aa"
    "corbelli.ttf::$cdn/bafkreifagfiaxtgtfnow5amwtg3xj7dhtruw5vewlnsd2unjj2zzqr2vka"

    # Franklin Gothic Medium
    "framd.ttf::$cdn/bafkreif2zbcl2qpyi7hrhbzxajwudsmdhb5bazktlqzopcvcfrehbc2svu"
    "framdit.ttf::$cdn/bafkreig7lh46vekzk6zcuoe5nbmax5anyw6qlarmyznv7xgbrddqnjuu44"

    # Gabriola
    "Gabriola.ttf::$cdn/bafybeiaqhpwylw7ernmoeeq447zk3bi2xo2vxriwimz3stcr2tcg2i6xe4"

    # Georgia
    "georgia.ttf::$cdn/bafkreiby376k6h5mrfes67cwyyakctnpg2xef56cdgc42qjuvyitcjffr4"
    "georgiab.ttf::$cdn/bafkreidsu3gzj6vwyf4tsidv2p5tmhrgtto57lkbxn5lhbp2ekrx4snjaa"
    "georgiai.ttf::$cdn/bafkreigt4s5ne5sr2eqkzdzm5jbm6s2pa5zgj6zeh5tlhsx7z7jvizputm"
    "georgiaz.ttf::$cdn/bafkreib7tzis7axk63y3pbu3qiat7n47n2xruqphlihhxfxtd423cark4q"

    # Impact
    "impact.ttf::$cdn/bafkreigyxpnxfy7zgakxqjfs4wlhpu5jclkfclauvfeomzlkfy73bsjvvu"

    # Ink Free
    "Inkfree.ttf::$cdn/bafkreihsgisynhhllc3yva3lqqqh2fzgzrozyp274kxiukk76yvjrxyjua"

    # Lucida Console
    "lucon.ttf::$cdn/bafkreibmulh54jr7uqqoru4uedyhl3u2zaf4a6kcolctvrcxdkepridvuy"

    # Lucida Sans Unicode
    "l_10646.ttf::$cdn/bafybeiepfu43ans2hiqysgmwzjrrd3ru4wiwpco225skwkafdeuiwc4lxi"

    # Marlett
    "marlett.ttf::$cdn/bafkreifxhf5n6lometfhsa2iupbg32zbek2f4vzi7us7ywen4thvu5nune"

    # Microsoft Sans Serifc
    "micross.ttf::$cdn/bafybeig3ro5nh2vu5xryk4ee3ztocsecrbfs3pi5uhtogq3nlagrn7uqtm"

    # Palatino Linotype
    "pala.ttf::$cdn/bafybeid3dqpexfaq47d542ncpjhfhlnzpl6o2yprlyjupmai64kveq2eym"
    "palab.ttf::$cdn/bafybeibaqhv724vml6ron4v4leuw3uejkphmfykomh25ejrhffphheb3hy"
    "palai.ttf::$cdn/bafybeifjf4o4p5zlmgre6ozrixhh2sdhyjixjgsjvsc6ycudhopgmdbxfe"
    "palabi.ttf::$cdn/bafybeiezx5kz77p3x4qkqbib5n5htgbxhmwo6f4mfszyhk7ac3tdbvduty"

    # Segoe Print
    "segoepr.ttf::$cdn/bafkreierarugfyepxlpaxxler2a4j356nkldsr7yw3rswzfcr7rza46ena"
    "segoeprb.ttf::$cdn/bafkreib4z3ibmlo3tzpr4y7odm3p23sydqeqggg44gqk6anxp5pktfjmqa"

    # Segoe Script
    "segoesc.ttf::$cdn/bafybeien7nxnn7zndh7vgumb2g73er4wlnlmr4yj46ylyyocsq6x4nxrf4"
    "segoescb.ttf::$cdn/bafybeifw5ssyutmj2jywnfeqwutbp6fcgfkejt5a27mp3gbvkvoyvfxwe4"

    # Segoe MDL2 Assets
    "segmdl2.ttf::$cdn/bafkreia7vphfisg7bde6aaf7s5e4a7bwlrp7xiy37rzrehdbww4w5jeyya"

    # Segoe UI
    "segoeui.ttf::$cdn/bafybeidbdpkdgrwte7ds6rv3gzw3qpkad32sr5ewtl7qiln5ncm56ksjfq"
    "segoeuib.ttf::$cdn/bafybeiad7s4lzcx4vus4tmyviaghrurp5zqhqegcxynh7b4nthgmpb5vg4"
    "segoeuii.ttf::$cdn/bafybeicu5cplntevqewzs4bulvnqymn232q4xgexr2pgat7vavlmc7tdjq"
    "segoeuiz.ttf::$cdn/bafybeigr32jfyshki6fpfvkkab56vcfmalybmln5vse36vea6njsd4yy7y"

    # Segoe UI Black
    "seguibl.ttf::$cdn/bafybeigiw66swytofg4etqfbewhy3oxx5ilnhmkimehue4e6sypzfbuyoa"
    "seguibli.ttf::$cdn/bafybeicoewvc56wchqmd2xzaycjvigtkmeo5fe6z6eobhoig3m77zss5ra"

    # Segoe UI Emoji
    "seguiemj.ttf::$cdn/bafybeic7xfi56fhjojovjg4h4bms6brp7poqtvp3eucoqsghopvlu7juxq"

    # Segoe UI Historic
    "seguihis.ttf::$cdn/bafybeigymnwaktwyfocjld6a3q6etfzmswxeivyw4pgpz5omngbqdbtk3e"

    # Segoe UI Light
    "segoeuil.ttf::$cdn/bafybeicqmkkhl7widpzlo3c53jewmku52ps26ynmezxbt463xwle5teayi"
    "seguili.ttf::$cdn/bafybeiezhtjbncccyzqufcyu5e2a5mvjkjgjfryojlklxspezeez5hm5ou"

    # Segoe UI Semibold
    "seguisb.ttf::$cdn/bafybeifdogca5ew3rrst6qz7zvlay7henyyijzqi2h7lbb2chughmho4d4"
    "seguisbi.ttf::$cdn/bafybeieafivvyxrfhledlx6zjz5iaw7iaoqij6fxs5uewrcldch7fhw6vi"

    # Segoe UI Semilight
    "segoeuisl.ttf::$cdn/bafybeidsmf6ahgzmysfqncr3brban4l7fnho67m7a3zdh3qtiwgy57kp6e"
    "seguisli.ttf::$cdn/bafybeiaefg3kmdpxfk4n7dcro3kdpwjqtbtl2an2hhvfs2tkorgc52z2ny"

    # Segoe UI Symbol
    "seguisym.ttf::$cdn/bafybeihrqqnxq7b5jzn2ym73wyswvemqbncpyllpxvyxihclero32tdocm"

    # Sitka
    "Sitka.ttc::$cdn/bafybeicfhvaajmzpsn2cs4ihdzjgb3twd6vld7cjekbymnwsowqigal27y"
    "SitkaB.ttc::$cdn/bafybeihmc4wapimblagl5u3qdr6wtwpdjz7o666omhvwldl43m4fvd37ce"
    "SitkaI.ttc::$cdn/bafybeia2coyh3vyegjtu5lconiaze4scdu5afe3r5nazczgacqh4egocq4"
    "SitkaZ.ttc::$cdn/bafybeibwpzxu3oxqqofznwyuh7zarau6lpk7opeebgbetjuh4jh3dhrvwy"

    # Sylfaen
    "sylfaen.ttf::$cdn/bafkreighuxpxqcjwybeaikd6gla3o7tyxgyoi24ne4r2qw62tb7ozdpaeq"

    # Symbol
    "symbol.ttf::$cdn/bafkreif36emsszpfezx36izxaqldg7jimh6b5c6tjhppspzjss5goobpym"

    # Tahoma
    "tahoma.ttf::$cdn/bafybeico6ln3vco4m52rlnbbsxlx4cm7lxhu5yyghvmfirdqfxw27q77sy"
    "tahomabd.ttf::$cdn/bafybeibmrkymar76oq4jjim6swvi45gm3d4srwchqilawurq23pfcivs4a"

    # Times New Roman
    "times.ttf::$cdn/bafybeihqkpgru5qpmpiv56fib56bm7fa6hi2dpbiqgeityyhokcpxwnnhu"
    "timesbd.ttf::$cdn/bafybeibnmrwtz24faq2ny7l5ludoaqhhslozoa6k2xfq4pphrggvdhh5e4"
    "timesi.ttf::$cdn/bafybeid2d7sr2vmaja5emtzytem2v5h7qkezjdojx5ffmyah4lz6c6ts6y"
    "timesbi.ttf::$cdn/bafybeihe7h3cjkigsjebxq4i6557voeaoi3omhzz5gv2hmcu4yr4fjgufy"

    # Trebuchet MS
    "trebuc.ttf::$cdn/bafkreih6h2f52zgbzhz3tt2rrhigkegibvzm5quoapiex76fmd3x53cy2e"
    "trebucbd.ttf::$cdn/bafkreig7zqygo55fstjicu3ikr65rf7cvsbk76ahhzk5tzuck2mttze3qe"
    "trebucit.ttf::$cdn/bafkreie4txam2d6wwgqg5d2anuclwfnirkxsamunhylgyewwxr4zjn4b2i"
    "trebucbi.ttf::$cdn/bafkreiehsqrdjkymyraabcderpxy2h327rgejztwy7wwwmwkgfdcygbqpu"

    # Verdana
    "verdana.ttf::$cdn/bafkreidkqsa74ed64vdyspabrmj5xiuryibax3b54xngkjozvqe7npbbau"
    "verdanab.ttf::$cdn/bafkreihterpv6ohwdpi4535q6ezyuw4iuipgeiedfqxuhi4lxr7bkr6dn4"
    "verdanai.ttf::$cdn/bafkreiau6lv43kq3o7szsoufgntc4s6t5p7cyv3rw3nk7wgmwonsvvmixe"
    "verdanaz.ttf::$cdn/bafkreigxd6a4qpwgh2vdfu3nlx334hm6ohj6vekq6r6oxwrjesjdzo7rri"

    # Webdings
    "webdings.ttf::$cdn/bafkreidhiyp2xwbstugyvvrgrhfmmqvtj6widr2u76ihpljbcfqoyyrifu"

    # Wingdings
    "wingding.ttf::$cdn/bafkreie3zvqgjy5vf6rqund63vxieudof3elcybjgc2chrrjvawbaruklm"
)

_ttf_ms_win10_japanese=(
    # MS Gothic
    "msgothic.ttc::$cdn/bafybeichbrkdwz2oujy3zblsiwljbkfc5t3ht7j6tx7p5cdjgdskoxpm7m"

    # Yu Gothic
    "YuGothR.ttc::$cdn/bafybeib3lj52rsx5fsk4rf6a5q4cjmsc3m7etprbhp3o3lnpx4vzx4ydmm"
    "YuGothB.ttc::$cdn/bafybeicuyx76jam63brxzgv3u35ohkvmr5s73c6bf37ebqvs2ib5ymcete"

    # Yu Gothic Medium
    "YuGothM.ttc::$cdn/bafybeihzautbxygqvwfg3tnyvwwpyrjwe6pjahgrhhqrih6fm2thvocyoa"

    # Yu Gothic Light
    "YuGothL.ttc::$cdn/bafybeih2actjsa3pfvavwsu7zrlvt6rgj3yxn2svj5p6nurb6ztpcnr2f4"
)

_ttf_ms_win10_korean=(
    # Malgun Gothic
    "malgun.ttf::$cdn/bafybeigiptm2fxrxfg7cawhvernqmecaq3wxrls7hofnizfcq7hqtlm5qi"
    "malgunbd.ttf::$cdn/bafybeigulfpjtm7nk7vc5rxfmxhm74lagxfpy6xyozlvr2so7gobwqtnmi"

    # Malgun Gothic Semilight
    "malgunsl.ttf::$cdn/bafybeictf27e7fqjnjar2pegyfp7bbgonidnoc5cmneapfvxutpxm4dqpm"
)

_ttf_ms_win10_sea=(
    # Javanese Text
    "javatext.ttf::$cdn/bafybeidbf7gcdz4ep2plc6yxxpopkho7jyoy3desguakslhhvom7skalpq"

    # Microsoft Himalaya
    "himalaya.ttf::$cdn/bafybeidc5e2zjg2q3lrzwey63sxkqqgl7vascdf5oprlyu26ldzzts4uxm"

    # Microsoft New Tai Lue
    "ntailu.ttf::$cdn/bafkreig6bnrsafkep4umfw2bzdqhy5c45wyf5lk5xqxhh4m5ufgs4xzbke"
    "ntailub.ttf::$cdn/bafkreigpykwl7gxaebnaujmokzf5x5kgnjhetkksqgq5fzzgsdyut3edpm"

    # Microsoft PhagsPa
    "phagspa.ttf::$cdn/bafkreictrfeuqlmwj2ptkor2rwdaxm7nve5unobq6o3hpzhvh2zp6otopu"
    "phagspab.ttf::$cdn/bafkreiad4tsfxohlw3ifljkyiftmyjtrfp36orxkfhfw4vedie3b2mo4qu"

    # Microsoft Tai Le
    "taile.ttf::$cdn/bafkreihvcuoqqh3k72smezde4dgv42k7k6uzecop52rpja6dccdiizqowy"
    "taileb.ttf::$cdn/bafkreiaypccc3dn57bejpffpbowoswuvnwzhbx5fa3o4vk7zj6ucpn3jvq"

    # Microsoft Yi Baiti
    "msyi.ttf::$cdn/bafybeie6d5745e26gdbbuzyzfghw4nvzcx4d2nk6evyfgl33ozjwge2jtq"

    # Mongolian Baiti
    "monbaiti.ttf::$cdn/bafybeif7qo3lgfxrn4g224mokirs4hfw3qy2bw2w6ar2y2ez2l5z2z2v34"

    # Myanmar Text
    "mmrtext.ttf::$cdn/bafybeibx2n5htl4g47pbxkzzf2w2op7oqs6mo5gtikcoamj52q7ftxtpqq"
    "mmrtextb.ttf::$cdn/bafybeihzlxsnc45t2w4jlnhmkvebxfhnabj3v4v2f7his5sugdiviqo6hu"

    # Nirmala UI
    "Nirmala.ttf::$cdn/bafybeig7f3bayuypetrw7irp5vc6m2lxvnakxwawbznlizzi22f3vkuvni"
    "NirmalaB.ttf::$cdn/bafybeihv3h24x65tp3zlwsmwwdxkc5kmznawcq3ocxeccfn6oqsw33bzim"

    # Nirmala UI Semilight
    "NirmalaS.ttf::$cdn/bafybeigt245i52hnqbuok2g2djvz5ruu4lqtj34hh2lelm3oygcuiwlvk4"
)

_ttf_ms_win10_thai=(
    # Leelawadee UI
    "LeelawUI.ttf::$cdn/bafybeie7mtmqw5ezjoanuocydhmmh24usyrsskcl2abaiwlkz3xtiesxka"
    "LeelaUIb.ttf::$cdn/bafybeih4o7pigcfnizxkljw4wmdikmpm5bgugqmj3agfdwsyignlx7zd5e"

    # Leelawadee UI Semilight
    "LeelUIsl.ttf::$cdn/bafybeianuyc5i3ikjsiz3cc62czrm5ei7ifrcozueygga2ox3r5xfnchoa"
)

_ttf_ms_win10_zh_cn=( # Chinese (Simplified)
    # NSimSun
    "simsun.ttc::$cdn/bafybeiejnjddoj6qmcu4rzsovr3n24lcftlci4vi3qjbxhdxnkpyatgica"

    # SimSun-ExtB
    "simsunb.ttf::$cdn/bafybeiabvdgfyt7r5ukdaznfuu7s3xtnsnytusrihhwltvg3apz7h6l3nm"

    # Microsoft YaHei
    "msyh.ttc::$cdn/bafybeicgqpzphmamdbdn362e7x2u4inj4olac7pwggsszn2i54sckgh7x4"
    "msyhbd.ttc::$cdn/bafybeigftkqygxaactdkjlbu253lepynnghlzzpjow6vy6imbgdkr4u2ia"

    # Microsoft YaHei Light
    "msyhl.ttc::$cdn/bafybeigfeqiu76tugbk3rccrqf5mmucpj5f3mhkxbr5ketflwgco56iy44"
)

_ttf_ms_win10_zh_tw=( # Chinese (Traditional)
    # Microsoft JhengHei
    "msjh.ttc::$cdn/bafybeiashd3h4asderkew63kq7l7r3vjwlurtbzvcarhyxkw3gxpuf4e6m"
    "msjhbd.ttc::$cdn/bafybeie7mkddspoq7i3mfczubtjoekgtccxh5ocykcdsv2bajrz762npzi"

    # Microsoft JhengHei Light
    "msjhl.ttc::$cdn/bafybeifxoxw6tkwvwqalswtq7ndijb3qiavvf6snutuulzsx4xp43tit7q"

    # MingLiU_HKSCS-ExtB
    "mingliub.ttc::$cdn/bafybeig3ptveb6qfovspn2zrhiyjx7zvek2zkbbmm6vtajirhw3flpirza"
)

_ttf_ms_win10_other=(
    # Ebrima
    "ebrima.ttf::$cdn/bafybeifwrkizytextjya4zrzjv2m2nif36kfon35jgbkb2v24ctl6kos7u"
    "ebrimabd.ttf::$cdn/bafybeiejf2yowlget2jgyuxqghtzgkvb62iwlacfncoi6dngdtt5kaeule"

    # Gadugi
    "gadugi.ttf::$cdn/bafkreihpfqsfyw4jlzglj7lhwgcccqmsd7yx4was3dnmu7y7p53a5befki"
    "gadugib.ttf::$cdn/bafkreibbwjlo7mxkv553x6mymw6nuwr6as5xrwlubeu5bvxdpvgmkcxhwa"

    # MV Boli
    "mvboli.ttf::$cdn/bafkreiffw5bdepenud7ctmaah6yaooljw5lymx57sf4j2mramolvspcnni"
)

source=("${_ttf_ms_win10[@]}"
        "${_ttf_ms_win10_japanese[@]}"
        "${_ttf_ms_win10_korean[@]}"
        "${_ttf_ms_win10_sea[@]}"
        "${_ttf_ms_win10_thai[@]}"
        "${_ttf_ms_win10_zh_cn[@]}"
        "${_ttf_ms_win10_zh_tw[@]}"
        "${_ttf_ms_win10_other[@]}"
        "license.rtf::$cdn/bafkreihfikrbjwftwggi5lwaose4o45igrfx6refaiempq7ixlokunpdku")

sha256sums=('c9b76220a5be42ead4733611e417cd65c5fd8aeaa33eb56576ac378a37d130a1'
            '766f06ac8761f82f25d032a220e89438f6064591af9915061f20b949efdedf69'
            '79a5742b865cf06891d4ae43e42cac0e5169c7b7b06b5b3c24ef8e0966d27b62'
            'e432c1b3568bd207e30e3d52d41e6431ea53a679eb52dd79b1a36aa6a4f3b994'
            '10df702864b1f89cb29ba0d6b97c04228338d16807e13e8d8c74b91aba5e5f23'
            'bff1ca87ea35e376691498c618556411f0ee71784b32aa351e6e8f9e8bd609dd'
            '198e8dac512206f27c9bdbfeb3d5b3e55a33de9dcf58d801823ef8c5ef5a76dc'
            '4d5c56c07c41315022cd5a24966ade3983ceebce8bc81524e56e4632dd3f242f'
            '5c85b9adedde710e754b3163005291eca16cd0ccccc7c8d7ff526070e8980202'
            '95b49ebc8244b88ef49372833e8964dad6a3d7fa53e948609c5c73d5a1439912'
            '67374b8f4735eabfc7f173f28dc1789d7dbd4e2919532d173f6d697211cc3263'
            'a49f79197a091a82c45779b3cca7bc2cc7b471cf1447b55378c565c4f06844a5'
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
            'a183b77b655df66793639af7874828fb50f748dc4af57ae40f758156f7f34634'
            'fa008372f8a94945d0daef9daf0bfb9e3fba3a25fd17f2607d47ac6861bd0303'
            '9be778c9ed418770f6b5a02064d9c0b47a8fdea1137618f0bec9ac4072430a45'
            '588f090ae3a6d31370457312683d14ee3a5bfbdaaa0a070b7c80225b55b23e78'
            '0e36ddf90102e476c6739ca4c8cc18ba8309d880c12558981d2e4d42de78fc00'
            'a031500bccd32b5d6e819699b774fc679c696ed4965b643d51a94eb398475550'
            'bac844bd41f847cf138737026d41c983387a1065535c32e78aa22c48708b52ad'
            'df59f9ea915957b22a389d68580bf40dc5bd05822cc65b5fdcc188c706a694e7'
            'ddd852f9e43a5e81af62a3f6654324ba7553d7d66101ab848abc1bd2d626ac4b'
            '38dffcaf1fac89492f7c56c600a14daf36ae42f7c21985cd4134ae113124a58f'
            '72a6cd94fab6c179392075d3fb361e269cdddfad41bb7ab385fa22a37e49a900'
            'd3e4bad27651d120ac8f2cea42cf4b4f077264fb243f66b3caffcfd35465f49b'
            '3f9e512f82eaf6f1b7869b82013fb79f6eaf1a41e75a0e7b96f31f35b1022ae4'
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
            '1fabce5448df08c9e000bf9749c07c365c5ffba31bfc73121c61b5b96ea498c0'
            'ba32a222b23d727267cf1aba4e5296fe84ce99b9d910915103fc085d7931bc88'
            '1b242874a2f57529060e770ba313e027a99d40b3c36e1c7e8b2dece16ad6ed88'
            '9adf7d619c593ee38c96af06bb15b4bd893e4087bcc1a0b7becee8f4ae15bb1c'
            '45e7504e9bbd70ead482ebbddbeec04b2bea9f490b994658a95146cdf0733449'
            'e17738f092c8b02f4443867a7dfcdde66fb4cd6f6b10de8e40b2f3192f8a5835'
            '33212faa85fad61785cd6917172378b798bc9f5d4c47c121437354f47980aa6f'
            '7c0244dd8eeb7c6bdecdfc3f9e59833527fc18a66d0295ce47339069692a2b4f'
            '1cbe547c648ff673c30ca91c6a4f091addd1a4b605a9798f84089add47e9b884'
            '1a2231bbd4fad4a3ac8c0b8a93af0bce58324a8b3605df16038a9e660a0c072a'
            '7726b24daa0c1f47e528d8df78b98717bdb4425bcf37e50330945e32c6d17d7c'
            '9853283466bd43993b9813215281fb9c7090cbd8e9b5453f6d0d040622e117e2'
            '9959977d9fcf8ebc5fe48f6ee418f05378132b47d21bd5dcc798ad7cff274006'
            '38a85c09ee4fc558e7739ebdd1a15a06e2846ebb787cf73b1b6476a3a5b22000'
            '9f84a0a9193fe1d6335967f46606997a208adde053d006b21c03f9375ec5d416'
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
            '4bde3e6392b96910fb59094c6c1a4dbfae18fee78d0bf13dc30616837c4f95db'
            '1e5a4b342c6417bb9352e8c29cb839413987a06438e7b48fd0320925827f289c'
            '15157483588f2778a180f2b401256df12b582513fa0655f8172937c85521b80b'
            '3e7d80ef5a1615134800c1b1b3b9d9ee870085e8486b884258de2519dd62b1cb'
            '7a06352c79894d1a5d0f3199061fe43a327ded93c0ff316541ce31cf314968cc'
            '0086c19e81d293a542e7d75564c645fb58070cc850aefebf8fa1c397858e510c'
            'a541834fb9cdde9bd6d2c3ff1565cb0bb5ccf7a15e4e9daf2cb58d9b1cf282aa'
            'a7217a2e590c86141bddadc74a2bcdff2efe210db48469a77a749e0446d91ea9'
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
            '3ed4612d44f71851d33a126bb483b08a623feb0b2731025a73a41898dec7cee7'
            'f56f3c5a1c1896f83c977f90bf7ab39729f7ea2c39f4d7484b06635c7c6fc0bd'
            '290ab4239acf6145d080713cb79cf13be95f320d1ae47afea1f5dee4ad20ecc5'
            '07e0e53736a610b4c688fbac85159462d264b81359c76095639c6bce7e20d1e9'
            'c4b4a8d284a24a754fd745fcbbfe300df81b2be04c82278ee5d857b29cd64e64'
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
            'a97f0f43503d9f6ef87c1534eedc753084fa6154ca3fd0b6e51156621e28584a'
            '1e016947ceedd2b46dd098b5a033526ef4f0c0e7d58968a2203ab69443949350'
            'ef2c245c5b895e4cb4fd67b1842141921ff17e5812d8daca7f1f7f760e848552'
            '21b256efb2eaaf7bbbf99865bcda5a3e04bb78d9740929d0d6e37d4cc50ae7b0'
            'a5b742323c8da0fe29b0003fb0073969b757865fbf91789d32206397593c4d6a'
            'e542a214d8b3b18c8eaec07489c773a8344b7f44850208c7c3e8badcaa35e355')

prepare() {
  echo 'Please note, that usage of Microsoft fonts outside running Windows'
  echo 'system is prohibited by EULA (although in certain countries EULA is invalid).'
  echo 'Please consult Microsoft license before using fonts.'
}

_package() {
    conflicts+=(${pkgname/10/8} ttf-win7-fonts${pkgname##*10})
    for font in $@; do
        font=$(echo "$font" | cut -d':' -f1)
        install -Dm644 $font -t "$pkgdir/usr/share/fonts/TTF"
    done
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win10-cdn() {
    pkgdesc='Microsoft Windows 10 TrueType fonts via CDN'
    provides+=(ttf-tahoma ttf-ms-fonts)
    conflicts+=(ttf-tahoma ttf-ms-fonts)
    _package ${_ttf_ms_win10[@]}
}

package_ttf-ms-win10-cdn-japanese() {
    pkgdesc='Microsoft Windows 10 Japanese TrueType fonts via CDN'
    provides=(ttf-ms-win10-japanese)
    conflicts=(ttf-ms-win10-japanese ttf-ms-win10-auto-japanese)
    _package ${_ttf_ms_win10_japanese[@]}
}

package_ttf-ms-win10-cdn-korean() {
    pkgdesc='Microsoft Windows 10 Korean TrueType fonts via CDN'
    provides=(ttf-ms-win10-korean)
    conflicts=(ttf-ms-win10-korean ttf-ms-win10-auto-korean)
    _package ${_ttf_ms_win10_korean[@]}
}

package_ttf-ms-win10-cdn-sea() {
    pkgdesc='Microsoft Windows 10 Southeast Asian TrueType fonts via CDN'
    provides=(ttf-ms-win10-sea)
    conflicts=(ttf-ms-win10-sea ttf-ms-win10-auto-sea)
    _package ${_ttf_ms_win10_sea[@]}
}

package_ttf-ms-win10-cdn-thai() {
    pkgdesc='Microsoft Windows 10 Thai TrueType fonts via CDN'
    provides=(ttf-ms-win10-thai)
    conflicts=(ttf-ms-win10-thai ttf-ms-win10-auto-thai)
    _package ${_ttf_ms_win10_thai[@]}
}

package_ttf-ms-win10-cdn-zh_cn() {
    pkgdesc='Microsoft Windows 10 Simplified Chinese TrueType fonts via CDN'
    provides=(ttf-ms-win10-zh_cn)
    conflicts=(ttf-ms-win10-zh_cn ttf-ms-win10-auto-zh_cn)
    _package ${_ttf_ms_win10_zh_cn[@]}
}

package_ttf-ms-win10-cdn-zh_tw() {
    pkgdesc='Microsoft Windows 10 Traditional Chinese TrueType fonts via CDN'
    provides=(ttf-ms-win10-zh_tw)
    conflicts=(ttf-ms-win10-zh_tw ttf-ms-win10-auto-zh_tw)
    _package ${_ttf_ms_win10_zh_tw[@]}
}

package_ttf-ms-win10-cdn-other() {
    pkgdesc='Microsoft Windows 10 Other TrueType fonts via CDN'
    provides=(ttf-ms-win10-other)
    conflicts=(ttf-ms-win10-other ttf-ms-win10-auto-other)
    _package ${_ttf_ms_win10_other[@]}
}


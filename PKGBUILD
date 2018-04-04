# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=cdd
pkgver='2018.april.2'
pkgrel=1
pkgdesc='The Conserved Domain Database is a resource for the annotation of functional units in proteins. Its collection of domain models includes a set curated by NCBI, which utilizes 3D structure to provide insights into sequence/structure/function relationships.'
arch=('any')
license=('public domain')
url='ftp://ftp.ncbi.nih.gov'
depends=('')
makedepends=('bash')
provides=()
path='/pub/mmdb/cdd'
source=(
        "$url$path/bitscore_specific_3.16.txt"		#  1
        "$url$path/cd00030_notree.acd"			#  2
        "$url$path/cd00180_notree.acd"			#  3
        "$url$path/cd00838_notree.acd"			#  4
        "$url$path/cd00882_notree.acd"			#  5
        "$url$path/cd01391_notree.acd"			#  6
        "$url$path/cd01659_notree.acd"			#  7
        "$url$path/cd02039_notree.acd"			#  8
        "$url$path/cd04509_notree.acd"			#  9
        "$url$path/cd05188_notree.acd"			# 10
        "$url$path/cdd.info"				# 11
        "$url$path/cdd.tar.gz"				# 12
        "$url$path/cdd.versions"			# 13
        "$url$path/cddannot.dat.gz"			# 14
        "$url$path/cddannot_generic.dat.gz"		# 15
        "$url$path/cddid.tbl.gz"			# 16
        "$url$path/cddid_all.tbl.gz"			# 17
        "$url$path/cddmasters.fa.gz"			# 18
        "$url$path/cdtrack.txt"				# 19
        "$url$path/family_superfamily_links"		# 20
        "$url$path/fasta.tar.gz"			# 21
        "$url$path/little_endian/Cdd_LE.tar.gz"		# 22
        "$url$path/little_endian/Cdd_NCBI_LE.tar.gz"	# 23
        "$url$path/little_endian/Cog_LE.tar.gz"		# 24
        "$url$path/little_endian/Kog_LE.tar.gz"		# 25
        "$url$path/little_endian/Pfam_LE.tar.gz"	# 26
        "$url$path/little_endian/Prk_LE.tar.gz"		# 27
        "$url$path/little_endian/Smart_LE.tar.gz"	# 28
        "$url$path/little_endian/Tigr_LE.tar.gz"	# 29
)
noextract=(
	'Cdd_LE.tar.gz'
	'Cdd_NCBI_LE.tar.gz'
        'Cog_LE.tar.gz'
        'Kog_LE.tar.gz'
        'Pfam_LE.tar.gz'
        'Prk_LE.tar.gz'
        'Smart_LE.tar.gz'
        'Tigr_LE.tar.gz'
)

sha512sums=(
'8caf2f677b7dc9f58a681fb7f2cbaeb8c5a3aa72f707796b320ba7a7def11b8e77f22d64c97e9ac757714edf9546e80c53bdd119cff56f6a4c92994d5ccbd292'  #bitscore_specific_3.16.txt #01
'05d84742a44af9f38cb5a94dd3e873ed5097468fc1e70ab1b99b301b371e9fef50cc4dc66035519f128b0032c2611aecfeb4cce2f41da89a3ed7aa3856c79f3b'  #cd00030_notree.acd         #02
'e56d716fdc0f7ba5d8109257cd7298ae0a06359b51f0172f11ab4c89a2d2d8e8444f5a9c09f8e8d55d9ae4534ec2f0f7054e1e304d8e6145548c90317190e523'  #cd00180_notree.acd         #03
'98269ebfa14dc685a53942570ebb803dc9f58c6a2e669b0f7af5900dff55688d96cdf85f888c8d77992893f60c854542ebf67b1e45081718cf1d83ccc1f47ab8'  #cd00838_notree.acd         #04
'd2dca9ef924cb1d663a24523fac35b7186ad36c8a326449ccd13432a6365ebe18ae77389f1e9a7a5d789181b0234cbaa924c853880b8b749954ab17fb0d96363'  #cd00882_notree.acd         #05
'644243ace3a5bfbe2be7fd89a0350853616dfd958525c36c07c82d5a70478b68dab0e7444a07d1809b89bec842e0167f5872e4f9540116075b20c329ceb76c5d'  #cd01391_notree.acd         #06
'34061a1e4b6de46b43c652b6d7c231ebe971fb098e48b0d48bcc72ea20b9619d34cf5bc806bceb6ee1296b80607d0beb946518dbda7cce15ab0922c4e5d7b6f4'  #cd01659_notree.acd         #07
'2ccd5aa5bdce3ddb020123273d7c9805f8a7b319f4fd5cc32a3df34252272b599064d08e535515db4e98ba16b840f004ac8f9b761f29ce9eb3a4bbaec57631e4'  #cd02039_notree.acd         #08
'fabd2e10e5b850207a2c9d1c1114472fa25d5f7a6638ba1e390db24b0267be0610c5d5d6fa42aeaafb608bd2ec9d9472034e184456eeb06cb22462522394bf23'  #cd04509_notree.acd         #09
'eb3bd2c33a805374f91ba126276ab50d3fbbbf85bf50c91875bd9ee796d18654d3f95e1deca742d696bcd175bb2f5b6baa394593eb7e101427539abe2390e571'  #cd05188_notree.acd         #10
'61a96e160f62747e2503c5d6471ec32fc33d03631694a863abdf646b163ac4533da1251b900483f19484644412c5b3cb7dab73dbe8c02c4c65dd06dd9f0a5767'  #cdd.info                   #11
'b289be9d77ae489dfd25a8df5865cde5e4dd7f9be7e2058ecd66b03c4b82d0cfa20534b4257f163e6ac27bc4fe17f1c6f76fbf985df106d1295b48cbcc5bce2d'  #cdd.tar.gz                 #12
'0fb105322980eda763e0e736ec0722e4d5f4c64b84f6837bf3e5e02fe0118f04a78b56d5b56b92c9ca8572878a4bc22d120c3ee78ed285568ee0831117bf6e13'  #cdd.versions               #13
'858794c19305f7777eba156748654294291ce81be1d8f3e84d4e8272635bce7534ff926c1ec7818fc0e7d0438747f2814866f1930ac0627e0e111a4272d523c7'  #cddannot.dat.gz            #14
'7f15d6a51ca255f096f6624c836a4730041b011e0728d32aa635c04848b016e67b515853c3fa94a36750f3d5282857977dd365afc7fbd40ce4f4f14f36884c23'  #cddannot_generic.dat.gz    #15
'729ff50ce660448880a2722cbe53efd4f336bcd842ed0fddf6ef5c5cdcf5e904d593831d54a8fed4f5c262fdcb630824a37bc38ee94a7074f28120a860c67323'  #cddid.tbl.gz               #16
'e7e882e5e25943d1b3de6de571a3ff8ed161234127388f7a920f233cb2a586af3e6fd0a643433f13a9f71ba53105a8901c97ab305bd409454477e3cc536d15d4'  #cddid_all.tbl.gz           #17
'd425b9649856e172165c9fc8dea4a004bdd560b06922ff7458708263c328146c26c18f3bbca30fffa16b1fa64665ac2fed37aced39179edd5ad46436caafaba5'  #cddmasters.fa.gz           #18
'3f70c1f50f6ea8e7def80ae67734a6ee4295cf8a5afd9f7b2e9bd076ae285e269cbe2617526d20cba5fcea79701c348633185ad6bf20b552d1c9747331951279'  #cdtrack.txt                #19
'03ba3f8acca3d14053c91b164fdfed4acb039fb07992976c66c089eef5f40006223b6a9ba30f195b323b6827b8a72daf7a0c559966374d1fee5066179b6ace6c'  #family_superfamily_links   #20
'f9826bbf6066209023144da38b5935c5feb3124c3cd5633ed571fb1715764cc9b2f04f9f4601e452904889ab9f067caa446538e1b53423f93bf7656b2e739f66'  #fasta.tar.gz               #21
'2dd5609664e99aee1e88aa2274c38172dceebdce4b09302c73a9211ae925d508809f6ad9842f5918bd88fde0c40d9d06267a835fedfc9e2ee20dd745bf3e7c1f'  #Cdd_LE.tar.gz              #22
'd7f56de9b0e0b95e4b0cfbf22e65a7c59519e93aa77d0bcf29f04e34499f1ba4534d9af4164bd6829c0d64db24e55ace704a1d74ddc48cb04fecf31287426978'  #Cdd_NCBI_LE.tar.gz         #23
'90b8809fa1ab151bb594c779a0bf3cd30ff112ca7b429588af22b7509e8e244c60127d3dd92edfad7342db64f84bc982ab3cc7dfe15cfa2e62e695119466e027'  #Cog_LE.tar.gz              #24
'5730c62badf1e747e71a7dc036a27d12cbecfa2d73dd2e84ad0aa2675a2ff9818e7d0824507055eb6ab97b408aaa1c28a048b1ed191b934539751c112d9d324e'  #Kog_LE.tar.gz              #25
'60fad8fcf674f39a3a7b08a6720281ad70f10b77496d52f39c7395b5a4308d0ea29b6312a8717e227ab97973018d557c244b97767d4b284916be2a4352c68aab'  #Pfam_LE.tar.gz             #26
'16e24b3ae47afe6aa4c124520a7cd08450606031376f400e13780681bddc498a49a250f90883fbdbfa6513605b33f1cb4d3d2c79cbc544206afb8ad4faf0ce1a'  #Prk_LE.tar.gz              #27
'e9559e2d67d3441a4d9b0be5e545422ee6e441686e9a4b165194efb6a0f3a50b63bf089219281f4a10cd1fbe256c8bb970e9ea70d6eff8de1eb7ec72558826bf'  #Smart_LE.tar.gz            #28
'2feee3c200dab5dac993cedd0d80181cca4a2337d22987e3d40464c128547283a00c2cdbfbd4da53bda405b4c9a1f7c454211d5330426c451e184999e2f251e9'  #Tigr_LE.tar.gz             #29
)


build() {
  mkdir -p "$srcdir/little_endian"
  cp -HLf -t "$srcdir/little_endian" Cdd_LE.tar.gz Cdd_NCBI_LE.tar.gz Cog_LE.tar.gz Kog_LE.tar.gz Pfam_LE.tar.gz Prk_LE.tar.gz Smart_LE.tar.gz Tigr_LE.tar.gz
  cd "$srcdir/little_endian" 
  gunzip -f *.gz
  for tar_file in *.tar ; do
    tar -xf "$tar_file"
  done
}

package() {
  mkdir -p  "$pkgdir/opt/$pkgname/"

  ls | egrep -v '.+\.gz|.+\.tgz|LICENSE' | while read -r fileName ; do
    cp -rfLH "$fileName" "$pkgdir/opt/$pkgname/"
  done
}

#!/bin/bash

rm -Rf aufs5-standalone
# clone the aufs repository to the local disk
git clone git://github.com/sfjro/aufs5-standalone.git aufs5-standalone
cd aufs5-standalone
git branch -r
git checkout origin/aufs5.x-rcN

# modify what you want

# and after
# create the patch with the directories: fs, include and Documentation

rm -v $(find . -type f -name '*.orig')
#grep -qse 'EXPORT_SYMBOL(' aufs4-standalone.patch && \
#sed -i-old -e 's|EXPORT_SYMBOL(|EXPORT_SYMBOL_GPL(|' aufs4-standalone.patch
rm -rvf ../tmp/linux-5.x-rcN
mkdir -p ../tmp/linux-5.x-rcN
cp -a fs ../tmp/linux-5.x-rcN
cp -a include ../tmp/linux-5.x-rcN
cp -a Documentation ../tmp/linux-5.x-rcN
rm -v ../tmp/linux-5.x-rcN/include/uapi/linux/Kbuild
cd ../tmp
diff -Naur null linux-5.x-rcN  | filterdiff | \
sed -e 's|null\(/include/uapi/linux/Kbuild\)|linux-5.x-rcN-old\1|;s|^--- null.*|--- /dev/null|;\|linux-5.x-rcN/include/uapi/linux/Kbuild|,${\|@@ -0,0 +1 @@|,$d}' \
> aufs$(sed -ne 's|#define.*AUFS_VERSION.*"\(.*\)"|\1|p'  linux-5.x-rcN/include/uapi/linux/aufs_type.h).patch
mv *.patch $OLDPWD
cd $OLDPWD
mv *.patch ..
cd ..
rm -Rf tmp
rm -Rf aufs5-standalone


# the patch is created in ../tmp
# the other patches needed to compile are in the base directory

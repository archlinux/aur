#!/bin/sh

thedirs="."
repodir=/home/own-repo

thingsToDo=(
  'for n in $thedirs; do ( cd $n && updpkgsums); done'
  'for n in $thedirs; do ( cd $n && makepkg --force --nodeps --nobuild; makepkg --printsrcinfo > .SRCINFO ); done'
  'git diff --quiet --no-ext-diff --exit-code && echo clean || ( git diff -b -w && git add -p && git commit ) || true'
  'for n in $thedirs; do ( cd $n && makepkg --force --nodeps --noextract --cleanbuild --skipchecksums); done'
  'test -n "$repodir" -a -d "$repodir" && for n in $thedirs; do for pkgdir in $(find $n -name "*.tar.xz" -printf "%h\n" | sort | uniq); do cpfn=$(ls -tc1 $pkgdir/*.tar.xz | head -1); echo "move [$cpfn]? (y*|n)"; read v; if [ ! "$v" = "n" -a ! "$v" = "N" ]; then sh -c "mv --interactive --update $cpfn $repodir && ( repo-add --new --quiet ${repodir}/ownrepo.db.tar.gz $repodir/$(basename $cpfn); )"; fi; done; done'
  'git push origin'
  'for n in $thedirs; do ( cd $n && makepkg --nodeps --noextract --force --nobuild --noarchive --nocheck --noprepare --skipinteg --clean ); done'
)

set -e

for n in "${thingsToDo[@]}"; do
  echo "Continue with [$n] (y*|n)?"
  read v
  if [ "$v" = "n" -o "$v" = "N" ]; then
    echo "..command skipped..";
  else
    eval "$n";
  fi
done


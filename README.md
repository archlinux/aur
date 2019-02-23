# HPX on AUR

This repository contains a `PKGBUILD` for building HPX on Arch Linux. It also
contains some helper scripts for updating the package when new versions are
released. Given a version number, it automatically fetches the package, updates
checksums, and pushes the files to a new branch, which will be tested on
GitLab's CI. If tests pass the package is most likely good to go. The scripts do
not automatically push the updated files to the official AUR repository---that
still has to be done manually.

Typical usage:

```sh
./update_and_push_ci.sh 1.2.3
```

If changes are needed, do them manually on the branch and push. Once the branch
has been merged to `master` do:

```sh
git checkout master 
git pull gitlab master
git push origin
```

This assumes that the official AUR repository is called `origin`.

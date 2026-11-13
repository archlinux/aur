## Patch workflow using `quilt`

### 1. Rebasing patches
```sh
make update_version
make patch-init
make patch-export .SRCINFO
```

### 2. Conflict resolution
```sh
cd src/core-*
quilt push -f -m
$VISUAL $(quilt files)
quilt refresh
quilt push -a
popd
make patch-export .SRCINFO
```

### 3. Create new patch
```sh
make patch-init
cd src/core-*
quilt new 02-my.patch
quilt add path/to/file.py
$EDITOR path/to/file.py
quilt refresh
popd
make patch-export .SRCINFO
```

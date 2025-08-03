# OpenSoruce Search Engine

For more information take a look at, [Github](https://github.com/Xtarii/OSSE-Core)


### Installation
```bash
yay -Ss osse-core
```

To import into a project include this in the cmake file
```bash
find_package(OSSE)
...
target_link_libraries(<target> OSSE::osse)
```

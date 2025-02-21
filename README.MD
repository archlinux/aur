## 更新hash

```shell
updpkgsums
```

## 打包

```shell
makepkg

makepkg -s # 自动处理依赖
```

## 发布

```shell
makepkg --printsrcinfo > .SRCINFO
```
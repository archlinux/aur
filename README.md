# Compbench
A CLI tool for testing the compression performance of a file under different algorithms

## Usage
```bash
> compbench
文件压缩效率比较工具 (跨平台版)
用法: compbench -i 输入文件 [选项]
选项:
  -a string
        指定测试的算法(逗号分隔)或all测试所有算法 (default "all")
  -i string
        输入文件路径 (必需)
  -l int
        压缩级别: 0(最低) - 9(最高) (默认值取决于算法) (default -1)
  -o string
        输出文件路径 (默认为不输出压缩文件)
  -show-all
        显示所有算法（包括平台不支持的）
  -v int
        详细模式: 0(默认), 1(详细信息), 2(调试)

支持的压缩算法:
  全平台支持: gzip, zlib, deflate, br, zstd, lz4, snappy, lzw, lzo1, lzo1a, lzo1b, lzo1c, lzo1f, lzo1x

注意:
  - LZO系列算法不准确
  - LZ4系列算法不支持调整压缩级别
  - 使用'-show-all'显示所有算法（包括平台不支持的）

示例:
  compbench -i file.txt
  compbench -i file.log -l 9 -a gzip,br,zstd -o compressed.br
  compbench -i large.bin -v 1 -show-all
```
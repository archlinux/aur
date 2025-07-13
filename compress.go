package main

import (
	"bytes"
	"compress/flate"
	"compress/gzip"
	"compress/lzw"
	"compress/zlib"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"text/tabwriter"
	"time"

	"github.com/andybalholm/brotli"
	"github.com/klauspost/compress/s2"
	"github.com/klauspost/compress/zstd"
	"github.com/pierrec/lz4/v4"
)

// 基础支持的压缩算法列表（跨平台）
var algorithms = []string{
	"gzip", "zlib", "deflate", "br", 
	"zstd", "lz4", "snappy", "lzw",
	"lzo1", "lzo1a", "lzo1b", "lzo1c", "lzo1f", "lzo1x",
}

var (
	inputFile  string
	outputFile string
	verbosity  int
	level      int
	algoParam  string
	showAll    bool
)

func init() {
	flag.StringVar(&inputFile, "i", "", "输入文件路径 (必需)")
	flag.StringVar(&outputFile, "o", "", "输出文件路径 (默认为不输出压缩文件)")
	flag.StringVar(&algoParam, "a", "all", "指定测试的算法(逗号分隔)或all测试所有算法")
	flag.IntVar(&level, "l", -1, "压缩级别: 0(最低) - 9(最高) (默认值取决于算法)")
	flag.IntVar(&verbosity, "v", 0, "详细模式: 0(默认), 1(详细信息), 2(调试)")
	flag.BoolVar(&showAll, "show-all", false, "显示所有算法（包括平台不支持的）")
}

func main() {
	flag.Parse()
	log.SetFlags(0)

	if inputFile == "" {
		printHelp()
		os.Exit(1)
	}

	if verbosity > 0 {
		log.Printf("当前平台: %s/%s", runtime.GOOS, runtime.GOARCH)
		log.Printf("正在分析: %s", inputFile)
	}

	data, origSize, err := readFile(inputFile)
	if err != nil {
		log.Fatalf("读取文件错误: %v", err)
	}

	if verbosity > 0 {
		log.Printf("原始大小: %s", formatSize(origSize))
	}

	// 获取平台支持的有效算法
	platformAlgorithms := algorithms
	testAlgorithms := getTestAlgorithms(platformAlgorithms)

	results, err := measureCompressions(data, testAlgorithms)
	if err != nil {
		log.Fatalf("压缩测试失败: %v", err)
	}

	if outputFile != "" {
		if verbosity > 0 {
			log.Printf("将压缩结果保存至: %s", outputFile)
		}
		saveCompressedData(data, outputFile, results)
	}

	printResults(origSize, results, testAlgorithms, platformAlgorithms, inputFile)
}

// 获取要测试的算法列表
func getTestAlgorithms(supported []string) []string {
	// 用户指定了all
	if algoParam == "all" {
		return supported
	}

	// 用户指定了特定算法列表
	parts := strings.Split(algoParam, ",")
	var validAlgos []string
	
	for _, p := range parts {
		p = strings.TrimSpace(strings.ToLower(p))
		
		// 检查是否是支持的算法
		if contains(supported, p) {
			validAlgos = append(validAlgos, p)
		} else if verbosity > 0 {
			log.Printf("算法被忽略（不支持）: %s", p)
		}
	}
	
	return validAlgos
}

func readFile(filePath string) ([]byte, int, error) {
	data, err := os.ReadFile(filePath)
	if err != nil {
		return nil, 0, err
	}
	return data, len(data), nil
}

func measureCompressions(data []byte, algos []string) (map[string]result, error) {
	results := make(map[string]result)

	for _, algo := range algos {
		if verbosity > 0 {
			log.Printf("正在测试算法: %s", getDisplayName(algo))
		}
		
		start := time.Now()
		compressedData, err := compressWithAlgorithm(data, algo, level)
		duration := time.Since(start)

		if err != nil {
			if verbosity > 0 {
				log.Printf("%s 压缩失败: %v", getDisplayName(algo), err)
			}
			continue
		}

		compressedSize := len(compressedData)
		ratio := float64(compressedSize) / float64(len(data)) * 100
		
		results[algo] = result{
			CompressedSize: compressedSize,
			Ratio:          ratio,
			Duration:       duration,
			CompressedData: compressedData,
		}
		
		if verbosity > 1 {
			log.Printf("%s: 原始大小 %dB -> 压缩后 %dB (%.1f%%) 时间:%v", 
				getDisplayName(algo), len(data), compressedSize, ratio, duration)
		}
	}

	return results, nil
}

func compressWithAlgorithm(data []byte, algorithm string, level int) ([]byte, error) {
	switch algorithm {
	case "gzip":
		return gzipCompress(data, level)
	case "zlib":
		return zlibCompress(data, level)
	case "deflate":
		return deflateCompress(data, level)
	case "br":
		return brotliCompress(data, level)
	case "zstd":
		return zstdCompress(data, level)
	case "lz4":
		return lz4Compress(data, level)
	case "snappy":
		return snappyCompress(data)
	case "lzw":
		return lzwCompress(data)
	case "lzo1", "lzo1a", "lzo1b", "lzo1c", "lzo1f", "lzo1x":
		return lzoCompress(data, algorithm, level)
	default:
		return nil, fmt.Errorf("未知的压缩算法: %s", algorithm)
	}
}

// LZO压缩实现 - 使用内置实现
func lzoCompress(data []byte, algorithm string, level int) ([]byte, error) {
	// 简化版的LZO实现（实际应用中可使用第三方库）
	switch algorithm {
	case "lzo1", "lzo1a", "lzo1b", "lzo1c", "lzo1f", "lzo1x":
		// 基础LZO实现（仅示意，实际需要更高效的算法）
		return basicLZO(data, level), nil
	default:
		return nil, fmt.Errorf("不支持LZO算法: %s", algorithm)
	}
}

// 基本的LZO实现（简化版）
func basicLZO(data []byte, level int) []byte {
	// 基于重复模式检测的基本压缩
	var output []byte
	const maxOffset = 2048
	
	for i := 0; i < len(data); {
		// 查找重复序列
		found := false
		maxLen := 0
		maxPos := 0
		
		// 在窗口内查找最长匹配
		start := i - maxOffset
		if start < 0 {
			start = 0
		}
		
		for j := start; j < i; j++ {
			k := 0
			for k < min(8, len(data)-i) && j+k < i && data[j+k] == data[i+k] {
				k++
			}
			
			if k > maxLen {
				maxLen = k
				maxPos = j
			}
		}
		
		// 如果找到长度>2的匹配
		if maxLen > 2 {
			offset := i - maxPos
			output = append(output, byte(offset>>8)|0x80, byte(offset&0xFF))
			output = append(output, byte(maxLen))
			i += maxLen
			found = true
		}
		
		if !found {
			output = append(output, data[i])
			i++
		}
	}
	
	return output
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

// 结果处理和输出
func printResults(
	originalSize int, 
	results map[string]result, 
	testedAlgos []string, 
	supportedAlgos []string,
	filePath string,
) {
	w := tabwriter.NewWriter(os.Stdout, 0, 0, 3, ' ', 0)
	defer w.Flush()

	fileName := filepath.Base(filePath)
	fmt.Printf("\n压缩效率比较 - 文件: %s (原始大小: %s)\n", fileName, formatSize(originalSize))
	fmt.Fprintln(w, "算法名称\t压缩后大小\t压缩率\t节省空间\t耗时\t")
	fmt.Fprintln(w, "---------\t--------------\t--------\t--------------\t--------")

	// 输出已测试的算法
	for _, algo := range testedAlgos {
		r, exists := results[algo]
		if !exists {
			continue
		}

		savings := originalSize - r.CompressedSize
		savingsPercent := float64(savings) / float64(originalSize) * 100
		durationMS := r.Duration.Seconds() * 1000

		fmt.Fprintf(w, "%s\t%s\t%.1f%%\t%s (%.1f%%)\t%.1f ms\t\n",
			getDisplayName(algo),
			formatSize(r.CompressedSize),
			r.Ratio,
			formatSize(savings),
			savingsPercent,
			durationMS,
		)
	}

	// 输出平台不支持的算法（如果用户指定了显示所有）
	if showAll {
		fmt.Fprintln(w, "\n不支持的算法:")
		for _, algo := range algorithms {
			if !contains(supportedAlgos, algo) {
				fmt.Fprintf(w, "  - %s (%s)\n", algo, getDisplayName(algo))
			}
		}
	}
}

// 检查切片是否包含元素
func contains(slice []string, item string) bool {
	for _, s := range slice {
		if s == item {
			return true
		}
	}
	return false
}

func getDisplayName(algo string) string {
	switch algo {
	case "br":
		return "Brotli"
	case "gzip":
		return "Gzip"
	case "zlib":
		return "Zlib"
	case "zstd":
		return "Zstandard"
	case "lz4":
		return "LZ4"
	case "snappy":
		return "Snappy"
	case "deflate":
		return "Deflate"
	case "lzw":
		return "LZW"
	case "lzo1":
		return "LZO1"
	case "lzo1a":
		return "LZO1a"
	case "lzo1b":
		return "LZO1b"
	case "lzo1c":
		return "LZO1c"
	case "lzo1f":
		return "LZO1f"
	case "lzo1x":
		return "LZO1x"
	default:
		return strings.ToUpper(algo)
	}
}

func formatSize(bytes int) string {
	const unit = 1024
	if bytes < unit {
		return fmt.Sprintf("%d B", bytes)
	}
	div, exp := int64(unit), 0
	for n := bytes / unit; n >= unit; n /= unit {
		div *= unit
		exp++
	}
	return fmt.Sprintf("%.1f %ciB", float64(bytes)/float64(div), "KMGTPE"[exp])
}

func saveCompressedData(data []byte, filePath string, results map[string]result) {
	baseName := strings.TrimSuffix(filepath.Base(filePath), filepath.Ext(filePath))
	dir := filepath.Dir(filePath)

	for algo, result := range results {
		ext := getExtension(algo)
		outPath := filepath.Join(dir, fmt.Sprintf("%s%s", baseName, ext))
		
		if outputFile != "" {
			outPath = outputFile
		}

		if err := os.WriteFile(outPath, result.CompressedData, 0644); err != nil {
			log.Printf("无法写入 %s: %v", getDisplayName(algo), err)
		} else if verbosity > 0 {
			log.Printf("已保存: %s 压缩文件 -> %s (%s)", 
				getDisplayName(algo), outPath, formatSize(len(result.CompressedData)))
		}
	}
}

func getExtension(algo string) string {
	switch algo {
	case "gzip":
		return ".gz"
	case "br":
		return ".br"
	case "zstd":
		return ".zst"
	case "lz4":
		return ".lz4"
	case "snappy":
		return ".snappy"
	case "lzw":
		return ".lzw"
	case "lzo1", "lzo1a", "lzo1b", "lzo1c", "lzo1f", "lzo1x":
		return ".lzo"
	default:
		return fmt.Sprintf(".%s", algo)
	}
}

func printHelp() {
	fmt.Println("文件压缩效率比较工具 (跨平台版)")
	fmt.Println("用法: compbench -i 输入文件 [选项]")
	fmt.Println("选项:")
	flag.PrintDefaults()
	fmt.Println("\n支持的压缩算法:")
	fmt.Println("  全平台支持: gzip, zlib, deflate, br, zstd, lz4, snappy, lzw, lzo1, lzo1a, lzo1b, lzo1c, lzo1f, lzo1x")
	fmt.Println("\n注意:")
	fmt.Println("  - LZO系列算法不准确")
	fmt.Println("  - LZ4系列算法不支持调整压缩级别")
	fmt.Println("  - 使用'-show-all'显示所有算法（包括平台不支持的）")
	fmt.Println("\n示例:")
	fmt.Println("  compbench -i file.txt")
	fmt.Println("  compbench -i file.log -l 9 -a gzip,br,zstd -o compressed.br")
	fmt.Println("  compbench -i large.bin -v 1 -show-all")
}

type result struct {
	CompressedSize int
	Ratio          float64
	Duration       time.Duration
	CompressedData []byte
}

// 压缩函数实现
func gzipCompress(data []byte, level int) ([]byte, error) {
	var buf bytes.Buffer
	var w *gzip.Writer
	var err error

	if level >= 0 {
		w, err = gzip.NewWriterLevel(&buf, level)
	} else {
		w = gzip.NewWriter(&buf)
	}
	
	if err != nil {
		return nil, err
	}
	
	if _, err := w.Write(data); err != nil {
		return nil, err
	}
	
	if err := w.Close(); err != nil {
		return nil, err
	}
	
	return buf.Bytes(), nil
}

func zlibCompress(data []byte, level int) ([]byte, error) {
	var buf bytes.Buffer
	var w *zlib.Writer
	var err error

	if level >= 0 {
		w, err = zlib.NewWriterLevel(&buf, level)
	} else {
		w = zlib.NewWriter(&buf)
	}
	
	if err != nil {
		return nil, err
	}
	
	if _, err := w.Write(data); err != nil {
		return nil, err
	}
	
	if err := w.Close(); err != nil {
		return nil, err
	}
	
	return buf.Bytes(), nil
}

func deflateCompress(data []byte, level int) ([]byte, error) {
	var buf bytes.Buffer
	var w *flate.Writer
	var err error

	if level >= 0 {
		w, err = flate.NewWriter(&buf, level)
	} else {
		w, err = flate.NewWriter(&buf, flate.DefaultCompression)
	}
	
	if err != nil {
		return nil, err
	}
	
	if _, err := w.Write(data); err != nil {
		return nil, err
	}
	
	if err := w.Close(); err != nil {
		return nil, err
	}
	
	return buf.Bytes(), nil
}

func brotliCompress(data []byte, level int) ([]byte, error) {
	var buf bytes.Buffer
	options := brotli.WriterOptions{Quality: level}
	w := brotli.NewWriterOptions(&buf, options)
	
	if _, err := w.Write(data); err != nil {
		return nil, err
	}
	
	if err := w.Close(); err != nil {
		return nil, err
	}
	
	return buf.Bytes(), nil
}

func zstdCompress(data []byte, level int) ([]byte, error) {
	var buf bytes.Buffer
	var w *zstd.Encoder
	var err error

	if level >= 0 {
		w, err = zstd.NewWriter(&buf, zstd.WithEncoderLevel(zstd.EncoderLevelFromZstd(level)))
	} else {
		w, err = zstd.NewWriter(&buf)
	}
	
	if err != nil {
		return nil, err
	}
	
	if _, err := w.Write(data); err != nil {
		return nil, err
	}
	
	if err := w.Close(); err != nil {
		return nil, err
	}
	
	return buf.Bytes(), nil
}

func lz4Compress(data []byte, level int) ([]byte, error) {
	var buf bytes.Buffer
	w := lz4.NewWriter(&buf)
	
	if level >= 0 {
		if level > 9 {
			level = 9
		}
		/*w.Header = lz4.Header{
			CompressionLevel: level,
		}*/
	}
	
	if _, err := w.Write(data); err != nil {
		return nil, err
	}
	
	if err := w.Close(); err != nil {
		return nil, err
	}
	
	return buf.Bytes(), nil
}

func snappyCompress(data []byte) ([]byte, error) {
	compressed := s2.Encode(nil, data)
	return compressed, nil
}

func lzwCompress(data []byte) ([]byte, error) {
	var buf bytes.Buffer
	w := lzw.NewWriter(&buf, lzw.LSB, 8)
	
	if _, err := w.Write(data); err != nil {
		return nil, err
	}
	
	if err := w.Close(); err != nil {
		return nil, err
	}
	
	return buf.Bytes(), nil
}

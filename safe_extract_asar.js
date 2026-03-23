const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// ===================== 配置项（确认路径正确）=====================
const ASAR_FILE_PATH = '/home/zxp-endeavouros/.cache/paru/clone/onekey-wallet-bin/src/squashfs-root/resources/app.asar';
const OUTPUT_DIR = '/home/zxp-endeavouros/.cache/paru/clone/onekey-wallet-bin/src/app.asar.unpacked'; // 解压输出目录
// 排除所有导致报错的文件规则
const EXCLUDE_PATTERNS = [
  /node_modules\/@serialport\/bindings-cpp\/prebuilds\/android-.*/,
  /node_modules\/@serialport\/bindings-cpp\/prebuilds\/darwin-.*/,
  /node_modules\/@serialport\/bindings-cpp\/prebuilds\/win32-.*/,
  /node_modules\/@stoprocent\/bluetooth-hci-socket\/prebuilds\/android-.*/,
  /node_modules\/@stoprocent\/bluetooth-hci-socket\/prebuilds\/darwin-.*/,
  /node_modules\/@stoprocent\/bluetooth-hci-socket\/prebuilds\/win32-.*/,
  /node_modules\/@stoprocent\/noble\/prebuilds\/android-.*/,
  /node_modules\/@stoprocent\/noble\/prebuilds\/darwin-.*/,
  /node_modules\/@stoprocent\/noble\/prebuilds\/win32-.*/,
  /node_modules\/usb\/prebuilds\/android-.*/,
  /node_modules\/usb\/prebuilds\/darwin-.*/,
  /node_modules\/usb\/prebuilds\/win32-.*/,
];
// ================================================================

// 核心：安全解压（过滤报错文件）
function safeExtractAsar() {
  try {
    // 1. 创建输出目录
    if (!fs.existsSync(OUTPUT_DIR)) {
      fs.mkdirSync(OUTPUT_DIR, { recursive: true });
      console.log(`📂 创建输出目录：${OUTPUT_DIR}`);
    }

    // 2. 获取asar包所有文件列表（用全局asar命令）
    console.log('🔍 读取asar包文件列表...');
    let fileListOutput = '';
    try {
      // 执行asar list命令，获取所有文件
      fileListOutput = execSync(`asar list "${ASAR_FILE_PATH}"`, { 
        encoding: 'utf8',
        stdio: ['ignore', 'pipe', 'ignore'] // 屏蔽无关输出
      });
    } catch (e) {
      throw new Error(`读取文件列表失败：${e.message}`);
    }
    // 处理文件列表（去空行）
    const fileList = fileListOutput.split('\n').filter(file => file.trim() !== '');
    if (fileList.length === 0) {
      throw new Error('asar包内无文件，可能包损坏');
    }
    console.log(`📄 检测到 ${fileList.length} 个文件，开始过滤解压...`);

    // 3. 逐个解压文件（跳过排除/缺失文件）
    let extractedCount = 0;
    let skippedCount = 0;
    for (const file of fileList) {
      // 跳过排除规则的文件
      if (EXCLUDE_PATTERNS.some(pattern => pattern.test(file))) {
        skippedCount++;
        // console.log(`🚫 跳过排除文件：${file}`); // 可选：取消注释查看跳过的文件
        continue;
      }

      try {
        // 拼接输出文件路径
        const outputFilePath = path.join(OUTPUT_DIR, file);
        const outputFileDir = path.dirname(outputFilePath);
        
        // 创建文件所在目录
        if (!fs.existsSync(outputFileDir)) {
          fs.mkdirSync(outputFileDir, { recursive: true });
        }

        // 关键：用asar ef提取单个文件到指定路径
        execSync(
          `asar ef "${ASAR_FILE_PATH}" "${file}" -o "${outputFilePath}"`,
          { stdio: 'ignore' } // 屏蔽所有输出，只关注是否成功
        );
        extractedCount++;
      } catch (e) {
        skippedCount++;
        // console.log(`⚠️  跳过缺失文件：${file}`); // 可选：取消注释查看缺失文件
      }
    }

    // 4. 输出结果
    console.log(`\n🎉 解压完成！`);
    console.log(`   ✅ 成功解压：${extractedCount} 个文件`);
    console.log(`   🚫 跳过/排除：${skippedCount} 个文件`);
    console.log(`   📂 解压目录：${path.resolve(OUTPUT_DIR)}`);

  } catch (mainError) {
    console.error(`❌ 解压失败：${mainError.message}`);
    // 清理临时目录
    if (fs.existsSync(OUTPUT_DIR)) {
      fs.rmSync(OUTPUT_DIR, { recursive: true, force: true });
    }
    process.exit(1);
  }
}

// 执行主函数
safeExtractAsar();

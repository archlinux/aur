const fs = require('fs');
const path = require('path');
 
const SRC_DIR = process.env.SRC_DIR || process.cwd();
const ASAR_FILE_PATH = path.join(SRC_DIR, 'opt/XTerminal/resources/app.asar');
const OUTPUT_DIR = path.join(SRC_DIR, 'app.asar.unpacked');
 
// Exclude non-Linux prebuilds
const EXCLUDE_PATTERNS = [
  /\/prebuilds\/android-/,
  /\/prebuilds\/darwin-/,
  /\/prebuilds\/darwin/,
  /\/prebuilds\/win32/,
  /\/prebuilds\/win32-/
];
 
async function nativeExtract() {
  try {
    // Clean up previous extraction to avoid ENOTDIR conflicts from cached builds
    if (fs.existsSync(OUTPUT_DIR)) {
      fs.rmSync(OUTPUT_DIR, { recursive: true, force: true });
    }
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });
 
    console.log('=> Loading system-level @electron/asar module...');
    let asar;
    try {
      const asarModule = await import('file:///usr/lib/node_modules/@electron/asar/lib/asar.js');
      asar = asarModule.default || asarModule;
    } catch (e) {
      console.error(`Error: Failed to load asar module. ${e.message}`);
      process.exit(1);
    }
 
    console.log('=> Reading flat file index...');
    const rawFileList = asar.listPackage(ASAR_FILE_PATH);
 
    // Normalize paths and filter out empty ones
    const fileList = rawFileList
      .map(f => f.startsWith('/') ? f.substring(1) : f)
      .filter(f => f && f !== '.');
 
    // Build a set of all directories to prevent file/directory name collisions
    const dirSet = new Set();
    for (const file of fileList) {
      let currentDir = path.dirname(file);
      while (currentDir !== '.' && currentDir !== '') {
        dirSet.add(currentDir);
        currentDir = path.dirname(currentDir);
      }
    }
 
    console.log('=> Extracting files to memory and writing to disk...');
    let extractedCount = 0;
    let skippedCount = 0;
 
    for (const file of fileList) {
      // Skip directories
      if (dirSet.has(file)) {
        continue;
      }
 
      // Skip cross-platform prebuilds
      if (EXCLUDE_PATTERNS.some(regex => regex.test(file))) {
        skippedCount++;
        continue;
      }
 
      try {
        // extractFile throws if the file is a directory or physically missing
        const buffer = asar.extractFile(ASAR_FILE_PATH, file);
 
        const destPath = path.join(OUTPUT_DIR, file);
        const destDir = path.dirname(destPath);
 
        if (!fs.existsSync(destDir)) {
          fs.mkdirSync(destDir, { recursive: true });
        }
 
        fs.writeFileSync(destPath, buffer);
        extractedCount++;
      } catch (err) {
        // Silently ignore directories and ghost files
        skippedCount++;
      }
    }
 
    if (extractedCount === 0) {
      console.error('Error: No files were extracted. Check safe_extract_asar.js!');
      process.exit(1);
    }
 
    console.log('=> Extraction complete.');
    console.log(`   Successfully extracted: ${extractedCount} files`);
    console.log(`   Skipped (dirs/missing/ignored): ${skippedCount} items`);
 
  } catch (err) {
    console.error(`Fatal error during extraction: ${err.message}`);
    process.exit(1);
  }
}
 
nativeExtract();
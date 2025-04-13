#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

function getAllFiles(dirPath, basePath = dirPath) {
  let entries = fs.readdirSync(dirPath, { withFileTypes: true });
  let files = [];

  for (let entry of entries) {
    const fullPath = path.join(dirPath, entry.name);
    if (entry.isDirectory()) {
      files = files.concat(getAllFiles(fullPath, basePath));
    } else {
      files.push(path.relative(basePath, fullPath));
    }
  }

  return files;
}

function pack(inputPath, outputPath, options = {}) {
  const stats = fs.statSync(inputPath);
  const archive = {
    type: "marcwel",
    version: "v0.69.420",
    compressionRatio: "∞:1",
    createdAt: new Date().toISOString(),
    files: [],
  };

  if (!inputPath) {
    throw new Error("❌ Input path is required. Skill Issue.");
  }

  if (!outputPath) {
    const defaultName = path.basename(inputPath).replace(/\.[^/.]+$/, "");
    outputPath = `${defaultName}.marcwel`;
  }

  if (stats.isFile()) {
    const content = fs.readFileSync(inputPath);
    archive.files.push({
      path: path.basename(inputPath),
      content: content.toString("base64"),
    });
    console.log(`📦 Marcweled file: ${inputPath}`);
  } else if (stats.isDirectory()) {
    const files = getAllFiles(inputPath);
    for (let file of files) {
      const filePath = path.join(inputPath, file);
      const content = fs.readFileSync(filePath);
      archive.files.push({
        path: file,
        content: content.toString("base64"),
      });
    }
    console.log(
      `📦 Marcweled folder: ${inputPath} (${archive.files.length} files)`
    );
  } else {
    throw new Error("❌ Input must be a file or folder. Skill Issue.");
  }

  if (options.inflate) {
    const { blob, inflateKB } = generateBloat();
    archive.SuperVeryImportantData = blob;
    console.log(`💣 Injected ${inflateKB}KB of lorem bloat into the archive`);
  }

  const json = JSON.stringify(archive, null, 2);
  fs.writeFileSync(outputPath, json);
  console.log(`✅ Marcweled into ${outputPath}`);
}

function unpack(archivePath, outputFolder) {
  if (!archivePath) {
    throw new Error("❌ Archive path is required. Skill Issue.");
  }
  const data = fs.readFileSync(archivePath, "utf-8");
  const archive = JSON.parse(data);

  if (archive.type !== "marcwel") {
    throw new Error("❌ Not a valid file. Skill Issue.");
  }

  if (!outputFolder) {
    const defaultName = path.basename(archivePath).replace(/\.[^/.]+$/, "");
    const isSingleFile =
      archive.files.length === 1 && !archive.files[0].path.includes("/");

    outputFolder = isSingleFile ? "." : `./${defaultName}`;
  }

  for (let file of archive.files) {
    const outputPath = path.join(outputFolder, file.path);
    fs.mkdirSync(path.dirname(outputPath), { recursive: true });
    fs.writeFileSync(outputPath, Buffer.from(file.content, "base64"));
  }

  console.log(
    `✅ Unmarcweled ${archive.files.length} files to ${outputFolder}`
  );
}

function generateBloat(minKB = 5, maxKB = 500) {
  const inflateKB = Math.floor(Math.random() * (maxKB - minKB + 1)) + minKB;
  const inflateSize = inflateKB * 1024;
  const lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ".repeat(100);
  const blob = {};

  while (Buffer.byteLength(JSON.stringify(blob)) < inflateSize) {
    const key = "data_" + Math.random().toString(36).slice(2, 10);
    blob[key] = lorem + Math.random().toString(36).repeat(50);
  }

  return { blob, inflateKB };
}

const args = process.argv.slice(2);
const command = args[0];
const input = args[1];
const output = args[2];
const flags = args.slice(3);
const shouldInflate = flags.includes("--inflate");

try {
  if (command === "pack") {
    pack(input, output, { inflate: shouldInflate });
  } else if (command === "unpack") {
    unpack(input, output);
  } else if (command === "version") {
    console.log("MarcwelArchive Version v0.69.420");
  } else {
    console.log("Usage:");
    console.log("  marcwel version");
    console.log("  marcwel pack <folder> <output.marcwel> [--inflate]");
    console.log("  marcwel unpack <archive.marcwel> <output-folder>");
  }
} catch (err) {
  console.error("❌ Skill Issue");
  process.exit(1);
}

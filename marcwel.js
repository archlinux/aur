#!/usr/bin/env node

const fs = require("fs");
const path = require("path");


function getAllFiles(dir, base = dir) {
  let out = []
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, e.name)
    if (e.isDirectory()) out = out.concat(getAllFiles(full, base))
    else out.push(path.relative(base, full))
  }
  return out
}

function writeHeader(ws, obj) {
  const header = Buffer.from(JSON.stringify(obj), "utf8")
  const len = Buffer.alloc(8)
  len.writeBigUInt64LE(BigInt(header.length))
  ws.write(len)
  ws.write(header)
}

function drawProgress(ratio, label, size, total) {
  const width = process.stdout.columns ? Math.min(process.stdout.columns - 30, 40) : 40
  const filled = Math.round(width * ratio)
  const bar = "█".repeat(filled) + "░".repeat(width - filled)
  const pct = (ratio * 100).toFixed(1).padStart(5, " ")
  const mbDone = (size / 1e6).toFixed(2)
  const mbTotal = (total / 1e6).toFixed(2)
  process.stdout.write(`\r${bar} ${pct}% (${mbDone}/${mbTotal} MB) ${label.slice(0, 20)}`)
}

async function pack(input, output, inflate = false) {
  const stats = fs.statSync(input)
  const ws = fs.createWriteStream(output)
  const files = stats.isDirectory() ? getAllFiles(input) : [path.basename(input)]
  const header = { type: "marcwel", version: "v2", files: files.length }
  writeHeader(ws, header)

  let totalSize = 0
  let written = 0
  for (const rel of files) {
    const src = stats.isDirectory() ? path.join(input, rel) : input
    totalSize += fs.statSync(src).size
  }

  for (const rel of files) {
    const src = stats.isDirectory() ? path.join(input, rel) : input
    const fsize = fs.statSync(src).size
    const nameBuf = Buffer.from(rel, "utf8")
    const nameLen = Buffer.alloc(4)
    const sizeBuf = Buffer.alloc(8)
    nameLen.writeUInt32LE(nameBuf.length)
    sizeBuf.writeBigUInt64LE(BigInt(fsize))
    ws.write(nameLen)
    ws.write(nameBuf)
    ws.write(sizeBuf)

    await new Promise((resolve) => {
      const rs = fs.createReadStream(src)
      rs.on("data", (chunk) => {
        written += chunk.length
        drawProgress(written / totalSize, rel, written, totalSize)
      })
      rs.on("end", resolve)
      rs.pipe(ws, { end: false })
    })
  }

  if (inflate) {
    const archiveSize = ws.bytesWritten
    const padTarget = archiveSize
    const buf = Buffer.alloc(1024 * 1024, 0)
    let padded = 0
    try {
      while (padded < padTarget) {
        if (!ws.write(buf)) await new Promise(r => ws.once("drain", r))
          padded += buf.length
      }
    } catch {}
    process.stdout.write("\r")
    console.log(`💣 Inflated archive by ~${(padded / 1e6).toFixed(1)} MB`)
  }

  ws.end()
  process.stdout.write("\n")
  console.log(`✅ Binary archive written to ${output}`)
}

async function unpack(archive, outdir) {
  const fd = fs.openSync(archive, "r")
  const lenBuf = Buffer.alloc(8)
  fs.readSync(fd, lenBuf, 0, 8, 0)
  const headerLen = Number(lenBuf.readBigUInt64LE())
  const headerBuf = Buffer.alloc(headerLen)
  fs.readSync(fd, headerBuf, 0, headerLen, 8)
  const header = JSON.parse(headerBuf.toString("utf8"))
  if (header.type !== "marcwel") throw new Error("Invalid archive")

  let offset = 8 + headerLen
  const fileSize = fs.statSync(archive).size
  let extracted = 0
  for (let i = 0; i < (header.files || Infinity); i++) {
    const nameLenBuf = Buffer.alloc(4)
    fs.readSync(fd, nameLenBuf, 0, 4, offset)
    offset += 4
    const nameLen = nameLenBuf.readUInt32LE()
    const nameBuf = Buffer.alloc(nameLen)
    fs.readSync(fd, nameBuf, 0, nameLen, offset)
    offset += nameLen
    const sizeBuf = Buffer.alloc(8)
    fs.readSync(fd, sizeBuf, 0, 8, offset)
    offset += 8
    const fileLen = Number(sizeBuf.readBigUInt64LE())
    const name = nameBuf.toString("utf8")
    const outPath = path.join(outdir, name)
    fs.mkdirSync(path.dirname(outPath), { recursive: true })

    await new Promise((resolve) => {
      const rs = fs.createReadStream(null, { fd, start: offset, end: offset + fileLen - 1 })
      const ws = fs.createWriteStream(outPath)
      rs.on("data", (chunk) => {
        extracted += chunk.length
        drawProgress(extracted / fileSize, name, extracted, fileSize)
      })
      rs.on("end", resolve)
      rs.pipe(ws)
    })
    offset += fileLen
  }
  process.stdout.write("\n")
  console.log(`✅ Unpacked to ${outdir}`)
}

const [,, cmd, input, output, ...rest] = process.argv
const inflate = rest.includes("--inflate")

;(async () => {
  try {
    if (cmd === "pack") await pack(input, output || "archive.marcwel", inflate)
    else if (cmd === "unpack") await unpack(input, output || "./")
    else console.log("Usage: pack <input> <output.marcwel> [--inflate] | unpack <archive> <dir>")
  } catch (e) {
    console.error("❌", e.message)
    process.exit(1)
  }
})()

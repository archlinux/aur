// prettier-ignore
/* eslint-disable */
// @ts-nocheck
/*
 * Linux replacement for the native @atomm-studio/system-rs addon.
 *
 * The upstream addon is a NAPI-RS module published only to makeblock's private
 * registry (http://repository.makeblock.com) and it ships Windows/macOS
 * prebuilds only. It exposes nothing but read-only host information, so it is
 * reimplemented here in pure JS against the same public API described by
 * index.d.ts:
 *
 *   getMemoryInfo(): MemoryInfo
 *   getOsInfo(): OsInfo
 *   getAppProcesses(rootPid): ProcessNode[]
 *
 * Semantics follow the upstream doc comments: `memory` is the real memory of a
 * process (RSS on Linux), `rss` the resident set size, `cpu` a percentage where
 * 100 means one saturated core, and the first sample of a process is 0 because
 * no baseline exists yet.
 */

const fs = require('node:fs')
const os = require('node:os')

const PAGE_SIZE = 4096

function readText(path) {
  try {
    return fs.readFileSync(path, 'utf8')
  } catch {
    return null
  }
}

function parseOsRelease() {
  const text = readText('/etc/os-release')
  const out = {}
  if (!text) return out
  for (const line of text.split('\n')) {
    const m = /^([A-Z0-9_]+)=(.*)$/.exec(line.trim())
    if (!m) continue
    let value = m[2]
    const quoted =
      value.length >= 2 && (value[0] === '"' || value[0] === "'") && value[value.length - 1] === value[0]
    if (quoted) value = value.slice(1, -1)
    out[m[1]] = value
  }
  return out
}

function getOsInfo() {
  const release = parseOsRelease()
  const osVersion = release.VERSION_ID || release.VERSION || os.release()
  return {
    name: release.NAME || os.type(),
    osVersion,
    longOsVersion: release.PRETTY_NAME || release.VERSION || osVersion,
    kernelVersion: os.release(),
    hostname: os.hostname(),
  }
}

function getMemoryInfo() {
  const text = readText('/proc/meminfo')
  const fields = {}
  if (text) {
    for (const line of text.split('\n')) {
      const m = /^(\w+):\s+(\d+)\s*kB$/.exec(line)
      if (m) fields[m[1]] = Number(m[2]) * 1024
    }
  }
  const total = fields.MemTotal ?? os.totalmem()
  const free = fields.MemFree ?? os.freemem()
  const available = fields.MemAvailable ?? free
  return {
    total,
    available,
    used: Math.max(0, total - available),
    free,
  }
}

/** Per-pid CPU-time baseline, used to turn jiffies into a percentage. */
let cpuBaseline = new Map()
let totalJiffiesAt = 0

function readTotalJiffies() {
  const text = readText('/proc/stat')
  if (!text) return 0
  const m = /^cpu\s+(.*)$/m.exec(text)
  if (!m) return 0
  return m[1]
    .trim()
    .split(/\s+/)
    .reduce((sum, value) => sum + Number(value), 0)
}

/**
 * /proc/<pid>/stat keeps comm inside parentheses and comm may itself contain
 * spaces and parentheses, so fields are read after the last `)`, where the
 * first entry is field 3 (state).
 */
function parseStat(pid) {
  const text = readText(`/proc/${pid}/stat`)
  if (!text) return null
  const open = text.indexOf('(')
  const close = text.lastIndexOf(')')
  if (open < 0 || close < 0) return null
  const rest = text.slice(close + 2).trim().split(/\s+/)
  return {
    name: text.slice(open + 1, close),
    ppid: Number(rest[1]),
    utime: Number(rest[11]),
    stime: Number(rest[12]),
    rssPages: Number(rest[21]),
  }
}

function readCmdline(pid) {
  const raw = readText(`/proc/${pid}/cmdline`)
  if (!raw) return []
  const parts = raw.split('\0')
  if (parts.length && parts[parts.length - 1] === '') parts.pop()
  return parts
}

function getAppProcesses(rootPid) {
  const cores = os.cpus().length || 1
  const totalJiffies = readTotalJiffies()
  const elapsedJiffies = totalJiffies - totalJiffiesAt
  const previous = cpuBaseline

  const stats = new Map()
  const children = new Map()
  let pids
  try {
    pids = fs
      .readdirSync('/proc', { withFileTypes: true })
      .filter((entry) => entry.isDirectory() && /^\d+$/.test(entry.name))
      .map((entry) => Number(entry.name))
  } catch {
    pids = []
  }

  for (const pid of pids) {
    const stat = parseStat(pid)
    if (!stat) continue
    stats.set(pid, stat)
    if (!children.has(stat.ppid)) children.set(stat.ppid, [])
    children.get(stat.ppid).push(pid)
  }

  const result = []
  const nextBaseline = new Map()
  const queue = [rootPid]
  const seen = new Set()
  while (queue.length > 0) {
    const pid = queue.shift()
    if (pid === undefined || seen.has(pid)) continue
    seen.add(pid)
    for (const child of children.get(pid) ?? []) queue.push(child)
    const stat = stats.get(pid)
    if (!stat) continue

    const rss = stat.rssPages * PAGE_SIZE
    const ticks = stat.utime + stat.stime
    const before = previous.get(pid)
    let cpu = 0
    if (before !== undefined && elapsedJiffies > 0 && ticks >= before && cpuBaselineAt > 0) {
      // 100 == one saturated core (total jiffies already sum every core).
      cpu = ((ticks - before) / elapsedJiffies) * cores * 100
    }
    nextBaseline.set(pid, ticks)

    result.push({
      pid,
      ppid: stat.ppid,
      name: stat.name,
      memory: rss,
      rss,
      cpu,
      cmd: readCmdline(pid),
    })
  }

  cpuBaseline = nextBaseline
  totalJiffiesAt = totalJiffies
  cpuBaselineAt = Date.now()
  return result
}

/** Timestamp of the last successful sampling, guarding the first (baseline) call. */
let cpuBaselineAt = 0

module.exports = {
  getAppProcesses,
  getMemoryInfo,
  getOsInfo,
}
module.exports.getAppProcesses = getAppProcesses
module.exports.getMemoryInfo = getMemoryInfo
module.exports.getOsInfo = getOsInfo

#!/usr/bin/env node

const fs = require('fs')
const path = require('path')
const progress = require('progress-stream')
const fetch = require('simple-get')
const readline = require('readline')

// MEGA downloader
const mega = require('megajs')
const unzip = require('unzipper').Extract
const mkdirp = require('mkdirp')
const rimraf = require('rimraf')
const zeroFill = require('zero-fill')

fetch.concat('https://www.legendsofequestria.com/downloads', (err, res, data) => {
  if (err) throw err
  let html = data.toString('utf8')
  const megaReg = /<a href="(https:\/\/mega\.nz\/file\/[a-zA-Z0-9_-]*#[a-zA-Z0-9_-]*)">(.*?)<\/a>/ig
  const versions = {}
  for (let ma; (ma = megaReg.exec(html));) {
    let key = ma[2].trim().toLowerCase()
    if (key === 'windows x32') key = 'win32'
    else if (key === 'windows x64') key = 'win64'
    versions[key] = ma[1]
  }
  const version = 'linux'
  const megaUrl = versions[version]
  if (!megaUrl) throw new Error('MEGA: No version found!')
  const file = mega.File.fromURL(megaUrl)
  file.loadAttributes((err) => {
    if (err) throw err
    const dlDir = 'dl'
    const zipfile = path.join(dlDir, 'download.zip')

    function extractAndRemove () {
      let dir = 'dl/loe'
      console.log('Removing ' + dir)
      rimraf(dir, (err) => {
        if (err) throw err
        console.log('Extracting...', zipfile)
        let stream = fs.createReadStream(zipfile).pipe(unzip({
          path: dir,
          verbose: false
        }))
        stream.on('error', (err) => {
          console.log('unzip error:', err)
        })
        stream.on('close', () => {
          if (version === 'macos') {
            fs.chmodSync(path.join(dir, 'loe.app/Contents/MacOS/loe'), 0o755)
          } else if (version === 'linux') {
            fs.chmodSync(path.join(dir, 'loe.x86'), 0o755)
            fs.chmodSync(path.join(dir, 'loe.x86_64'), 0o755)
          }
          console.log('Removing', zipfile)
          fs.unlink(zipfile, (err) => {
            console.log('Finished!')
          })
        })
      })
    }

    mkdirp(dlDir).then(() => {
      let start = 0
      try {
        start = fs.statSync(zipfile).size
      } catch (err) {}

      fs.readFile(path.join(dlDir, 'version.txt'), 'utf8', (err, data) => {
        if (data !== megaUrl) {
          // restart download, new version
          start = 0
        }
        fs.writeFile(path.join(dlDir, 'version.txt'), Buffer.from(megaUrl, 'utf8'), (err) => {
          if (err) throw err

          console.log(file.name, Math.round(file.size / 1024 / 1024) + ' MB')

          if (start >= file.size) return extractAndRemove()
          const ss = progress({
            time: 1000,
            length: file.size,
            transferred: start
          })
          ss.on('progress', (info) => {
            readline.clearLine(process.stdout, 0)
            readline.cursorTo(process.stdout, 0)
            process.stdout.write('Downloading [ ' + zeroFill(3, Math.round(info.percentage), ' ') + '% | ' + Math.floor(info.eta / 60 / 60) + ':' + zeroFill(2, Math.floor(info.eta / 60) % 60) + ':' + zeroFill(2, Math.floor(info.eta % 60)) + ' remaining | ' + zeroFill(5, (Math.round(info.speed / 1024 / 1024 * 100) / 100).toFixed(2), ' ') + ' MB/s ]')
          })
          let stream = file.download({start})
          stream.pipe(ss).pipe(fs.createWriteStream(zipfile, {flags: start > 0 ? 'r+' : 'w', start}))
          stream.once('end', () => {
            readline.clearLine(process.stdout, 0)
            readline.cursorTo(process.stdout, 0)
            if (ss.progress().remaining !== 0) console.warn('Warning: Remaining bytes is not zero: ' + ss.progress().remaining)
            extractAndRemove()
          })
        })
      })
    }).catch((err) => {
      throw err
    })
  })
})

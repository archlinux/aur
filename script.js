const { request } = require('@octokit/request')
const { stream: gotStream } = require('got')
const { createWriteStream } = require('fs')
const { pipeline } = require('stream/promises')
const { ParseOne: unzipOne } = require('unzipper')
const { writeFile } = require('fs/promises')
const { env } = process

const requestWithAuth = request.defaults({
  headers: {
    authorization: `token ${env.github_token}`
  },
  owner: 'FreeTubeApp',
  repo: 'FreeTube'
})

const f = async () => {
  let artifact_id = ''
  let name = 'freetube_0.18.0-nightly-3196_amd64.pacman.zip'
  let headSha = ''
  let build = ''
  let tag = ''
  let releaseTag = ''
  let workflowId = ''
  const res = await requestWithAuth('GET /repos/{owner}/{repo}/actions/artifacts')

  for (const artifact of res.data.artifacts) {
    if (artifact.name.endsWith('.pacman')) {
      artifact_id = artifact.id
      name = artifact.name
      headSha = artifact.workflow_run.head_sha
      workflowId = artifact.workflow_run.id
      build = name.split('-')[2].split('_')[0]
      tag = name.split('_')[1].split('-')[0]
      releaseTag = `${tag}.build${build}.${headSha.substring(0, 7)}`
      await writeFile('setenv.txt', `release_tag=${releaseTag}\nworkflow_id=${workflowId}\n`)
      break
    }
  }

  const dl = await requestWithAuth('GET /repos/{owner}/{repo}/actions/artifacts/{artifact_id}/zip', { artifact_id })

  await pipeline(
    gotStream(dl.url),
    unzipOne(),
    createWriteStream('freetube.pacman.tar.xz')
  )
}

f()

#!/usr/bin/env python3
import requests

# Get all pipelines from the server
def get_pipelines():
    url = 'https://gitlab.com/api/v4/projects/42073614/pipelines'
    response = requests.get(url)
    return response.json()

pipes = get_pipelines()

# Only keep the element that attached to the main branch. 
pipes_of_main = [pipe for pipe in pipes if pipe['ref'] == 'main' and pipe['status'] == 'success']

assert len(pipes_of_main) != 0, 'No pipeline attached to the main branch or the pipeline is not successful'

# Get the latest pipeline
latest = pipes_of_main[0]

# Get the short hash of the latest pipeline
latest_sha = latest['sha'][0:8]

# get the sequqence number of this commit.
def get_sequence_number(sha):
    url = f'https://gitlab.com/api/v4/projects/42073614/repository/commits/{sha}/sequence'
    response = requests.get(url)
    return response.json()["count"]

last_sequence_number = get_sequence_number(latest_sha)

# Get the pipeline ID.
latest_id = latest['id']

# Now, we use this pipline ID to query the job. 

def get_jobs(pipeline_id):
    url = f'https://gitlab.com/api/v4/projects/42073614/pipelines/{pipeline_id}/jobs'
    response = requests.get(url)
    return response.json()

jobs = get_jobs(latest_id)

# Only keep the job with the name "linux_build" and its status is "success". Also, we only keep the deploy stage.
jobs_of_deploy = [job for job in jobs if job['name'] == 'linux_build' and job['status'] == 'success' and job['stage'] == 'deploy']
assert len(jobs_of_deploy) == 1, 'No job with the name "linux_build" and its status is "success" and its stage is "deploy"'

deploy_job_id = jobs_of_deploy[0]['id']

PKG_FUNC = """
prepare() {
    mkdir -p ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver.zip -d ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver/surfer_linux.zip -d ${srcdir}/$pkgname-$pkgver
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/surfer" "$pkgdir/usr/bin/surfer"
}
"""

# Nice.
artifact = (f"https://gitlab.com/surfer-project/surfer/-/jobs/{deploy_job_id}/artifacts/download?file_type=archive")
short_sha = latest_sha
seq_number = last_sequence_number

print(artifact)
print(short_sha)
print(seq_number)

# Now, we can use these information to update the PKGBUILD file.
with open('PKGBUILD.template', 'r') as file:
    content = file.read()
    rendered = content.format(seq_number, short_sha, artifact)
    rendered = rendered + PKG_FUNC
    print(rendered)

with open('PKGBUILD', 'w') as file:
    file.write(rendered)

# Now, we upgrade the checksum and .SRCINFO.
import os

# remove previously built package
os.system('rm -rf *.zst *.zip')

os.system('updpkgsums')
os.system('makepkg --printsrcinfo > .SRCINFO')
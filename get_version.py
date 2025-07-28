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


print("0.4.0.r{}.{}".format(last_sequence_number, latest_sha))

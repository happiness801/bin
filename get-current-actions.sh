#!/usr/bin/env bash

# Lists workflow runs that are not completed
# Pass in list of repos to check or will use all repos in "chg repos:list"

# Interesting datapoints:
# .workflow_runs[].node_id = node of runner
# .workflow_runs[].status = status of run (queued | in_progress | completed)
# .workflow_runs[].head_commit.author.name = name of person who committed/triggered
# .workflow_runs[].created_at = time run started
# .workflow_runs[].repository.name = name of repo

if [[ ! -z "$1" ]]; then
    repos="$@"
else
    repos=$(chg repos:list | sed 's/-\ //')
fi

for repo in $repos; do [[ $repo ]] && curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/chghealth
care/$repo/actions/runs | jq -r '.workflow_runs[] | .repository.name, .node_id, .created_at, .head_commit.author.name, .stat
us' | egrep -B 4 "(queued|in_progress)"; done

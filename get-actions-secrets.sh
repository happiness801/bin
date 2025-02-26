#!/usr/bin/env bash

chg repos:list | sed 's/-\ //' | while read -r repo; do [[ $repo ]] && echo "REPO: $repo" && curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/chghealthcare/$repo/actions/secrets ; done

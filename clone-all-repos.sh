#!/usr/bin/env bash

chg repos:list | sed 's/-\ //' | while read -r repo; 
do 
	[[ -e $repo ]] && echo "NOTE: Repo [$repo] is already cloned" && continue;
	[[ $repo ]] && git clone git@github.com:chghealthcare/$repo; 
done;

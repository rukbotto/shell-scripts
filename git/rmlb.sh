#!/bin/bash

COLOR_NC="\033[0m"
COLOR_GREEN="\033[0;32m"

echo -e "${COLOR_GREEN}>> Removing local branches which have their remote counterpart deleted${COLOR_NC}"

git fetch --all --prune && git branch -vv \
	| grep ': gone]' \
	| grep -v "\*" \
	| awk '{ print $1; }' \
	| xargs git branch -D

echo -e "${COLOR_GREEN}>> Local branches removed${COLOR_NC}"

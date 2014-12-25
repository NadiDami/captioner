#!/bin/bash

set -e

function main {
    for rev in `revisions`; do
      echo "`number_of_lines` `commit_message`"
    done
}

function revisions {
    git rev-list --reverse HEAD
}

function commit_message {
   git --no-pager log --oneline -1 $rev
}

function number_of_lines {
      git ls-tree -r $rev |
      awk '{print $3}' |
      xargs git show |
      wc -l
}

main

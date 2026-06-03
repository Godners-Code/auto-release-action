#!/bin/bash
echo "[STEP] [$(date '+%F %T') (UTC)] Worker (Info) via Bash Script"
TODAY=$(date '+%Y.%m.%d')
TAG="${TODAY}.auto"
echo "release_tag=${TAG}" >> $GITHUB_OUTPUT
TIME="$(date '+%F %T') (UTC)"
echo "time=${TIME}" >> $GITHUB_OUTPUT

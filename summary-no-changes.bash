#!/bin/bash
TIME="$(date '+%F %T') (UTC)"
echo "[STEP] [${TIME}] Print Summary (NO Changes) via Bash Script"
TITLE="Auto Release"
MESSAGE="Release canceled because No Changes"
SUMMARY="[${TITLE} ${TIME}: ${MESSAGE}]"
echo "${SUMMARY}" >> $GITHUB_STEP_SUMMARY
echo "${SUMMARY}"
echo "summary=${SUMMARY}" >> $GITHUB_OUTPUT

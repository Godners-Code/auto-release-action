#!/bin/bash
TIME="$(date '+%F %T') (UTC)"
echo "[STEP] [${TIME}] Print Summary (Has Changes) via Bash Script"
TITLE="Auto Release"
MESSAGE="Tag is <${{ steps.worker-info.outputs.tag }}>, Time is <${{ steps.worker-info.outputs.time }}>."
SUMMARY="[${TITLE}] ${TIME}: ${MESSAGE}"
echo "${SUMMARY}" >> $GITHUB_STEP_SUMMARY
echo "${SUMMARY}"
echo "summary=${SUMMARY}" >> $GITHUB_OUTPUT

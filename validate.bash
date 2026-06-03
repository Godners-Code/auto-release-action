#!/bin/bash
echo "[STEP] Validate Token Inputed via Command $(date '+%F %T') (UTC)"
if [ -z "${GITHUB_TOKEN}" ]
then
    TIME="$(date '+%F %T') (UTC)"
    TITLE="Auto Release"
    MESSAGE="GITHUB_TOKEN is missing or empty. Workflow terminated."
    SUMMARY="[${TITLE} ${TIME}: ${MESSAGE}]"
    echo "${SUMMARY}" >> $GITHUB_STEP_SUMMARY
    echo "${SUMMARY}"
    echo "summary=${SUMMARY}" >> $GITHUB_OUTPUT
    exit 1
fi

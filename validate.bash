#!/bin/bash
 echo "[STEP] Validate Token Inputed via Bash $(date '+%F %T') (UTC)"
if [ -z "${{ inputs.GITHUB_TOKEN }}" ]
    then
      TIME="$(date '+%F %T') (UTC)"
      TITLE="Periodic Release"
      MESSAGE="GITHUB_TOKEN is missing or empty. Workflow terminated."
      SUMMARY="[${TITLE} ${TIME}: ${MESSAGE}]"
      echo "${SUMMARY}" >> $GITHUB_STEP_SUMMARY
      echo "${SUMMARY}"
      echo "summary=${SUMMARY}" >> $GITHUB_OUTPUT
      exit 1
fi

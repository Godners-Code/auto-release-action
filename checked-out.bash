#!/bin/bash
echo "[STEP] [$(date '+%F %T') (UTC)]Check if Checkout via Bash Script"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1
then
    echo "checked_out=true" >> $GITHUB_OUTPUT
    echo "Checkout Detected."
else
    echo "checked_out=false" >> $GITHUB_OUTPUT
    echo "No Checkout Detected."
    echo "[STEP] [$(date '+%F %T') (UTC)] Checkout Repository via GitHub Action"
fi

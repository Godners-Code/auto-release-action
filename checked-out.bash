#!/bin/bash
echo "[STEP] Check if Checkout via Command"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1
then
    echo "checked_out=true" >> $GITHUB_OUTPUT
    echo "Checkout Detected."
else
    echo "checked_out=false" >> $GITHUB_OUTPUT
    echo "No Checkout Detected."
    echo "[STEP] Run Checkout Repository via Action"
fi

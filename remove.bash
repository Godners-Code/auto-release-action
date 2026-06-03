#!/bin/bash
echo "[STEP] [$(date '+%F %T') (UTC)] Remove Existent Release via Bash Script"
gh release delete ${{ steps.worker-info.outputs.tag }} --yes --cleanup-tag 2>/dev/null || echo ""

#!/bin/bash

CURRENT_DIR="$(dirname -- "$(realpath -- "$0")")"
PARENT_DIR="$(dirname "$CURRENT_DIR")"
WORKING_DIR="$PARENT_DIR/output"
ORG=cws-test-org
REPOSITORY=$1

MISSING_WORKFLOWS=("test1" "test2" "test3")

ISSUE_TITLE="[Workflows] Missing Workflow(s)"
ISSUE_BODY="The following workflows are missing from the repository:"

for w in "${MISSING_WORKFLOWS[@]}"; do
    ISSUE_BODY+=$'\n- '"$w"
done

gh issue create \
    --repo "$ORG/$REPOSITORY" \
    --title "$ISSUE_TITLE" \
    --body "$ISSUE_BODY"

echo "--------------------------------------------------";

#!/bin/bash

TOTAL_DAYS=365

MESSAGES=("fix bug" "update code" "refactor" "add feature" "improve UI" "optimize" "clean code")

for i in $(seq 1 $TOTAL_DAYS)
do
  # random số commit (0–5)
  COMMITS=$((RANDOM % 6))

  for j in $(seq 1 $COMMITS)
  do
    # random giờ (6h–23h)
    HOUR=$(printf "%02d" $((RANDOM % 18 + 6)))
    MIN=$(printf "%02d" $((RANDOM % 60)))
    SEC=$(printf "%02d" $((RANDOM % 60)))

    DATE=$(date -d "$i days ago" +"%Y-%m-%dT$HOUR:$MIN:$SEC")

    echo "commit $i-$j" >> log.txt

    MSG=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

    GIT_AUTHOR_DATE="$DATE" \
    GIT_COMMITTER_DATE="$DATE" \
    git add .

    GIT_AUTHOR_DATE="$DATE" \
    GIT_COMMITTER_DATE="$DATE" \
    git commit -m "$MSG"
  done
done

git push origin main

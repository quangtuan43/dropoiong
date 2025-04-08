#!/bin/bash

# Start date: February 4, 2025
START_DATE="2025-1-04"
# End date: February 28, 2025
END_DATE="2025-4-8"

# Convert start date to seconds since epoch
CURRENT_DATE=$(date -d "$START_DATE" +%s)
END_DATE_EPOCH=$(date -d "$END_DATE" +%s)

while [ "$CURRENT_DATE" -le "$END_DATE_EPOCH" ]; do
    # Format the current date
    DATE_STR=$(date -d "@$CURRENT_DATE" "+%Y-%m-%d 12:00:00")

    # Create a commit with a fake timestamp
    GIT_COMMITTER_DATE="$DATE_STR" git commit --allow-empty --date="$DATE_STR" -m "Commit on $DATE_STR"

    # Move to the next day
    CURRENT_DATE=$((CURRENT_DATE + 86400))  # Add 1 day (86400 seconds)
done


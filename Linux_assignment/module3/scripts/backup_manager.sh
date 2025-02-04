#!/bin/bash

# Check if exactly three arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_directory> <backup_directory> <file_extension>"
    exit 1
fi

# Assign arguments to variables
SRC_DIR="$1"
BACKUP_DIR="$2"
FILE_EXT="$3"

# Ensure source directory exists
if [ ! -d "$SRC_DIR" ]; then
    echo "Error: Source directory does not exist."
    exit 1
fi

# Ensure backup directory exists or create it
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR" || { echo "Error: Failed to create backup directory."; exit 1; }
fi

# Find files matching the extension
FILES=("$SRC_DIR"/*"$FILE_EXT")

# Check if any files match the criteria
if [ ! -e "${FILES[0]}" ]; then
    echo "No files with extension '$FILE_EXT' found in source directory."
    exit 1
fi

# Initialize backup count and total size
BACKUP_COUNT=0
TOTAL_SIZE=0

# Process files
for FILE in "${FILES[@]}"; do
    if [ -f "$FILE" ]; then
        FILE_NAME=$(basename "$FILE")
        DEST_FILE="$BACKUP_DIR/$FILE_NAME"

        FILE_SIZE=$(stat -c%s "$FILE")
        echo "Backing up: $FILE_NAME (Size: $FILE_SIZE bytes)"

        # Check if destination file exists and compare timestamps
        if [ -f "$DEST_FILE" ]; then
            if [ "$FILE" -nt "$DEST_FILE" ]; then
                cp "$FILE" "$DEST_FILE"
                echo "Updated: $FILE_NAME"
            else
                echo "Skipped: $FILE_NAME (Backup is newer or same)"
                continue
            fi
        else
            cp "$FILE" "$DEST_FILE"
            echo "Copied: $FILE_NAME"
        fi

        TOTAL_SIZE=$((TOTAL_SIZE + FILE_SIZE))
        ((BACKUP_COUNT++))
    fi
done

# Export the backup count variable
export BACKUP_COUNT

# Generate summary report
REPORT_FILE="$BACKUP_DIR/backup_report.log"
{
    echo "Backup Summary Report"
    echo "---------------------"
    echo "Total files processed: ${#FILES[@]}"
    echo "Total files backed up: $BACKUP_COUNT"
    echo "Total size backed up: $TOTAL_SIZE bytes"
    echo "Backup directory: $BACKUP_DIR"
} > "$REPORT_FILE"

echo "Backup completed. Summary saved in $REPORT_FILE."




y


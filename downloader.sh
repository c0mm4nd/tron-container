#!/bin/bash
# This script downloads latest FullNode.jar for Tron deployment

LOG_FILE="downloader.log"

# Logging function
log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp=$(date '+%H:%M:%S')
    echo "$(date '+%Y-%m-%d %H:%M:%S'),$(date '+%3N') dl $level $message" >> "$LOG_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message"
}

# Download file with progress bar
download_with_progress() {
    local url="$1"
    local output_file="$2"
    local description="$3"
    
    log "WARN" "start downloading $description from $url"
    
    # Use curl with progress bar
    if curl -# -L -o "$output_file" "$url"; then
        log "WARN" "downloaded $description successfully"
        return 0
    else
        log "ERROR" "failed to download $description"
        return 1
    fi
}

# Download FullNode.jar
download_jar() {
    local jar_url="https://github.com/tronprotocol/java-tron/releases/latest/download/FullNode.jar"
    download_with_progress "$jar_url" "FullNode.jar" "FullNode.jar"
}

# Main execution
main() {
    log "INFO" "downloader starting"
    
    # Check if FullNode.jar exists
    if [ ! -f "FullNode.jar" ]; then
        log "WARN" "FullNode.jar not exists"
        if ! download_jar; then
            log "ERROR" "Failed to download FullNode.jar"
            exit 1
        fi
    fi
    
    log "WARN" "everything done, exit downloader"
}

# Run main function
main "$@"

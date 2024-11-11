#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if the binary exists
if [ ! -f ".build/debug/MacFanControl" ]; then
    echo -e "${RED}Binary not found. Building first...${NC}"
    ./scripts/build.sh
fi

# Run with sudo
echo -e "${YELLOW}Running Mac Fan Control...${NC}"
echo -e "${RED}Note: This requires sudo privileges to access the SMC${NC}"
if sudo .build/debug/MacFanControl; then
    echo -e "${GREEN}Application exited successfully${NC}"
else
    echo -e "${RED}Application crashed or was terminated${NC}"
    exit 1
fi

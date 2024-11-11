#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Building Mac Fan Control...${NC}"

# Clean previous build if exists
if [ -d ".build" ]; then
    echo -e "${YELLOW}Cleaning previous build...${NC}"
    swift package clean
fi

# Build the project
if swift build; then
    echo -e "${GREEN}Build successful!${NC}"
    echo -e "You can run the application with: ${YELLOW}sudo .build/debug/MacFanControl${NC}"
else
    echo -e "${RED}Build failed!${NC}"
    exit 1
fi

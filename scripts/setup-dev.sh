#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Setting up development environment...${NC}"

# Check for Xcode Command Line Tools
if ! xcode-select -p &> /dev/null; then
    echo -e "${RED}Xcode Command Line Tools not found${NC}"
    echo -e "${YELLOW}Installing Xcode Command Line Tools...${NC}"
    xcode-select --install
    echo "Please run this script again after installation completes"
    exit 1
fi

# Check for Swift
if ! which swift &> /dev/null; then
    echo -e "${RED}Swift not found${NC}"
    echo "Please install Xcode from the App Store"
    exit 1
fi

echo -e "${GREEN}Swift version:${NC}"
swift --version

# Initialize git hooks if needed
if [ -d ".git" ]; then
    echo -e "${YELLOW}Setting up git hooks...${NC}"
    # Add any git hooks setup here
fi

# Generate Xcode project
echo -e "${YELLOW}Opening in Xcode...${NC}"
xed .

echo -e "${GREEN}Development environment setup complete!${NC}"
echo -e "You can now:"
echo -e "1. Run ${YELLOW}./scripts/build.sh${NC} to build the project"
echo -e "2. Run ${YELLOW}./scripts/run.sh${NC} to run the application"
echo -e "3. Use Xcode to develop (already opened)"

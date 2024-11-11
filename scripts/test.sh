#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Running tests...${NC}"

# Run Swift tests
if swift test; then
    echo -e "${GREEN}All tests passed!${NC}"
else
    echo -e "${RED}Tests failed${NC}"
    exit 1
fi

# Run additional test coverage report if needed
# swift test --enable-code-coverage

echo -e "${GREEN}Test suite completed successfully${NC}"

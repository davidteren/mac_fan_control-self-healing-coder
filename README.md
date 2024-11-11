# Mac Fan Control App - Self Healing AI Coder Test Pad

## Discovery & Patterns for Self-Healing  
The core purpose of this repo is to serve as a dynamic knowledge base for experimentation and discovery of patterns in agentic self-healing.
The process is designed to learn from past interactions and continuously improve itself. As a result, this repo is a work in progress and may experience unexpected behavior.

**Current State:** BROKEN! 

The test app is not functioning as expected. The fan speeds are not being controlled correctly and the CPU temperature is not being monitored.
At one stage it was building and the app ran though the fan speeds were not being affected by changes. 

![CleanShot 2024-11-09 at 04.15.41@2x.png](screenshots/CleanShot%202024-11-09%20at%2004.15.41%402x.png)


# <font color="red"> ⚠ DANGER: READ DOCS ⚠</font>
## <font color="orange"> ⚠ YOU HAVE BEEN WARNED ⚠</font>

Please be sure to understand what this does and how to use it.

See [Project-Guide](./Project-Guide.md)


### Usage Instructions for Open Interpreter

Use the `-y` flag to automatically accept the prompt and the -custom instruction flag to point at the entry point `-ci "look for a file .project_guide/implementation_plan.md and follow the instructions in it."`  

You first prompt should set the repo path and ensure it's correct. You do not want Interpreter running in the wrong directory.  

Please share findings, tips, and suggestions with the OI Discord community or create and issue. 

---

### The example app
A simple macOS application to control your Mac's fan speeds. This application requires root privileges to access the SMC (System Management Controller).

## Features
- Read current fan speeds
- Control fan speeds manually
- Monitor CPU temperature
- Automatic and manual control modes

## Security Note
This application requires special privileges to access the SMC. Use with caution as incorrect fan settings could potentially damage your computer.

## Build Instructions
```bash
swift build
```

## Running
```bash
sudo .build/debug/MacFanControl
```




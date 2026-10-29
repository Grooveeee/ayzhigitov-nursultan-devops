#!/bin/bash

LOG_FILE="logs/Aizhigitov_Nursultan_system_report.log"

{
    echo "=========================================="
    echo "Student Full Name: Aizhigitov Nursultan"
    echo "Current Date and Time: $(date)"
    echo "Current Username: $(whoami)"
    echo "------------------------------------------"
    echo "OS and Kernel Version:"
    uname -a
    grep -E "^(PRETTY_NAME|VERSION)=" /etc/os-release 2>/dev/null
    echo "------------------------------------------"
    echo "CPU Information:"
    lscpu | grep -E "Model name|Architecture|CPU\(s\):"
    echo "------------------------------------------"
    echo "Memory Information:"
    free -h
    echo "------------------------------------------"
    echo "Project Disk Usage:"
    du -sh .
    echo "------------------------------------------"
    echo "Available Disk Space:"
    df -h
    echo "=========================================="
} | tee "$LOG_FILE"

#!/usr/bin/env python3
import sys
import time

# Dictionary to track session start time by IP
sessions = {}
session_timeout = 3 * 3600  # 3 hours

while True:
    line = sys.stdin.readline().strip()
    
    if not line:
        continue

    client_ip = line.split()[0]
    current_time = time.time()

    # Clean up expired sessions to save memory
    expired_ips = [ip for ip, start_time in sessions.items() if current_time - start_time > session_timeout]
    for ip in expired_ips:
        del sessions[ip]  # Remove expired session

    # Check if the client IP already has a session
    if client_ip in sessions:
        session_start = sessions[client_ip]
        if current_time - session_start > session_timeout:
            print("ERR")  # Session expired
        else:
            print("OK")  # Session still valid
    else:
        # Start a new session for the client
        sessions[client_ip] = current_time
        print("OK")  # Session started

    sys.stdout.flush()  # Make sure output is sent immediately

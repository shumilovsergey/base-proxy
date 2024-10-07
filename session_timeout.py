#!/usr/bin/env python3
import sys
import time

# Dictionary to track session start time by IP
sessions = {}

while True:
    # Read input from Squid
    line = sys.stdin.readline().strip()
    
    if not line:
        continue
    
    # Get the client's IP address
    client_ip = line.split()[0]
    
    # Get the current time
    current_time = time.time()
    
    # Check if the client IP is already in the session dictionary
    if client_ip in sessions:
        session_start = sessions[client_ip]
        
        # If the session has lasted more than 3 hours (10800 seconds), deny access
        if current_time - session_start > 3 * 3600:  # 3 hours
            print("ERR")  # Session expired
        else:
            print("OK")  # Session still valid
    else:
        # Start a new session for the client
        sessions[client_ip] = current_time
        print("OK")  # Session started
    
    sys.stdout.flush()  # Make sure output is sent immediately

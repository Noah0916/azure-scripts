# Azure VM Nginx Deployment & NSG Troubleshooting

## Goal
Deploy an Ubuntu VM in Azure, install Nginx, and make it reachable via the public IP.

## What I did
- Created Ubuntu 24.04 VM in Azure
- Installed Nginx using a script
- Verified Nginx was running on port 80

## Problem
Nginx was running, but the website was not reachable via the public IP.

## Investigation
I checked inside the VM and saw that Nginx was listening on port 80.
Testing with curl showed:
- curl http://localhost worked
- curl http://public-ip did not work

This indicated the problem was not Linux, but Azure networking.

## Root Cause
I had added the HTTP rule (port 80) to the wrong Network Security Group (NSG).
The VM network interface was attached to a different NSG.

## Fix
I added this rule to the correct NSG attached to the NIC:

- Allow TCP
- Port 80
- Source: Any
- Priority: 100

## Result
The Nginx website became reachable via the public IP.

## Key Learning
Always check which NSG is attached to the NIC.  
Rules in an unused NSG have no effect.

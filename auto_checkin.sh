#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <email> <password>"
    exit 1
fi

EMAIL=$1
PASSWORD=$2
BASE_URL="https://socloud.me"

# Login request
echo "Logging in..."
LOGIN_RESPONSE=$(curl -s -i "${BASE_URL}/auth/login" \
    -H 'accept: application/json, text/javascript, */*; q=0.01' \
    -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'x-requested-with: XMLHttpRequest' \
    --data-urlencode "email=${EMAIL}" \
    --data-urlencode "passwd=${PASSWORD}" \
    --data-urlencode "code=")

# Extract cookies from login response and format them
COOKIES=$(echo "$LOGIN_RESPONSE" | grep -i '^set-cookie:' | sed 's/^[Ss]et-[Cc]ookie: \(.*\);.*/\1/' | tr '\n' ';' | sed 's/;$//')

if [ -z "$COOKIES" ]; then
    echo "Login failed: Could not get cookies"
    exit 1
fi
echo "Cookies: $COOKIES"
# Checkin request
echo "Performing checkin..."
CHECKIN_RESPONSE=$(curl -s "${BASE_URL}/user/checkin" \
    -X 'POST' \
    -H 'accept: application/json, text/javascript, */*; q=0.01' \
    -H 'x-requested-with: XMLHttpRequest' \
    -b "$COOKIES")

echo "Checkin response: $CHECKIN_RESPONSE"

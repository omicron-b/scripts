#!/usr/bin/env python3

import re

hosts = list()
whitelist = (
    "s.youtube.com\n",
    "s.click.aliexpress.com\n",
    "click.linksynergy.com\n",
    "www.googleadservices.com\n",
    "googleadservices.com\n",
    "geolocation.onetrust.com\n", # for cbs news video player
    "bnc.lt\n", # airbnb links
    "akamai.net\n", # cdn
    "intel.com\n",
    )

def normalize(string):
    # Ignore comments by themselves
    if string.startswith("#"):
        return None
    # If there is no inline comment, keep it as is for now
    if (string.find("#") == -1):
        x = string
    # If there is inline comment, remove it
    else:
        x = string[:string.find("#")] + "\n"
    # Replace tabs with spaces
    x = x.replace("\t", " ")
    # Replace 127.0.0.1 with 0.0.0.0 except for localhost
    if (string.find("localhost") == -1):
        x = x.replace("127.0.0.1", "0.0.0.0")
    # Remove multiple spaces
    x = re.sub(" +", " ", x)
    # Remove trailing spaces
    x = x.replace(" \n", "\n")
    # Insert missing spaces
    if not x.endswith("\n"):
        x += "\n"
    # Final clean up: ignore non-valid lines and whitelisted domains
    if (x != "0.0.0.0\n") and (x != "\n") and (x not in whitelist)\
    and (x.replace("0.0.0.0 ", "") not in whitelist):
        return x

with open("raw-hosts.txt", "r") as f:
    for row in f:
        if normalize(row):
            hosts.append(normalize(row))

with open("raw-simple.txt", "r") as f:
    for row in f:
        if normalize(row):
            hosts.append("0.0.0.0 " + normalize(row))

try:
    with open("custom-hosts.txt", "r") as f:
        for row in f:
            if normalize(row):
                hosts.append(normalize(row))
except FileNotFoundError:
    pass

hosts = set(hosts)
hosts = sorted(list(hosts), key=None, reverse=True)

prev_count = 0
with open("hosts", "r") as f:
    for row in f:
        prev_count += 1

with open("hosts", "w") as f:
    for row in hosts:
        f.write(row)

print("Done, total records:", len(hosts), "previously:", prev_count)

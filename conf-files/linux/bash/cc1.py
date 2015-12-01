#!/usr/bin/python
#
# Usage: cc1.py COMMAND 
# Searches WTF-MAN text file for command and options
# explanation.

import sys
import re

def main():
  with open("../../../text-files/WTF-MAN") as file:
    lines = file.readlines()
  inside = False
  for line in lines:
    if line.startswith(sys.argv[1]):
      inside = True
    elif inside == True and not line.startswith('\t'):
      return
    if inside:
      print(line.rstrip())

if __name__ == '__main__':
  main()

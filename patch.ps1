# Description: This script will patch the SCPT Window.dll to remove the CD check.

# Take in the file path as a parameter
$filePath = $args[0]

# Read the file into a byte array
$bytes = [System.IO.File]::ReadAllBytes($filePath)

# Offset to the byte to change 01EDF2
$offset = 0x01EDF2

# Change from 0x74 to 0x75 (JZ to JNZ)
$bytes[$offset] = 0x75

# Write the byte array back to the file
[System.IO.File]::WriteAllBytes($filePath, $bytes)

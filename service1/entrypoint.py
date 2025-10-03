import sys
import datetime
import os


health_check = os.environ['START_PERIOD_CHECK'] 
print("Service started with " + health_check + " second start period")

lines = sys.stdin.read().splitlines()

if lines and  lines[0].strip() == "timestamp":
    format_type = "timestamp"
else:
    format_type = "iso"

now = datetime.datetime.now(datetime.timezone.utc)

if format_type == "timestamp":
    print(str(int(now.timestamp())))
else:
    print(now.isoformat())
import requests
import sys
from datetime import datetime, timezone

# dodati depends_on i health checks u docker-compose
SERVICE1_URL = "http://service1:8080"

lines = sys.stdin.read().splitlines()
if lines and  lines[0].strip() == "timestamp":
    format_type = "timestamp"
else:
    format_type = "iso"

# call service1 with selected format
# TODO dodati try catch?
response = requests.post(SERVICE1_URL, data=format_type)
timestamp = response.text.strip()

parsed = datetime.fromisoformat(timestamp) if format_type == "iso" else datetime.fromtimestamp(int(timestamp), tz=timezone.utc)
print(parsed.strftime("%Y-%m-%d"))

#test workflow
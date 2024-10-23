```shell
pip install influxdb
```

```python

from influxdb import InfluxDBClient

json_body = [
    {
        "measurement": "cpu_load_short",
        "tags": {
            "host": "server01",
            "region": "us-west"
        },
        "time": "2009-11-10T23:00:00Z",
        "fields": {
            "value": 0.64
        }
    },
    {
        "measurement": "cpu_load_short",
        "tags": {
            "host": "server01",
            "region": "us-west"
        },
        "time": "2009-11-10T23:01:00Z",
        "fields": {
            "value": 0.66
        }
    },
    {
        "measurement": "cpu_load_short",
        "tags": {
            "host": "server01",
            "region": "us-west"
        },
        "time": "2009-11-10T23:02:00Z",
        "fields": {
            "value": 0.63
        }
    },
    {
        "measurement": "cpu_load_short",
        "tags": {
            "host": "server01",
            "region": "us-west"
        },
        "time": "2009-11-10T23:03:00Z",
        "fields": {
            "value": 0.64
        }
    },
    {
        "measurement": "cpu_load_short",
        "tags": {
            "host": "server01",
            "region": "us-west"
        },
        "time": "2009-11-10T23:04:00Z",
        "fields": {
            "value": 0.65
        }
    }
]

client = InfluxDBClient('192.168.150.143', 8086, 'influxuser', 'Qwertzuiop123456!', 'example')

client.create_database('example')

client.write_points(json_body)

result = client.query('select value from cpu_load_short;')

print("Result: {0}".format(result))
```
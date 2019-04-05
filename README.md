# Simple MQTT Client

This simple Client can run on a Gigabyte BG-BACE-3150 to publish the temperatur of CPU0 via MQTT.
The temperartue will be updated every 10 seconds.

## Dependencies
- mosquito\_pub from package mosquito-client
- lm-sensors

## Messages

### online
| part | value |
| ---- | ----- |
| topic | $hw/events/device/\<id\>/state/update |
| message | {"state":"online"}

### update values
| part | value |
| ---- | ----- |
| topic | $hw/events/device/\<id\>/twin/update |
| message | {"Temp":{"actual":{"value":43.000},"metadata":{"type":"Updated"}}} |

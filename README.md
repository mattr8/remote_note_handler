## Description
Receive notes from another device over MQTT. The message recevied to the topic should be JSON containing the key-value pairs:
- tst: the UNIX timestamp value of note creation
- message: the base64 encoded note

## Configuration

Create a `.env` file at the root of this project's directory and set the following variables:
- MQTT_TOPIC
- MQTT_HOST
- MQTT_PORT
- MQTT_USER
- MQTT_PW
- MQTT_CLIENT_ID

## Build and run the docker container
```
docker build -t remote-note-handler .
docker run -d --name remote-note-handler --restart unless-stopped -v {PATH_TO_NOTES_FOLDER}:/app/pending remote-note-handler
```

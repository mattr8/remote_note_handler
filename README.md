## Description
Send notes to your another device over MQTT. The message recevied to the topic should be JSON containing the keys:
- tst (for timestamp)
- message (which will contain the note)

## Build and run the docker container
```
docker build -t remote-note-handler .
docker run -d --name remote-note-handler --restart unless-stopped -v {PATH_TO_NOTES_FOLDER}:/app/pending remote-note-handler
```

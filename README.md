# m4b-builder

A docker container for converting prose to an m4b using [KittenTTS 2](https://huggingface.co/KittenML/kitten-tts-2).

## Running

```txt
usage: python . [-h] [-o OUTPUT] [-v] [-r REFERENCE] [-t REFERENCE_TRANSCRIPT]
                prose

An example CLI tool.

positional arguments:
  prose                 Name of the file to process

options:
  -h, --help            show this help message and exit
  -o, --output OUTPUT   Output file path
  -v, --verbose         Increase output verbosity
  -r, --reference REFERENCE
                        The reference wav file
  -t, --reference-transcript REFERENCE_TRANSCRIPT
                        The transcript of the reference audio
```

### Using Python

You can pass a string of text as the `prose` argument:

```sh
python . "Hello World" # creates out/output.wav
```

You can also use a `.txt` file as the `prose` argument:

```sh
# Write some prose to convert
echo "This is a line of text" >|prose.txt
python . prose.txt
```

### Using Docker

### Using Docker Compose

```sh
# Write some prose to convert
echo "This is a line of text" >|prose.txt

# Run the container against the prose
docker compose run \
  -e OUT_OWNER="$(id -u):$(id -g)" \
  -v ./prose.txt:/app/prose.txt:ro \
  record
```

## Building

You can build the docker container using docker-compose:

```sh
docker compose build
```

## Credits

TBD

## License

See [LICENSE](/LICENSE).

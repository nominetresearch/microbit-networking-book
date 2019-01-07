## mkdocs notes for micro:bit networking book

- package available  
`$ dnf install mkdocs`  
but this isn't very recent

- install with pip  
```pip install --user mkdocs```

directory structure:

- need to move everything to ./docs (seems to be an absolute requirement!)
- output document gets generated in ./site

- `(cd .. && mkdocs new microbit-networking-book)`
- `mkdocs serve`


- wget https://raw.githubusercontent.com/Microsoft/pxt-mkdocs-sample/master/docs/embed.js

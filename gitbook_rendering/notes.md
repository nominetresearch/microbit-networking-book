
# gitbook rendering: scratchpad


# gitbook cli

- install gitbook-cli(TODO put it somewhere else, or do a -g install in docker)  
`$ npm install gitbook-cli`

- install whatever's necessary to render, based on plugins/themes etc in book.json  
- (re-run this if that changes)  
`$ ./node_modules/.bin/gitbook install`

- run local webserver  
`$ ./node_modules/.bin/gitbook serve`

- render to static  
(generates ./_book/ including e.g. ./_book/index.html)  
`$ ./node_modules/.bin/gitbook build`


#### making image captions work properly

need plugin _image-captions_

`![alt text](image_path "Title Text")`




## alternative: offline rendering

simplest possible example for turning text into SVG (the code is "basic")  
`https://makecode.microbit.org/--docs?type=renderblocks&if=foo&code=basic&lang=en&render=1`


"hello world" example  
`https://makecode.microbit.org/--docs?type=renderblocks&if=foo&code=basic.showString(%22Hello%20world%22)&lang=en&render=1`

NB need to URL-encode the javascript

CURL incantation:  
  `curl -d "type=renderblocks&id=foo&lang=en&render=1&code=basic" -X GET "https://makecode.microbit.org/--docs"`
  
... but still need it rendered by a browser to get the .svg

- could use phantomjs??
- could use google-chrome --headless etc

TODO how to extract SVG with all the styling?

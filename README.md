# hubot-catme

A hubot script that fetches random cat images.

This script is based on the [hubot-catme](https://github.com/Emile-Filteau/hubot-catme) script by [Emile Filteau](https://github.com/Emile-Filteau).
It uses an API key so we can have access to all images in The Cat API.

See [`src/catme.coffee`](src/catme.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-catme --save`

Then add **hubot-catme** to your `external-scripts.json`:

```json
["hubot-catme"]
```

## Sample Interaction

```
user1>> hubot cat me
hubot>> http://24.media.tumblr.com/tumblr_mbi8dcCrzo1qlyuwso1_1280.jpg

user1>> hubot cat categories
hubot>> hats
space
funny
sunglasses
boxes
caturday
ties
dream
kittens
sinks
clothes
```

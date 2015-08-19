# hubot-hubot-lunch-at-amica

Hubot chatbot script that tells the menu of today at various Amica restaurants in Finland.
It currently knows only three restaurants Amica Garden, Smarthouse and VTT-Oulu.
If you want to add more, please message me so I can add them.

See [`src/hubot-lunch-at-amica.coffee`](src/hubot-lunch-at-amica.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-lunch-at-amica --save`

Then add **hubot-lunch-at-amica** to your `external-scripts.json`:

```json
[
  "hubot-lunch-at-amica"
]
```

## Sample Interaction

```
user1>> lunch smarthouse
hubot>> Today at smarthouse: ...
```

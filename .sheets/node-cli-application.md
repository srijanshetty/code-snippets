1. Add the following lines to package.json

```json
"preferGlobal": "true",
  "bin": {
    "commandname" : "path/to/command"
  }
```

2. Add the following line to the main script:

```js
#!/use/bin/env node
```

3. Run *npm link* to locally test the command.
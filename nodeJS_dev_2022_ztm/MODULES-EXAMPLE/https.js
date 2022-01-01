const request = require("./request");
const response = require("./response");
// const internals = require("./internals");
// const { send } = require("./internals/request");
// const { read } = require("./internals/response");
// import { send } from "./request.mjs";
// import { read } from "./response.mjs";

function makeRequest(url, data) {
  request.send(url, data);
  return response.read();
}

const responseData = makeRequest("https://google.com", "hello");
console.log(responseData);

console.log(require.cache);

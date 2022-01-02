const { get } = require("https");

const urls = [
  "https://jsonplaceholder.typicode.com/users",
  "https://jsonplaceholder.typicode.com/posts",
  "https://jsonplaceholder.typicode.com/albums",
];

// Promise.all(urls.map(url => {
//     return fetch(url).then(resp => resp.json()) // the Fetch API is not implemented in Node
// })).then(results => {
//   console.log(results[0]);
//   console.log(results[1]);
//   console.log(results[2]);
// });

Promise.all(
  urls.map((url) => {
    get(url, (res) => {
      res.on("data", (chunk) => {
        console.log(`Data chunk: ${chunk}`);
      });
      res.on("end", () => {
        console.log("No more data");
      });
    });
  })
).then((results) => {
  console.log(results[0]);
  //   console.log(results[1]);
  //   console.log(results[2]);
});

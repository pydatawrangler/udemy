const https = require("https");

const urls = [
  "https://jsonplaceholder.typicode.com/users",
  "https://jsonplaceholder.typicode.com/posts",
  "https://jsonplaceholder.typicode.com/albums",
];

async function getUsers() {
  const get = await https
    .get(urls[0], (res) => {
      let data = "";
      res.on("data", (chunk) => {
        data += chunk;
      });
      res.on("end", () => {
        data = JSON.parse(data);
        console.log(data);
      });
    })
    .on("error", (err) => {
      console.log(err.message);
    });
}

getUsers();

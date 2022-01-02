const { get } = require("https");

const urls = [
  "https://jsonplaceholder.typicode.com/users",
  "https://jsonplaceholder.typicode.com/posts",
  "https://jsonplaceholder.typicode.com/albums",
];

const getData = async function () {
  const [users, posts, albums] = await Promise.all(
    urls.map((url) => {
      console.log(url);
      get(url, (res) => {
        let data = "";
        res.on("data", (chunk) => {
          data += chunk;
        });
        res.on("end", () => {
          data = JSON.parse(data);
          //   console.log(data);
        });
      }).on("error", (err) => {
        console.log(err.message);
      });
    })
  );
  console.log("users", users);
  console.log("posts", posts);
  console.log("albums", albums);
};

getData();

// get(url, (res) => {
//     let data = '';
//   res.on("data", (chunk) => {
//     data += chunk;
//   });
//   res.on("end", () => {
//     data = JSON.parse(data);
//   });
// });

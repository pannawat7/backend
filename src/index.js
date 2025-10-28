require('dotenv').config();
const express = require("express");
const stdController = require("./controller/student/student.controller");
const app = express();
app.use(express.json());
app.get("/", (req, res) => {
  res.send("Hello, World!");
});

app.use("/students",stdController)

app.listen(3000, () => {
  console.log("Server is running on http://localhost:3000");
});

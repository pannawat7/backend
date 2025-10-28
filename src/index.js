import 'dotenv/config';
import express, { Request, Response } from "express";
import prisma from "./providers/database/database.provider";
const app = express();
app.use(express.json());
app.get("/", (req, res) => {
  res.send("Hello, World!");
});

app.get("/users", async (req, res) => {
  const users = await prisma.user.findMany();
  res.json({
    message: "Hello Users",
    data: users,
  });
});

app.listen(3000, () => {
  console.log("Server is running on http://localhost:3000");
});

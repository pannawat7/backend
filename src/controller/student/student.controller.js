const express = require("express");

const studentService = require("../../services/student/student.service");
const router = express.Router();

router.post("/", async (req, res) => {
  const newStudent = await studentService.create(req.body);
  res.status(201).json({ newStudent, message: "ok" });
});

router.get("/", async (req, res) => {
  const newStudent = await studentService.findAll();
  res.status(200).json({ newStudent, message: "ok" });
});




module.exports = router
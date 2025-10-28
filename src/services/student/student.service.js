import {studentRepository} from "../../repository/student/student.repository.js"
import bcrypt from'bcrypt';

export const  studentService = {
    create,
    findAll
}


export async function create(student) {
    const hashPassword = await bcrypt.hash(student.password,10)
    const newStudent = await studentRepository.create({
         ...student,
        password : hashPassword
    })
    return newStudent
}

export async function findAll() {
    const student = await studentRepository.findAll()
    return student
}
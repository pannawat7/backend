import prisma from "../../providers/database/database.provider.js"

export const studentRepository = {
    findAll,
    findById,
    create
}


export async function findAll() {
    const student = await prisma.student.findMany({
        include : {
            classGroup : true
        }
    })
    return (student)
}


export async function findById(id) {
    const student = await prisma.student.findUnique({
        where: {
            id:parseInt(id)
        },
        include : {
            classGroup : true
        }
    })
    return(student)
}

export async function create(studentData) {
    const { student_code,firstname,lastname,id_card ,password,classGroupId} = studentData;
    const student = await prisma.student.create({
        data : {
            student_code:parseInt(student_code),
            firstname,
            lastname,
            id_card:parseInt(id_card),
            password,
            classGroupId:parseInt(classGroupId)
        }
    })
    return(student)
}
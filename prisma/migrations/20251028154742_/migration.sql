-- CreateTable
CREATE TABLE `Student` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_code` INTEGER NOT NULL,
    `firstname` VARCHAR(191) NOT NULL,
    `lastname` VARCHAR(191) NOT NULL,
    `id_card` INTEGER NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `classGroupId` INTEGER NOT NULL,

    UNIQUE INDEX `Student_student_code_key`(`student_code`),
    UNIQUE INDEX `Student_password_key`(`password`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Level` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Teacher` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `techer_code` INTEGER NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `firstname` VARCHAR(191) NOT NULL,
    `lastname` VARCHAR(191) NOT NULL,
    `id_card` INTEGER NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `classGroupId` INTEGER NOT NULL,

    UNIQUE INDEX `Teacher_techer_code_key`(`techer_code`),
    UNIQUE INDEX `Teacher_password_key`(`password`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ClassGroup` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `courseGroupCode` INTEGER NOT NULL,
    `courseGroupName` VARCHAR(191) NOT NULL,
    `level` INTEGER NOT NULL,
    `levelyear` INTEGER NOT NULL,

    UNIQUE INDEX `ClassGroup_courseGroupCode_key`(`courseGroupCode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudyPlan` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `semester` INTEGER NOT NULL,
    `year` INTEGER NOT NULL,
    `classGroupId` INTEGER NOT NULL,
    `subject_id` INTEGER NOT NULL,
    `teacher_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Subject` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `subjectCode` INTEGER NOT NULL,
    `SubjectName` VARCHAR(191) NOT NULL,
    `credit` INTEGER NOT NULL,
    `hour_t` INTEGER NOT NULL,
    `hour_p` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_classGroupId_fkey` FOREIGN KEY (`classGroupId`) REFERENCES `ClassGroup`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Teacher` ADD CONSTRAINT `Teacher_classGroupId_fkey` FOREIGN KEY (`classGroupId`) REFERENCES `ClassGroup`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ClassGroup` ADD CONSTRAINT `ClassGroup_level_fkey` FOREIGN KEY (`level`) REFERENCES `Level`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudyPlan` ADD CONSTRAINT `StudyPlan_classGroupId_fkey` FOREIGN KEY (`classGroupId`) REFERENCES `ClassGroup`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudyPlan` ADD CONSTRAINT `StudyPlan_subject_id_fkey` FOREIGN KEY (`subject_id`) REFERENCES `Subject`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudyPlan` ADD CONSTRAINT `StudyPlan_teacher_id_fkey` FOREIGN KEY (`teacher_id`) REFERENCES `Teacher`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

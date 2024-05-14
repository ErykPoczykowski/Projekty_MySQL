CREATE DATABASE IF NOT EXISTS szkola
USE szkola

CREATE TABLE IF NOT EXISTS `School` (
  `idSchool` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `adress` VARCHAR(255) NOT NULL,
  `telefone_number` VARCHAR(11) NOT NULL,
  `mail` VARCHAR(50) NULL,
  `patron` VARCHAR(45) NULL,
  PRIMARY KEY (`idSchool`)
);


CREATE TABLE IF NOT EXISTS `Classrooms` (
  `idClassrooms` INT NOT NULL AUTO_INCREMENT,
  `capacity` INT NOT NULL,
  `School_idSchool` INT NOT NULL,
  PRIMARY KEY (`idClassrooms`),
  CONSTRAINT `fk_Classrooms_School1`
    FOREIGN KEY (`School_idSchool`)
    REFERENCES `School` (`idSchool`)
);

CREATE TABLE IF NOT EXISTS `Teacher` (
  `idTeacher` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `second_name` VARCHAR(45) NULL,
  `Surname` VARCHAR(100) NOT NULL,
  `telefone_number` VARCHAR(11) NOT NULL,
  `identification_number` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idTeacher`)
);

CREATE TABLE IF NOT EXISTS `Class` (
  `idClass` INT NOT NULL AUTO_INCREMENT,
  `identity_letter` VARCHAR(1) NOT NULL,
  `identity_number` VARCHAR(1) NULL,
  PRIMARY KEY (`idClass`)
);

CREATE TABLE IF NOT EXISTS `Lesson` (
  `idLesson` INT NOT NULL AUTO_INCREMENT,
  `day` DATE NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `subject` VARCHAR(45) NOT NULL,
  `Class_idClass` INT NOT NULL,
  `Classrooms_idClassrooms` INT NOT NULL,
  `Teacher_idTeacher` INT NOT NULL,
  PRIMARY KEY (`idLesson`),
  CONSTRAINT `fk_Lesson_Class1`
    FOREIGN KEY (`Class_idClass`)
    REFERENCES `Class` (`idClass`),
  CONSTRAINT `fk_Lesson_Classrooms1`
    FOREIGN KEY (`Classrooms_idClassrooms`)
    REFERENCES `Classrooms` (`idClassrooms`),
  CONSTRAINT `fk_Lesson_Teacher1`
    FOREIGN KEY (`Teacher_idTeacher`)
    REFERENCES `Teacher` (`idTeacher`)
);

CREATE TABLE IF NOT EXISTS `student` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `second_name` VARCHAR(100) NULL,
  `surname` VARCHAR(100) NOT NULL,
  `studentcol` VARCHAR(11) NULL,
  `mail` VARCHAR(50) NULL,
  `identification_number` VARCHAR(11) NOT NULL,
  `Class_idClass` INT NOT NULL,
  PRIMARY KEY (`idstudent`),
  CONSTRAINT `fk_student_Class1`
    FOREIGN KEY (`Class_idClass`)
    REFERENCES `Class` (`idClass`)
);

CREATE TABLE IF NOT EXISTS `Grade` (
  `idGrade` INT NOT NULL AUTO_INCREMENT,
  `id_subject` INT NULL,
  `grade` INT NOT NULL,
  `grade_mark` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idGrade`)
);

CREATE TABLE IF NOT EXISTS `Parent` (
  `idParent` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `second_name` VARCHAR(100) NULL,
  `surname` VARCHAR(100) NOT NULL,
  `telefone_number` VARCHAR(11) NOT NULL,
  `mail` VARCHAR(30) NULL,
  PRIMARY KEY (`idParent`)
);

CREATE TABLE IF NOT EXISTS .`School_employees` (
  `idSchool_employees` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `second_name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NOT NULL,
  `telefone_number` VARCHAR(45) NOT NULL,
  `identification_number` VARCHAR(11) NOT NULL,
  `School_idSchool` INT NOT NULL,
  PRIMARY KEY (`idSchool_employees`),
  CONSTRAINT `fk_School_employees_School`
    FOREIGN KEY (`School_idSchool`)
    REFERENCES `School` (`idSchool`)
);

CREATE TABLE IF NOT EXISTS `student_has_Grade` (
  `student_idstudent` INT NOT NULL,
  `Grade_idGrade` INT NOT NULL,
  PRIMARY KEY (`student_idstudent`, `Grade_idGrade`),
  CONSTRAINT `fk_student_has_Grade_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `student` (`idstudent`),
  CONSTRAINT `fk_student_has_Grade_Grade1`
    FOREIGN KEY (`Grade_idGrade`)
    REFERENCES `Grade` (`idGrade`)
);

CREATE TABLE IF NOT EXISTS `student_has_Parent` (
  `student_idstudent` INT NOT NULL,
  `Parent_idParent` INT NOT NULL,
  PRIMARY KEY (`student_idstudent`, `Parent_idParent`),
  CONSTRAINT `fk_student_has_Parent_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `student` (`idstudent`),
  CONSTRAINT `fk_student_has_Parent_Parent1`
    FOREIGN KEY (`Parent_idParent`)
    REFERENCES `Parent` (`idParent`)
);








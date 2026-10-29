package com.example.studentapi;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class StudentApiApplicationTests {
    @Test
    void testStudentEntity() {
        Student student = new Student();
        student.setName("Aizhigitov Nursultan");
        assertEquals("Aizhigitov Nursultan", student.getName());
    }
}
